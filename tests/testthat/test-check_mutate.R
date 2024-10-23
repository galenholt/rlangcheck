rlang::local_options(lifecycle_verbosity = "error")

test_that("check_mutate", {
  check_mutate()
})

test_that("check_mutate_by", {
  check_mutate_by()
})

test_that("check_mutate_groupby", {
  check_mutate_groupby()
})

test_that("check_mutate_across", {
  check_mutate_across()
})

test_that("check_mutate_across_where", {
  check_mutate_across_where()
})

test_that("check_summarise_by", {
  check_summarise_by()
})

test_that("check_select", {
  check_select()
})

test_that("check_select_tidy", {
  check_select_tidy()
})

test_that("check_select_tidymix", {
  check_select_tidymix()
})

test_that("check_select_minus", {
  check_select_minus()
})

test_that("check_rename", {
  check_rename()
})

test_that("check_left_join", {
  check_left_join()
})

test_that("check_left_join_by", {
  check_left_join_by()
})

test_that("check_tidy_nest", {
  check_tidy_nest()
})

test_that("check_tidy_nest_longer", {
  check_tidy_nest_longer()
})

test_that("check_case_when", {
  check_case_when()
})

test_that("check_filter", {
  check_filter()
})
