library(tidyverse)
library(socviz)

d <- titanic

ggplot(data = titanic, mapping = aes(x = fate, y = percent, fill = sex)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme(legend.position = "top")
        
ggplot(data = titanic, mapping = aes(x = fate, y = percent, fill = sex)) +
  geom_col(position = "dodge") +
  theme(legend.position = "top")

oecd_sum

p <- ggplot(data = oecd_sum,
            mapping = aes(x = year, y = diff, fill = hi_lo))
p + geom_col() + guides(fill = FALSE) + 
  labs(x = NULL, y = "Difference in Years",
       title = "The US Life Expectancy Gap", subtitle = "Difference between US and OECD average life expectancies, 1960-2015",
       caption = "Data: OECD. After a chart by Christopher Ingraham,Washington Post, December 27th 2017.")