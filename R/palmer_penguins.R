# Palmer Penguins
# Last updated 2022-07-08

# Load packages ----

library(palmerpenguins)
library(tidyverse)

# Scatter plot ----

(p1 <- ggplot() +
  geom_point(data = penguins,
             aes(x = bill_length_mm,
                 y = bill_depth_mm,
                 colour = species),
             size = 4,
             alpha = 0.5) +
  scale_colour_manual(values = c("Adelie" = "darkorange",
                               "Chinstrap" = "purple",
                               "Gentoo" = "cyan4")) +
  labs(title = "Palmer Penguins",
       x = "Bill length (in mm)",
       y = "Bill depth (in mm)") +
  theme_light() +
  theme(axis.title.x = element_text(colour = "#4c5c94", size = 15),
        axis.title.y = element_text(colour = "#4c5c94", size = 15),
        axis.text.x = element_text(colour = "#4c5c94"),
        axis.text.y = element_text(colour = "#4c5c94"),
        legend.background = element_rect(fill = "#cde4f3"),
        legend.key = element_rect(fill = "#cde4f3"),
        panel.background = element_rect(fill = "#cde4f3"),
        panel.border = element_rect(colour = "#3bc0f9"),
        panel.grid = element_line(colour = "#e9f5f6"),
        panel.grid.minor = element_blank(),
        plot.background = element_rect(fill = "#cde4f3"),
        plot.title = element_text(size = 25, colour = "#4c5c94",
                                  margin = margin(b = 40)))
)

ggsave("figs/p1.png", p1, dpi = 320, width = 12, height = 6)

# Map ----

antarctica <- map_data("world") %>% 
  filter(region == "Antarctica")

ggplot(antarctica) +
  geom_polygon(aes(x = long, y = lat, group = group),
               fill = "#355c7d", colour = "white")
+
  coord_fixed(1.3)
