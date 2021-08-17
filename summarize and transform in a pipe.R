library(tidyverse)
library(readr)

full_data <- read_csv("full_data.csv")

target <- c ("Rachel Green", "Ross Geller", "Joey Tribbiani", "Chandler Bing", "Monica Geller", "Phoebe Buffay")
fulldata_main <- filter (full_data, speaker %in% target)
fulldata_main <- drop_na(fulldata_main)

emotion_by_speaker <- fulldata_main %>%
  group_by(emotion, speaker)%>%
  summarize(N = n())%>%
  mutate(freq = N / sum(N), pct = round((freq*100),1))

speaker_by_emotion <- fulldata_main %>%
  group_by(emotion, speaker)%>%
  summarize(N = n()) %>%
  mutate(freq = N / sum(N), pct = round((freq*100),1))

emotion_by_speaker
speaker_by_emotion


ggplot(emotion_by_speaker, aes(x = emotion, y = pct, fill = emotion))+
  geom_col()+
  coord_flip()+
  facet_wrap(~ speaker)+
  guides(fill = FALSE)

ggplot(speaker_by_emotion, aes(x = speaker, y = pct, fill = speaker))+
  geom_col()+
  coord_flip()+
  facet_wrap(~ emotion)+
  guides(fill = FALSE)