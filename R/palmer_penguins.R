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
             size = 4,
             alpha = 0.5) +
  geom_rug(aes(colour = species),
           outside = TRUE) +
  coord_cartesian(clip = "off") +
  scale_colour_manual(values = c("Adelie" = "darkorange",
                               "Chinstrap" = "purple",
                               "Gentoo" = "cyan4")) +
  labs(title = "Palmer Penguins",
       x = "Bill length (in mm)",
       y = "Bill depth (in mm)") +
  theme_light() +
  theme(axis.title.x = element_text(colour = "#4c5c94", size = 15, margin = margin(t = 10)),
        axis.title.y = element_text(colour = "#4c5c94", size = 15, margin = margin(r = 10)),
        axis.text.x = element_text(colour = "#4c5c94", margin = margin(t = 20)),
        axis.text.y = element_text(colour = "#4c5c94", margin = margin(r = 20)),
        panel.background = element_rect(fill = "#cde4f3"),
        panel.border = element_rect(colour = "#3bc0f9"),
        plot.margin = margin(0, 0, 25, 25),
        panel.grid = element_line(colour = "#e9f5f6"),
        plot.background = element_rect(fill = "#cde4f3"),
        plot.title = element_text(size = 25, colour = "#4c5c94"))
