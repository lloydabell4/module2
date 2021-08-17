library(socviz)

by_country <- organdata %>%
  group_by(consent_law, country) %>%
  summarize_if(is.numeric,
               list(~ mean(., na.rm = TRUE),
                    ~ sd(., na.rm = TRUE))) %>%
  ungroup()
by_country

ggplot(data = by_country,
       mapping = aes(x = roads_mean, y = donors_mean))+
  geom_point() +
  geom_text(mapping = aes(label = country))

ggplot(data = by_country,
       mapping = aes(x = roads_mean, y = donors_mean))+
  geom_point() +
  geom_text(mapping = aes(label = country), hjust = 0)

ggplot(data = by_country,
       mapping = aes(x = roads_mean, y = donors_mean))+
  geom_point() +
  geom_text(mapping = aes(x = roads_mean + 1, label = country), hjust = 0)

ggplot(data = by_country,
       mapping = aes(x = roads_mean, y = donors_mean))+
  geom_point() +
  geom_text(mapping = aes(label = country), nudge_x = 5)
