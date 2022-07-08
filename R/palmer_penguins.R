# Palmer Penguins
# Last updated 2022-07-08

# Load packages ----

library(palmerpenguins)
library(tidyverse)

# Scatter plot ----

ggplot(data = penguins,
       aes(x = bill_length_mm,
           y = bill_depth_mm)) +
  geom_point(aes(colour = species),
             size = 4) +
  scale_colour_manual(values = c("Adelie" = "darkorange",
                               "Chinstrap" = "purple",
                               "Gentoo" = "cyan4")) +
  labs(title = "Palmer Penguins") +
  theme(panel.background = element_rect(fill = "#cde4f3"),
        plot.background = element_rect(fill = "#cde4f3"),
        plot.title = element_text(size = 25, colour = "#4c5c94"))
