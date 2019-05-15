###################
# This R-script is used for the training of WEMs with parliamentary data in:
# Debating Evil: Using Word Embeddings to Analyse Parliamentary Debates on War Criminals in the Netherlands 
# Authors: Ralf Futselaar and Milan van Lange
# NIOD Institute for War, Holocaust, and Genocide Studies
# 2019
# Email: m.van.lange@niod.knaw.nl 
###################

# Recommended version of R (Windows): R version 3.3.3 (2017-03-06) -- "Another Canoe"
# We highly reccomend you to start with a pre-processed corpus/dataset that is stored as .txt-file

# Install Packages --------------------------------------------------------

install.packages('devtools')
library(devtools)
devtools::install_github("bmschmidt/wordVectors") # See also: https://github.com/bmschmidt/wordVectors 

# Load Packages -----------------------------------------------------------
library(wordVectors)

# Load data, train model --------------------------------------------------

# Set working directory to folder with the .txt-file/corpus
setwd("YOUR/PATH/HERE")

# Train word2vec models, please check parameters first!
train_word2vec("corpus_1945-55.txt", output_file = "vecs_1945-55.bin", vectors = 100, threads = '4', min_count = 5, force=T)
train_word2vec("corpus_1965-75.txt", output_file = "vecs_1965-75.bin", vectors = 100, threads = '4', min_count = 5, force=T)

# End of script
###################