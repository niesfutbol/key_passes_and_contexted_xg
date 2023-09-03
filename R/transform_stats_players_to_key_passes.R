player_stats_to_key_passes <- function(player_stats) {
  player_stats |>
    dplyr::group_by(match, team) |>
    dplyr::summarize(key_passes = sum(passes_key, na.rm = TRUE)) |>
    dplyr::ungroup()
}

match_stats_to_tidy_match <- function(match_stats) {
  home <- .select_home_metrics(match_stats)
  away <- .select_away_metrics(match_stats)
  rbind(home, away) |>
    dplyr::rename(team_id = id) |>
    dplyr::arrange(-match_id)
}

.select_home_metrics <- function(match_stats) {
  match_stats |>
    dplyr::select(c(match_id, starts_with("home"))) |>
    dplyr::rename(goal = home) |>
    dplyr::mutate(home = TRUE) |>
    dplyr::rename_with(~ gsub("home_", "", .x, fixed = TRUE))
}

.select_away_metrics <- function(match_stats) {
  match_stats |>
    dplyr::select(c(match_id, starts_with("away"))) |>
    dplyr::rename(goal = away) |>
    dplyr::mutate(home = FALSE) |>
    dplyr::rename_with(~ gsub("away_", "", .x, fixed = TRUE))
}

join_tidy_match_and_key_passes <- function(tidy_match, key_passes) {
  tidy_match |>
    dplyr::left_join(key_passes, by = c("match_id" = "match", "team_id" = "team"))
}
