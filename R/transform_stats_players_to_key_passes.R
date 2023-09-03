player_stats_to_key_passes <- function(player_stats) {
  player_stats |>
    dplyr::group_by(match, team) |>
    dplyr::summarize(key_passes = sum(passes_key, na.rm = TRUE)) |>
    dplyr::ungroup()
}
