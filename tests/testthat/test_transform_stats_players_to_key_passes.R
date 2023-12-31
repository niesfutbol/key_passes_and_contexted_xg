describe("tidy match and key passes", {
  it("First example", {
    player_stats <- readr::read_csv("/workdir/tests/data/statisitcs_players_262_2022.csv", show_col_types = FALSE)
    match_stats <- readr::read_csv("/workdir/tests/data/statistics_262_2022_part.csv", show_col_types = FALSE)
    expected <- readr::read_csv("/workdir/tests/data/match_with_key_passes.csv", show_col_types = FALSE)
    obtained <- match_and_player_stats_to_tidy_match_and_key_passes(match_stats, player_stats)
    expect_equal(obtained, expected)
  })
})

describe("Join tidy match to key passes", {
  it("First example", {
    key_passes <- readr::read_csv("/workdir/tests/data/key_passes.csv", show_col_types = FALSE)
    tidy_match <- readr::read_csv("/workdir/tests/data/statistics_262_2022_part_tidy.csv", show_col_types = FALSE)
    expected <- readr::read_csv("/workdir/tests/data/match_with_key_passes.csv", show_col_types = FALSE)
    obtained <- join_tidy_match_and_key_passes(tidy_match, key_passes)
    expect_equal(obtained, expected)
  })
})

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
    match_stats <- readr::read_csv("/workdir/tests/data/statistics_262_2022_part.csv", show_col_types = FALSE)
    expected <- readr::read_csv("/workdir/tests/data/statistics_262_2022_part_tidy.csv", show_col_types = FALSE)
    obtained <- match_stats_to_tidy_match(match_stats)
    expect_equal(obtained, expected)
  })
})
