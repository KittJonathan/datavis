# For all mankind 
# Last updated 2022-07-12

# Load packages ----

library(tidyverse)
library(patchwork)
library(showtext)

# Import fonts ----

font_add_google(name = "Orbitron", family = "orbitron")
font_add_google(name = "Monoton", family = "monoton")
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
                  8.5, 8.5, 8.1, 8.9, 8.3, 8.2, rep(NA, 4))
)

# Plot ----

# https://www.ascistance.co.uk/blog/network/hello-world/

s1 <- d1 %>%
  filter(season == 1) %>% 
  mutate(label = paste0(episode_nb, " - ", episode_title)) %>% 
  mutate(label = fct_rev(fct_inorder(label)))

s2 <- d1 %>%
  filter(season == 2) %>%
  mutate(label = paste0(episode_nb, " - ", episode_title)) %>%
  mutate(label = fct_rev(fct_inorder(label)))

s3 <- d1 %>%
  filter(season == 3) %>%
  mutate(label = paste0(episode_nb, " - ", episode_title)) %>%
  mutate(label = fct_rev(fct_inorder(label)))

(p1 <- ggplot(data = s1) +
  geom_text(mapping = aes(x = 2.5, y = episode_nb,
                          label = label),
            family = "orbitron", hjust = 0, colour = "white", size = 10) +
  geom_rect(mapping = aes(xmin = 0, xmax = episode_duration_min,
                          ymin = episode_nb - 0.35, ymax = episode_nb + 0.35),
            fill = "#a69ca2", alpha = 0.5) +
  geom_text(mapping = aes(x = episode_duration_min + 1, y = episode_nb,
                          label = paste0(episode_duration_min, " min")),
            family = "orbitron", hjust = 0, colour = "white", size = 10) +
  annotate(geom = "text", x = 85, y = 5.5, label = "SEASON     1", family = "monoton", colour = "#a69ca2", size = 35, alpha = 0.75) +
  scale_y_reverse() +
  xlim(c(0, 100)) +
  theme_void() +
  theme(panel.background = element_rect(fill = "#0d0d0d"),
        plot.background = element_rect(fill = "#0d0d0d"))
)

ggsave("figs/famk01.png", p1, dpi = 320, width = 12, height = 6)

(p2 <- ggplot(data = s2) +
  geom_text(mapping = aes(x = 2.5, y = episode_nb,
                          label = label),
            family = "orbitron", hjust = 0, colour = "white", size = 15) +
  geom_rect(mapping = aes(xmin = 0, xmax = episode_duration_min,
                          ymin = episode_nb - 0.25, ymax = episode_nb + 0.25),
            fill = "#d5f2f2", alpha = 0.5) +
  geom_text(mapping = aes(x = episode_duration_min + 1, y = episode_nb,
                          label = paste0(episode_duration_min, " min")),
            family = "orbitron", hjust = 0, colour = "white", size = 15) +
  annotate(geom = "text", x = 85, y = 5.5, label = "SEASON     2", family = "monoton", colour = "#d5f2f2", size = 35, alpha = 0.75) +
  scale_y_reverse() +
  xlim(c(0, 100)) +
  theme_void() +
  theme(panel.background = element_rect(fill = "#30588c"),
        plot.background = element_rect(fill = "#30588c"))
)

(p3 <- ggplot(data = s3) +
    geom_text(mapping = aes(x = 2.5, y = episode_nb,
                            label = label),
              family = "orbitron", hjust = 0, colour = "white", size = 15) +
    geom_rect(mapping = aes(xmin = 0, xmax = episode_duration_min,
                            ymin = episode_nb - 0.25, ymax = episode_nb + 0.25),
              fill = "#f2bd1d", alpha = 1) +
    geom_text(mapping = aes(x = episode_duration_min + 1, y = episode_nb,
                            label = paste0(episode_duration_min, " min")),
              family = "orbitron", hjust = 0, colour = "white", size = 15) +
    annotate(geom = "text", x = 85, y = 5.5, label = "SEASON     3", family = "monoton", colour = "#f2bd1d", size = 35, alpha = 0.75) +
    scale_y_reverse() +
    xlim(c(0, 100)) +
    theme_void() +
    theme(panel.background = element_rect(fill = "#bf5111"),
          plot.background = element_rect(fill = "#bf5111"))
)

ggsave("figs/famk02.png", p2, dpi = 320, width = 12, height = 6)

p <- p1 / p2 / p3

ggsave("figs/famk.png", p, dpi = 320, width = 12, height = 6)
  

(p1 <- ggplot(data = s1) +
  geom_vline(aes(xintercept = mean(imdb_rating))) +
  geom_segment(aes(x = mean(imdb_rating), xend = imdb_rating,
                     y = label, yend = label)) +
  geom_rect(aes(xmin = 7, xmax = 10,
                ymin = as.numeric(label) - 0.25,
                ymax = as.numeric(label) + 0.25),
            alpha = 0.15) +
    geom_point(aes(x = imdb_rating,
                   y = label),
               shape = 21,
               size = 12,
               fill = "white") +
    geom_text(aes(x = imdb_rating, y = label, label = imdb_rating),
              family = "orbitron") +
  xlim(c(7, 10)) +
  theme(axis.title.y = element_blank(),
        axis.ticks = element_blank(),
        axis.text.y = element_text(family = "orbitron",
                                   hjust = 0)))

(p2 <- ggplot(data = s2) +
    geom_point(aes(x = imdb_rating,
                   y = label)) +
    geom_vline(aes(xintercept = mean(imdb_rating))) +
    geom_segment(aes(x = mean(imdb_rating), xend = imdb_rating,
                     y = label, yend = label)) +
    xlim(c(7, 10)) +
    theme(axis.text.y = element_text(hjust = 0)))

(p3 <- ggplot(data = s3) +
    geom_point(aes(x = imdb_rating,
                   y = label)) +
    geom_vline(aes(xintercept = mean(imdb_rating, na.rm = TRUE))) +
    geom_segment(aes(x = mean(imdb_rating, na.rm = TRUE), xend = imdb_rating,
                     y = label, yend = label)) +
    xlim(c(7, 10)) +
    theme(axis.text.y = element_text(hjust = 0)))

p1 / p2 / p3




ggplot(data = s1) +
  geom_line(aes(y = episode_nb,
                x = imdb_rating)) +
  geom_text(aes(x = 5, y = episode_nb,
                label = paste0(episode_nb, ". ", episode_title)),
            hjust = 0) +
  scale_y_reverse()

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
