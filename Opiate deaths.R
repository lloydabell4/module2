library(socviz)

edu
data <- edu
yahoo
election
data <- opiates

ggplot(opiates, mapping = aes(y = reorder(division_name, deaths, na.rm = TRUE), 
                              x = deaths))+
  geom_boxplot()

odata <- opiates %>%
  filter(year %in% c("1999","2004","2009","2014"))
  
ggplot(odata, mapping = aes(x = deaths))+
  geom_histogram(aes(alpha = 0.4), binwidth = 250)+
  facet_wrap(~year)+
  labs(title = "Opiate Deaths by Year", y = "N", x = "Deaths (bins = 250)")+
  guides(fill = FALSE, alpha=FALSE)
