describe("Make summary of key passes", {
  it("First example", {
    player_stats <- readr::read_csv("/workdir/tests/data/statisitcs_players_262_2022.csv", show_col_types = FALSE)
    expected <- readr::read_csv("/workdir/tests/data/key_passes.csv", show_col_types = FALSE)
    obtained <- player_stats_to_key_passes(player_stats)
    expect_equal(obtained, expected)
  })
})

describe("Transform match stats to tidy", {
  it("First example", {
    player_stats <- readr::read_csv("/workdir/tests/data/statistics_262_2022_part.csv", show_col_types = FALSE)
    expected <- readr::read_csv("/workdir/tests/data/statistics_262_2022_part_tidy.csv", show_col_types = FALSE)
    obtained <- match_stats_to_tidy_match(player_stats)
    expect_equal(obtained, expected)
  })
})
