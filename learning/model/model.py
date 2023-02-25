from sqlalchemy import false
from datasets import load_from_disk
import json
from transformers import AutoModel, AutoTokenizer
from abc import ABC, abstractmethod
import torch
import warnings
import os
from tqdm import tqdm

from xarray import load_dataset


class Model(ABC):
    @abstractmethod
    def forward(self, **kwargs):
        pass

    def infer(self, *args, **kwargs):
        raise NotImplementedError("infer Not Implemented in this Class")
        pass

    def __call__(self, *args, **kwargs):
        return self.forward(**kwargs)

    @property
    def model(self):
        return self._model

    # @abstractmethod
    # def train(self, **kwargs):
    #     pass


class BertModel(Model):
    """
    This model instantiates and loades the bert/small from huggingface.
    """

    BERT_MODEL = "prajjwal1/bert-small"
    TOKENIZER = "bert-base-uncased"
    MAX_TOKEN_LENGTH = 512

    def __init__(self, bert_path="./bert_small/") -> None:
        super().__init__()
        self.bert = AutoModel.from_pretrained(pretrained_model_name_or_path=bert_path)
        self.tokenizer = AutoTokenizer.from_pretrained(bert_path)
        self._model = None

    def forward(self, input_string, list_input=False):
        """
        Perform inference for a single string of text
        """
        with torch.no_grad():
            if list_input == False:
                a = self.bert(
                    torch.IntTensor(
                        self.tokenizer(input_string)["input_ids"][
                            : BertModel.MAX_TOKEN_LENGTH
                        ]
                    ).unsqueeze(0)
                )
                return a
            else:
                return self.bert(
                    torch.IntTensor(
                        self.tokenizer(input_string)["input_ids"][
                            : BertModel.MAX_TOKEN_LENGTH
                        ]
                    )
                )


class ServiceModel(Model):
    def __init__(self) -> None:
        super().__init__()
        self._model = None

    def forward(self):
        pass

    def train(self):
        pass


class ServiceAgent(Model):
    """
    This class implements the Service Agent:
    The service agent searches through the body of a review (in db format) and returns the sentence that contains review.
    """

    def __init__(self) -> None:
        self._model = BertModel()
        self._gen_corpus()

    @staticmethod
    def _load_dataset(dataset_path, text_only=False):
        # set text only to return list in json format where each index has "score", "text"
        with open(os.path.join(dataset_path, "server.json"), "r") as f:
            server = json.load(f)

        with open(os.path.join(dataset_path, "normal.json"), "r") as f:
            normal = json.load(f)

        print(f"Server: {len(server)} | Normal: {len(normal)}")

        if text_only:
            return [s["text"] for s in server], [n["text"] for n in normal]
        return server, normal

    def _gen_corpus(self, dataset_path="./yelp_dataset/1k/", equal_size=True):
        if dataset_path:
            server, normal = ServiceAgent._load_dataset(
                dataset_path=dataset_path, text_only=True
            )
        else:
            pass
        size = max(len(server), len(normal))
        if equal_size:
            size = min(len(server), len(normal))
        self.positive_corpus = torch.stack(
            [self.model(input_string=s).pooler_output for s in tqdm(server[:size])]
        ).squeeze()
        self.negative_corpus = torch.stack(
            [self.model(input_string=s).pooler_output for s in tqdm(normal[:size])]
        ).squeeze()

    def forward(self, input_string):
        input_encoded = self.model(
            input_string=input_string
        ).pooler_output.squeeze()  # [512]
        pos_dot = torch.matmul(self.positive_corpus, input_encoded)
        neg_dot = torch.matmul(self.negative_corpus, input_encoded)

        return pos_dot.mean() > neg_dot.mean()


from transformers import logging

logging.set_verbosity_error()

# os.chdir("./learning/")
s = ServiceAgent()

query_list = [
    "I hated this restaurant and the food was disgusting",
    "the waitress was incredibly nice and I hope that she has a fantastic day",
    "the staff was very helpful and the orange chicken was delicious",
    "The orange chicken was delicious I also liked the bread",
]

for query in query_list:
    print(query)
    print(f"Service Query: {s(input_string=query)}")
    print("=========================")

# server = [
# "I thought the service at this restaurant was quite poor.",
# "Service was good they were friendly and knowledgeable about the dishes, checked in regularly to see how our dinner was going. Loved the hot towels with the finger food and the fresh cut orange to finish the meal.",
# "Excellent food, great staff and service. We loved every single dish. The ribs however were perfection! Sooo craveable.",
# "Starbelly gets 5 stars from my belly. Every dish I had was satisfying. I will drive to SF from Vallejo just to eat here again. The staff was friendly and accommodating and attentive.",
# "Always a reliable place for solid food and nice staff that make you feel comfortable and appreciated",
# ]
# normal = [
#     "Everything we tried was amazing. The gnocchi, the crab cakes, the croquettes & the lasagna as well.",
#     "I still think about the pizza to this day. The pizza with the burrito was one of the closest things to pizza in Italy that I've tried in the US. I would literally come back just for the pizza again.",
#     "Both of the pastas were flavorful and fairly decent (we enjoyed the red pasta more). The calamari wasn't as crunchy as I hoped for it to be but it was still a good appetizer.",
#     "This specific night I decided to try the Toffee Cake, and added a scoop of the seasonal ice cream, which was the Chocolate Caramel Crackle--the two together was AMAZING. I'm going back just for that dessert combo."
#     "My go to is the house made pate - decadent, white bean dip - beautiful, fries with 3 dips - LOVE (goes so well with a martini) and wonderful Starbelly salad. ",
# ]
