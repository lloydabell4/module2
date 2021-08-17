library(ggrepel)
library(socviz)

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
  geom_point()

p + geom_hline(yintercept = 0.5, size = 1.4, color = "gray70") + 
  geom_vline(xintercept = 0.5, size = 1.4, color = "gray70") + 
  geom_point()+
  geom_text_repel()

p + geom_hline(yintercept = 0.5, size = 1.4, color = "gray70") + 
  geom_vline(xintercept = 0.5, size = 1.4, color = "gray70") + 
  geom_point()+
  geom_text_repel()+
  scale_x_continuous(labels = scales::percent) + 
  scale_y_continuous(labels = scales::percent) +
  labs(x = x_label,
       y = y_label,
       title = p_title, subtitle = p_subtitle, caption = p_caption)

ggsave("my_figure.pdf")
ggsave() ggsave("my_figure.png")
ggsave("my_figure.pdf", plot = p5,
       scale = 1.2)
ggsave("figures/my-figure.pdf", plot = p5,
       width = 8, height = 5)

##Labelling Points of Interest
p + geom_hline(yintercept = 0.5, size = 1.4, color = "gray70") + 
  geom_vline(xintercept = 0.5, size = 1.4, color = "gray70") + 
  geom_point()+
  geom_text_repel(data = subset(elections_historic, popular_pct <.4), 
                  mapping = aes(label = winner_label))+
  scale_x_continuous(labels = scales::percent) + 
  scale_y_continuous(labels = scales::percent) +
  labs(x = x_label,
       y = y_label,
       title = p_title, subtitle = p_subtitle, caption = p_caption)

#Write and Draw in the Plot Area
p + geom_hline(yintercept = 0.5, size = 1.4, color = "gray70") + 
  geom_vline(xintercept = 0.5, size = 1.4, color = "gray70") + 
  geom_point()+
  geom_text_repel(data = subset(elections_historic, popular_pct <.4), 
                  mapping = aes(label = winner_label))+
  scale_x_continuous(labels = scales::percent) + 
  scale_y_continuous(labels = scales::percent) +
  annotate(geom = "text", x = .31, y = .6,
           label = "How'd they win?", hjust = 0, color = "red")+
  labs(x = x_label,
       y = y_label,
       title = p_title, subtitle = p_subtitle, caption = p_caption)

p + geom_hline(yintercept = 0.5, size = 1.4, color = "gray70") + 
  geom_vline(xintercept = 0.5, size = 1.4, color = "gray70") + 
  geom_point()+
  geom_text_repel(data = subset(elections_historic, popular_pct <.4), 
                  mapping = aes(label = winner_label))+
  scale_x_continuous(labels = scales::percent) + 
  scale_y_continuous(labels = scales::percent) +
  annotate(geom = "text", x = .31, y = .6,
           label = "How'd they win?", hjust = 0, color = "red")+
  annotate(geom = "rect", xmin = .3, xmax = .4,
           ymin = .65, ymax = .30, fill = "red", alpha = 0.2)+
  labs(x = x_label,
     y = y_label,
     title = p_title, subtitle = p_subtitle, caption = p_caption)
  
  
