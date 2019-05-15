# Debating Evil
This repository contains the code (R) of the paper 'Debating Evil: Using Word Embeddings to Analyse Parliamentary Debates on War Criminals in the Netherlands'.

To replicate our analysis and plotting of the results, you can download the trained .bin-files (vecs_1945-55.bin and vecs_1965-75.bin) and analyse them with the second script (2_analyse_plot_WEMs.R). Of course, you can also train new Word Embedding Models based on your own dataset/.txt-file with the first script (1_train_WEMs.R) and analyse them with the second (2_analyse_plot_WEMs.R). We use the wordVectors package by Benjamin Schmidt and the magrittr forward-pipe operator package by Stefan Milton Bache and Hadley Wickham. 

Our trained models are based on the PoliticalMashup and Dutch Parliamentary Proceedings dataset. 

[b]Data[/b]
Marx, Dr. M. (Informatics Institute, University of Amsterdam); Doornik, Dr. Ir. J. van (Informatics Institute, University of Amsterdam); Nusselder, BSc A. (Informatics Institute, University of Amsterdam); Buitinck, Msc L. (Informatics Institute, University of Amsterdam) (2012): Thematic collection: PoliticalMashup and Dutch Parliamentary Proceedings 1814-2013. DANS. https://doi.org/10.17026/dans-zg8-9x2v 
