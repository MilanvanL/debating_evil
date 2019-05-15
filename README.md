# Debating Evil
This repository contains the code (R) of the paper 'Debating Evil: Using Word Embeddings to Analyse Parliamentary Debates on War Criminals in the Netherlands' by Ralf Futselaar and Milan van Lange.

ABSTRACT: We are proposing a method to investigate changes in historical discourse by using large bodies of text and word embedding models (WEMs). As a case study, we investigate discussions in Dutch Parliament about the punishment of war criminals in the period 1945-1975. We will demonstrate how word embedding models, trained with Google’s Word2Vec algorithm, can be used to trace historical developments in parliamentary vocabulary through time.

A link to a full-text online version of the paper will be posted here soon.

# Code 
To replicate our analysis and plot the results, you can download the trained .bin-files (vecs_1945-55.bin and vecs_1965-75.bin) from the 'releases' page and analyse them with the second script (2_analyse_plot_WEMs.R) in R or RStudio. Of course, you can also train new word embedding models based on your own dataset/.txt-file with the first script (1_train_WEMs.R) and analyse them with the second (2_analyse_plot_WEMs.R). We use the wordVectors package by Benjamin Schmidt and the magrittr forward-pipe operator package by Stefan Milton Bache and Hadley Wickham. 

# Data
Our trained models are based on the PoliticalMashup and Dutch Parliamentary Proceedings dataset. We have used the complete data for the period 1945-1955 and 1965-1975. Because of file size limitations, a smaller sample of the dataset will be uploaded here to test the code.

Marx, Dr. M. (Informatics Institute, University of Amsterdam); Doornik, Dr. Ir. J. van (Informatics Institute, University of Amsterdam); Nusselder, BSc A. (Informatics Institute, University of Amsterdam); Buitinck, Msc L. (Informatics Institute, University of Amsterdam) (2012): Thematic collection: PoliticalMashup and Dutch Parliamentary Proceedings 1814-2013. DANS. https://doi.org/10.17026/dans-zg8-9x2v 
