library(nflfastR)
library(dplyr)
library(ggplot2)
library(scales)

data("teams_colors_logos")



pbp_2024 <- load_pbp(2024)

early_downs <- pbp_2024 %>%
  filter(down %in% c(1, 2),
         play_type %in% c("run", "pass"))

coach_tendencies <- early_downs %>%
  group_by(posteam) %>%
  summarize(
    total_plays = n(),
    pass_plays = sum(play_type == "pass"),
    pass_rate = pass_plays / total_plays
  ) %>%
  arrange(desc(pass_rate))

coach_tendencies_colored <- coach_tendencies %>%
  left_join(teams_colors_logos, by = c("posteam" = "team_abbr"))


ggplot(coach_tendencies_colored, aes(x = reorder(posteam, pass_rate), y = pass_rate, fill = team_color)) +
  geom_col() +
  coord_flip() +
  scale_fill_identity() +  # VERY important - tells ggplot to use the hex colors literally
  scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +
  labs(
    title = "NFL Team Early-Down Pass Rates (2024 Season)",
    x = "Team",
    y = "Pass Rate (%)"
  ) +
  theme_minimal()

#Summary Statistics 

mean(coach_tendencies$pass_rate)

coach_tendencies %>% 
  filter(pass_rate == max(pass_rate))

coach_tendencies %>%
  filter(pass_rate == min(pass_rate))
head(coach_tendencies, 5)   # Top 5
tail(coach_tendencies, 5)   # Bottom 5

summary_stats <- data.frame(
  Metric = c("Average Pass Rate", "Highest Pass Rate Team", "Lowest Pass Rate Team"),
  Result = c(
    paste0(round(mean(coach_tendencies$pass_rate) * 100, 1), "%"),
    paste0(coach_tendencies$posteam[which.max(coach_tendencies$pass_rate)], " — ", round(max(coach_tendencies$pass_rate) * 100, 1), "%"),
    paste0(coach_tendencies$posteam[which.min(coach_tendencies$pass_rate)], " — ", round(min(coach_tendencies$pass_rate) * 100, 1), "%")
  )
)

summary_stats



# Pass rate when leading vs trailing
early_downs %>%
  mutate(score_state = case_when(
    score_differential > 0 ~ "Leading",
    score_differential == 0 ~ "Tied",
    score_differential < 0 ~ "Trailing"
  )) %>%
  group_by(posteam, score_state) %>%
  summarize(pass_rate = mean(play_type == "pass")) %>%
  arrange(posteam, score_state)

pass_rate_by_state <- early_downs %>%
  mutate(score_state = case_when(
    score_differential > 0 ~ "Leading",
    score_differential == 0 ~ "Tied",
    score_differential < 0 ~ "Trailing"
  )) %>%
  group_by(posteam, score_state) %>%
  summarize(pass_rate = mean(play_type == "pass")) %>%
  arrange(posteam, score_state)

ggplot(pass_rate_by_state, aes(x = reorder(posteam, pass_rate), y = pass_rate, fill = score_state)) +
  geom_col(position = "dodge") +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +
  labs(
    title = "NFL Early-Down Pass Rate by Game State (2024)",
    x = "Team",
    y = "Pass Rate (%)",
    fill = "Score State"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
