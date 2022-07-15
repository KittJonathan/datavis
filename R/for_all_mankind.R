# For all mankind 
# Last updated 2022-07-12

# Load packages ----

library(tidyverse)
library(ggnewscale)

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
                  8.5, 8.5, 8.1, 8.9, 8.3, 8.2, rep(NA, 4))
)

# Plot ----

# https://www.ascistance.co.uk/blog/network/hello-world/

s1 <- d1 %>% filter(season == 1)

ggplot(data = s1) +
  geom_line(aes(y = episode_nb,
                x = imdb_rating)) +
  geom_text(aes(x = 5, y = episode_nb, label = episode_title),
            hjust = 0)

ggplot(data = d1) +
  geom_line(aes(x = index,
                y = imdb_rating,
                colour = as.factor(season)))



ggplot(data = s1) +
  geom_tile(aes(x = episode_nb,
                y = 7,
                fill = imdb_rating),
            colour = "white") +
  ylim(c(0, 10)) +
  coord_polar(theta = "x") +
  theme_void()
