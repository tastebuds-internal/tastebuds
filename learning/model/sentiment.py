from abc import ABC, abstractmethod
from typing import Iterable
import transformers
import torch
from pytorch_lightning import LightningModule


class Model(ABC):
    @abstractmethod
    def infer(self, input: Iterable, **kwargs):
        pass

    def __call__(self, **kwargs):
        return self.infer(**kwargs)


class FoodFinder(Model):
    def __init__(self):
        self.trained = True
