from datasets import load_dataset

dataset = load_dataset("bookcorpus")

# Save the dataset to a file
directory = "./data/bookcorpus"
dataset.save_to_disk(directory)