iris <- datasets::iris

check_mutate <- function() {
  iris |>
    dplyr::mutate(sepmean = mean(.data$Sepal.Length))
}

check_mutate_by <- function() {
  iris |>
    dplyr::mutate(sepmean = mean(.data$Sepal.Length),
                  .by = tidyselect::all_of("Species"))
}

check_mutate_by_char <- function() {
  iris |>
    dplyr::mutate(sepmean = mean(.data$Sepal.Length),
                  .by = "Species")
}

check_mutate_groupby <- function() {
  iris |>
    dplyr::group_by(.data$Species) |>
    dplyr::mutate(sepmean = mean(.data$Sepal.Length)) |>
    dplyr::ungroup()
}

check_mutate_across_where <- function() {
  iris |>
    dplyr::mutate(dplyr::across(dplyr::where(is.numeric), mean))
}

check_mutate_across <- function() {
  iris |>
    dplyr::mutate(dplyr::across(
      tidyselect::all_of(c("Sepal.Length", "Sepal.Width")),
      mean
    ))
}

check_summarise_by <- function() {
  iris |>
    dplyr::summarise(
      sepmean = mean(.data$Sepal.Length),
      .by = tidyselect::all_of("Species")
    )
}

check_summarise_by_char <- function() {
  iris |>
    dplyr::summarise(
      sepmean = mean(.data$Sepal.Length),
      .by = "Species"
    )
}

check_select <- function() {
  iris |>
    dplyr::select(tidyselect::all_of(c("Sepal.Length", "Species")))
}

check_select_tidy <- function() {
  iris |>
    dplyr::select(tidyselect::starts_with("Sepal"))
}

check_select_char <- function() {
  iris |>
    dplyr::select("Species")
}

check_select_char_minus <- function() {
  iris |>
    dplyr::select(-"Species")
}

check_select_char2 <- function() {
  iris |>
    dplyr::select(c("Sepal.Length", "Species"))
}

check_select_char2_noc <- function() {
  iris |>
    dplyr::select("Sepal.Length", "Species")
}

check_select_rename <- function() {
  iris |>
    dplyr::select(c("Sepal.Length", "Species"), pl = "Petal.Length")
}

check_select_tidymix <- function() {
  iris |>
    dplyr::select(tidyselect::all_of(c("Sepal.Length", "Species")),
                  tidyselect::starts_with('Petal'))
}

check_select_minus <- function() {
  iris |>
    dplyr::select(-tidyselect::all_of("Species"))
}

check_rename <- function() {
  iris |>
    dplyr::rename(sepal_length = tidyselect::all_of("Sepal.Length"))
}

check_left_join <- function() {
  irsum <- iris |>
    dplyr::summarise(
      sepmean = mean(.data$Sepal.Length),
      .by = tidyselect::all_of("Species")
    )

  iris |>
    dplyr::left_join(irsum)
}

check_left_join_by <- function() {
  irsum <- iris |>
    dplyr::summarise(
      sepmean = mean(.data$Sepal.Length),
      .by = tidyselect::all_of("Species")
    ) |>
    dplyr::rename(species = tidyselect::all_of("Species"))

  iris |>
    # .data fails, x$ and y$ work, but throw the global variable note
    # dplyr::left_join(irsum, by = dplyr::join_by(x$Species == y$species))
    dplyr::left_join(irsum, by = dplyr::join_by("Species" == "species"))
}

check_tidy_nest <- function() {
  iris |>
    dplyr::mutate(qs = list(stats::quantile(.data$Sepal.Length))) |>
    tidyr::unnest(cols = tidyselect::all_of("qs"))
}

check_tidy_nest_longer <- function() {
  iris |>
    dplyr::mutate(qs = list(stats::quantile(.data$Sepal.Length))) |>
    # Needs the `col` argument or gets mad about tidyselect
    tidyr::unnest_longer(col = tidyselect::all_of("qs"))
}

check_case_when <- function() {
  iris |>
    dplyr::mutate(new_sp = dplyr::case_when(
      .data$Species == "setosa" ~ "SETOSA",
      .data$Species == "versicolor" ~ "VERSI",
      .default = .data$Species
    ))
}

check_filter <- function() {
  iris |>
    dplyr::filter(.data$Species == "setosa")
}

check_foreach <- function() {
  i <- NULL
  sw <- foreach::foreach(i = 1:nrow(iris)) %do% {
    iris[i, 'Sepal.Width']
  }
}
