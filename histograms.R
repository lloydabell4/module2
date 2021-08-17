library(tidyverse)
library(readr)
library(socviz)

midwest


ggplot(data = midwest, mapping = aes(x = area))+
  geom_histogram()

ggplot(data = midwest, mapping = aes(x = area))+
  geom_histogram(bins = 10)

oh_wi <- c("OH", "WI")

ggplot(data = subset(midwest, state %in% oh_wi),
       mapping = aes(x=percollege, fill = state))+
  geom_histogram(position = "identity", alpha = 0.4, bins = 20 )

ggplot(data = midwest, mapping = aes(x = area))+
  geom_density()

ggplot(data = midwest, mapping = aes(x = area, fill = state, color = state))+
  geom_density(alpha = 0.3)

ggplot(data = subset(midwest, subset= state %in% oh_wi), mapping = aes(x = area, fill = state, color = state))+
  geom_density(alpha = 0.3, mapping = aes(y = ..scaled..))
