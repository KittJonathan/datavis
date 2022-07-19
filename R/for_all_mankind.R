# For all mankind 
# Last updated 2022-07-19

# Load packages ----

library(tidyverse)
library(showtext)
library(ggforce)


# Import fonts ----

font_add_google(name = "Orbitron", family = "orbitron")
showtext_auto()

# Create dataset ----

# https://www.imdb.com/title/tt7772588/episodes

d1 <- tibble(
  season = rep(1:3, each = 10),
  episode_nb = rep(1:10, times = 3),
  episode_title = c("Red Moon", "He Built the Saturn V", "Nixon's Women", "Prime Crew", "Into the Abyss",
                    "Home Again", "Hi Bob", "Rupture", "Bent Bird", "A City Upon a Hill",
                    "Every Little Thing", "The Bleeding Edge", "Rules of Engagement", "Pathfinder", "The Weight", 
                    "Best-Laid Plans", "Don't be Cruel", "And Here's to You", "Triage", "The Grey",
                    "Polaris", "Game Changer", "All In", "Happy Valley", "Seven Minutes of Terror", "New Eden",
                    "Bring It Down", "The Sands of Ares", "Coming Home", "Stranger in a Strange Land"),
  episode_duration_min = c(65, 62, 62, 63, 62, 62, 59, 57, 48, 76,
                           76, 56, 60, 60, 58, 59, 62, 69, 56, 76,
                           57, 62, 61, 52, 63, 61, 57, rep(NA, 3)),
  imdb_rating = c(7.5, 7.6, 8.0, 7.9, 8.5, 7.7, 8.0, 8.2, 8.8, 8.9,
                  7.9, 7.3, 8.0, 7.6, 7.4, 7.7, 7.7, 7.9, 8.7, 9.5, 
                  8.5, 8.5, 8.1, 8.9, 8.2, 6.9, rep(NA, 4))) %>% 
  mutate(label = paste0(episode_nb, " - ", episode_title)) 

s1 <- d1 %>% 
  filter(season == 1)

# Create plot ----

(p <- ggplot() +
  geom_circle(aes(x0 = -75, y0 = 0, r = 25),
              fill = "#0f2068", colour = NA) +
  geom_circle(aes(x0= 175, y0 = 0, r = 15),
              fill = "#a69ca2", colour = NA) +
  geom_segment(data = s1,
               aes(x = -50, xend = 0,
                   y = 0, yend = seq(-45, 45, 10)),
               colour = "#a69ca2") +
  geom_segment(data = s1,
               aes(x = 0, xend = 15 * imdb_rating,
                   y = rev(seq(-45, 45, 10)), yend = rev(seq(-45, 45, 10))),
               colour = "#a69ca2",
               arrow = arrow(length = unit(0.25, "cm"), type = "closed")) +
  geom_text(data = s1,
            aes(x = (15 * imdb_rating) + 2, y = rev(seq(-45, 45, 10)),
                label = imdb_rating),
            hjust = 0, family = "orbitron", size = 10, colour = "#a69ca2") +
  geom_rect(data = s1,
            aes(xmin = 0, xmax = episode_duration_min + 10,
                ymin = rev(seq(-48, 42, 10)),
                ymax = rev(seq(-42, 48, 10))),
            fill = "#a69ca2") +
  geom_text(data = s1,
            aes(x = 2, y = rev(seq(-45, 45, 10)),
                label = label),
            hjust = 0, family = "orbitron", size = 10) +
  geom_text(data = s1,
            aes(x = episode_duration_min + 8, y = rev(seq(-45, 45, 10)),
                label = paste0(episode_duration_min, " min")),
             hjust = 1, family = "orbitron", size = 8) +
  labs(title = "FOR ALL MANKIND",
       subtitle = "Duration and IMDB ratings for Season 1",
       caption = "Visualisation : Jonathan Kitt | Data source : IMDB") +
  coord_fixed() +
  xlim(-100, 200) +
  ylim(-50, 50) +
  theme_void() +
  theme(panel.background = element_rect(fill = "#0d0d0d", colour = NA),
        plot.background = element_rect(fill = "#0d0d0d", colour = NA),
        plot.title = element_text(family = "orbitron", colour = "#a69ca2",
                                  size = 100, hjust = 0.5, margin = margin(b = 40)),
        plot.subtitle = element_text(family = "orbitron", colour = "#a69ca2",
                                     size = 50, hjust = 0.5, margin = margin(t = -30, b = 40)),
        plot.caption = element_text(family = "orbitron", colour = "#a69ca2",
                                    size = 25, hjust = 0.5))
)

# Export plot ----

ggsave("figs/famk_s01.png", p, dpi = 320, width = 12, height = 6)
