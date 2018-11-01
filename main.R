library(tidyverse)

accounts <- read_csv("following_accounts.csv")

group_by(accounts, instance) %>% 
  summarise(count = n()) %>% 
  filter(count > 1) %>% 
  ggplot(aes(x = fct_reorder(instance, count), y = count, label = count)) +
  geom_bar(stat = "identity") +
  geom_text(size = 4, position = position_stack(vjust = 0.5), color = "white") +
  labs(x = "", y = "", title = "Counts of following accounts per instance",
       subtitle = "Instance with only one following account omitted") +
  theme(axis.text.y = element_text(size = 14)) +
  coord_flip()
