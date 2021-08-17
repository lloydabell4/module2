ggplot(data = organdata, mapping = aes(x = country, y = donors))+
  geom_boxplot()

ggplot(data = organdata, mapping = aes(x = country, y = donors))+
  geom_boxplot() +
  coord_flip()

ggplot(data = organdata, mapping = aes(x = reorder(country, donors, na.rm=TRUE), y = donors))+
  geom_boxplot()+
  labs(x = NULL)+
  coord_flip()

ggplot(data = organdata, mapping = aes(x = reorder(country, donors, na.rm=TRUE), 
                                       y = donors,
                                       fill = world))+
  geom_boxplot()+
  labs(x = NULL)+
  coord_flip()+
  theme(legend.position = "top")

ggplot(data = organdata, mapping = aes(x = reorder(country, donors, na.rm=TRUE), 
                                       y = donors,
                                       color = world))+
  geom_point()+
  labs(x = NULL)+
  coord_flip()+
  theme(legend.position = "top")

ggplot(data = organdata, mapping = aes(x = reorder(country, donors, na.rm=TRUE), 
                                       y = donors,
                                       color = world))+
  geom_jitter()+
  labs(x = NULL)+
  coord_flip()+
  theme(legend.position = "top")

ggplot(data = organdata, mapping = aes(x = reorder(country, donors, na.rm=TRUE), 
                                       y = donors,
                                       color = world))+
  geom_jitter(position = position_jitter(width = 0.15))+
  labs(x = NULL)+
  coord_flip()+
  theme(legend.position = "top")
