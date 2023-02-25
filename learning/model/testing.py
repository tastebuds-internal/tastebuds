from transformers import AutoModel, AutoTokenizer
import torch

model = AutoModel.from_pretrained("prajjwal1/bert-small")

tokenizer = tokenizer = AutoTokenizer.from_pretrained("bert-base-uncased")

a = model(input_ids=torch.tensor([[7, 6, 0, 0, 1, 3]]))

print("hello")
