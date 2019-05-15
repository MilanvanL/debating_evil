###################
# This R-script is used for the analysis of parliamentary data in:
# Debating Evil: Using Word Embeddings to Analyse Parliamentary Debates on War Criminals in the Netherlands 
# Authors: Ralf Futselaar and Milan van Lange
# NIOD Institute for War, Holocaust, and Genocide Studies
# 2019
# Email: m.van.lange@niod.knaw.nl 
###################

# Recommended version of R (Windows): R version 3.3.3 (2017-03-06) -- "Another Canoe"

# Install Packages --------------------------------------------------------

install.packages('devtools')
library(devtools)
install.packages('magrittr')
devtools::install_github("bmschmidt/wordVectors") # See also: https://github.com/bmschmidt/wordVectors 

# Load Packages -----------------------------------------------------------

library(wordVectors)
library(magrittr)

# Set WD and load files --------------------------------------------------------------

# Set working directory 
setwd("YOUR/PATH/HERE")

# Read binary vector files (.bin) from your working directory
vec4555 <- read.binary.vectors("vecs_1945-55.bin")
vec6575 <- read.binary.vectors("vecs_1965-75.bin") 

# Define Word Groups ------------------------------------------------------

# War criminal
OM <- c("oorlogmisdadiger", "oorlogsmisdadigers")

# Victims
SL <- c("slachtoffer", "slachtoffers") 

# Treason/traitor
TR <- c("landverrader", "landverraders", "verrader", "verraders", "landverraad")

# Life imprisonment
LI <- c("levenslang","levenslange","vrijheidsstraf","gevangenisstraffen","gevangenisstraf", "opsluiting", "hechtenis")

# Death penalty
DP <- c("doodstraf", "doodstraffen")

# Calculate cosine similarities for treason and victim -------------------------------------------

# Define war criminal discourse (1945-1955) by creating list of 250 nn's 
misd_words_4555 = vec4555 %>% nearest_to(vec4555[[OM]],250) %>% names
sample(misd_words_4555,5) # Have a look at the nn's
misds_4555 = vec4555[rownames(vec4555) %in% misd_words_4555,]

# Compare vector space of war cirminal-discourse with that of victim and traitor words
Similarity_victim_vector = misds_4555 %>% cosineSimilarity(vec4555[[SL]])
Similarity_treason_vector = misds_4555 %>% cosineSimilarity(vec4555[[TR]])

# Do the same for 1965-1975
misd_words_6575 = vec6575 %>% nearest_to(vec6575[[OM]],250) %>% names
sample(misd_words_6575,5)
misds_6575 = vec6575[rownames(vec6575) %in% misd_words_6575,]

SL_score_6575 = misds_6575 %>% cosineSimilarity(vec6575[[SL]])
TR_score_6575 = misds_6575 %>% cosineSimilarity(vec6575[[TR]])

# Plot Figure 1: Top 250 war criminal related words 1945-1955 (grey) and 1965-1975 (black) plotted by their cosine similarity to victim (x) and traitor (y) words.  -------------------------------------------------------------------

# Set working directory to store output as PDF-file
setwd("YOUR/PATH/HERE")

# Create PDF-file, open connection
pdf('vic_trait_1.pdf', width=12, height=12)

# Make the plot
par(mfrow=c(1,1), cex=0.8)
plot(Similarity_victim_vector,Similarity_treason_vector,type='n',
     xlim=c(0.1,0.9), ylim=c(0.1,1.0),
     xlab='CosineSimilarity victim words - war criminal words', 
     ylab='CosineSimilarity treason words - war criminal words',
     main="Closeness of 250 war criminal related words in vector space (1945-1955 & 1965-1975)",
     cex.main=1.5, cex.lab=1.5
     )
  # Plot word positions
  points(Similarity_victim_vector,Similarity_treason_vector, pch=17, col = 'grey')
  points(SL_score_6575,TR_score_6575, pch=16, col = 'black')
  
  # Plot ablines
  abline(h=mean(Similarity_treason_vector), v=mean(Similarity_victim_vector), col='grey')
  abline(h=mean(TR_score_6575), v=mean(SL_score_6575), col='black')

  # Add legend
  legend('topleft', legend=c("1945-1955", "1965-1975"),  
  col=c('grey', 'black'), pch=c(17,16), lwd=8, cex=2)
      
# Close connection
dev.off()
      
# Calculate cosine similarities for death penalty and life imprisonment -------------------------------------------

# Compare vector space of war cirminal-discourse with that of LI and DP words
Similarity_LI_vector = misds_4555 %>% cosineSimilarity(vec4555[[LI]])
Similarity_DP_vector = misds_4555 %>% cosineSimilarity(vec4555[[DP]])

# Do the same for 1965-1975
LI_score_6575 = misds_6575 %>% cosineSimilarity(vec6575[[LI]])
DP_score_6575 = misds_6575 %>% cosineSimilarity(vec6575[[DP]])

# Plot Figure 2: Top 250 war criminal related words 1945-1955 (grey) and 1965-1975 (black) plotted by their cosine similarity to life imprisonment (x) and death sentence words (y). --------------------------------
   
# Set working directory to store output as PDF-file
setwd("YOUR/PATH/HERE")
      
# Create PDF-file, open connection
pdf('dp_li_1.pdf', width=12, height=12)
      
# Make the plot
par(mfrow=c(1,1), cex=0.8)
plot(Similarity_LI_vector,Similarity_DP_vector,type='n',
    xlim=c(0.1,0.9), ylim=c(0.1,1.0),
    xlab='CosineSimilarity life imprisonment words - war criminal words', 
    ylab='CosineSimilarity death penalty words - war criminal words',
    main="Closeness of 250 war criminal related words in vector space (1945-1955 & 1965-1975)",
    cex.main=1.5, cex.lab=1.5
    )
  # Plot word positions
  points(Similarity_LI_vector,Similarity_DP_vector, pch=17, col = 'grey')
  points(LI_score_6575,DP_score_6575, pch=16, col = 'black')
      
  # Plot ablines
  abline(h=mean(Similarity_DP_vector), v=mean(Similarity_LI_vector), col='grey')
  abline(h=mean(DP_score_6575), v=mean(LI_score_6575), col='black')
      
  # Add legend
  legend('topleft', legend=c("1945-1955", "1965-1975"),  
          col=c('grey', 'black'), pch=c(17,16), lwd=8, cex=2)
      
# Close connection
dev.off()


# End of script      
###################