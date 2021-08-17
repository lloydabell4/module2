library(tidyverse)
library(readr)

full_data <- read_csv("full_data.csv")

target <- c ("Rachel Green", "Ross Geller", "Joey Tribbiani", "Chandler Bing", "Monica Geller", "Phoebe Buffay")
fulldata_main <- filter (full_data, speaker %in% target)
fulldata_main <- drop_na(fulldata_main)

fulldata_main$season <- as.factor(fulldata_main$season)

ggplot(data = fulldata_main, mapping = aes(x = speaker, fill = emotion)) + 
         geom_bar(position = "dodge", mapping = aes(y = ..prop.., group = emotion)) +
  facet_wrap(~ emotion, ncol = 3) +
  guides(fill=FALSE) + 
  theme(text = element_text(size=10),
        axis.text.x = element_text(angle=45, hjust=1)) 

ggplot(data = fulldata_main, mapping = aes(x = speaker, fill = emotion)) + 
  geom_bar(position = "dodge", mapping = aes(y = ..prop.., group = emotion)) +
  theme(text = element_text(size=10),
        axis.text.x = element_text(angle=45, hjust=1))     