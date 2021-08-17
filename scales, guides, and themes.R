library(ggrepel)
library(socviz)
library(gapminder)

elections_historic %>% select(2:7)

p_title <- "Presidential Elections: Popular & Electoral College Margins" 
p_subtitle <- "1824-2016"
p_caption <- "Data for 2016 are provisional."
x_label <- "Winner's share of Popular Vote"
y_label <- "Winner's share of Electoral College Votes"

theme_set(theme_minimal())

p <- ggplot(data = elections_historic, mapping = aes(x = popular_pct,
                                                     y = ec_pct, label = winner))
p + geom_hline(yintercept = 0.5, size = 1.4, color = "gray70") + 
  geom_vline(xintercept = 0.5, size = 1.4, color = "gray70") + 
  geom_point()+
  geom_text_repel()+
  scale_x_continuous(labels = scales::percent) + 
  scale_y_continuous(labels = scales::percent) +
  labs(x = x_label,
       y = y_label,
       title = p_title, subtitle = p_subtitle, caption = p_caption)

by_country <- organdata %>%
  group_by(world, country, donors) %>%
  summarize_if(is.numeric,
               list(~ mean(., na.rm = TRUE),
                    ~ sd(., na.rm = TRUE))) %>%
  ungroup()
by_country

d <- ggplot(data = by_country,
            mapping = aes(x = roads_mean,
                          y = donors, color = world))
d + geom_point() +
  scale_x_log10() + scale_y_continuous(breaks = c(5, 15, 25),
                                       labels = c("Five", "Fifteen", "Twenty Five"))

e <- ggplot(data = by_country, mapping = aes(x = roads_mean, y = donors, color = world))
e + geom_point() + scale_color_discrete(labels = c("Corporatist", "Liberal","Social Democratic", "Unclassified")) +
  labs(x = "Road Deaths", y = "Donor Procurement",color = "Welfare State")+
  guides(color = FALSE)
