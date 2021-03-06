
##### dt_bind_rows()
test_that("bind_rows() works with data.tables", {
  df1 <- data.table(x = c(1,2,3), y = c(3,4,5))
  df2 <- data.table(x = c(1,2,3), y = c(3,4,5))

  bind_df <- df1 %>%
    dt_bind_rows(df2)

  expect_named(bind_df, c("x","y"))
  expect_equal(bind_df$x, c(1,2,3,1,2,3))
  expect_equal(bind_df$y, c(3,4,5,3,4,5))
})

test_that("bind_rows() works with data.frames", {
  df1 <- data.frame(x = c(1,2,3), y = c(3,4,5))
  df2 <- data.frame(x = c(1,2,3), y = c(3,4,5))

  bind_df <- df1 %>%
    dt_bind_rows(df2)

  expect_named(bind_df, c("x","y"))
  expect_equal(bind_df$x, c(1,2,3,1,2,3))
  expect_equal(bind_df$y, c(3,4,5,3,4,5))
})

test_that("bind_rows() works with a list", {
  df1 <- data.table(x = c(1,2,3), y = c(3,4,5))
  df2 <- data.table(x = c(1,2,3), y = c(3,4,5))

  df_list <- list(df1, df2)

  bind_df <- dt_bind_rows(df_list)

  expect_named(bind_df, c("x","y"))
  expect_equal(bind_df$x, c(1,2,3,1,2,3))
  expect_equal(bind_df$y, c(3,4,5,3,4,5))
})


##### dt_bind_cols()
test_that("bind_cols() works with data.tables", {
  df1 <- data.table(x = c(1,2,3), y = c(3,4,5))
  df2 <- data.table(a = c(1,2,3), b = c(3,4,5))

  bind_df <- df1 %>%
    dt_bind_cols(df2)

  expect_named(bind_df, c("x","y","a","b"))
  expect_equal(bind_df$x, c(1,2,3))
  expect_equal(bind_df$y, c(3,4,5))
  expect_equal(bind_df$a, c(1,2,3))
  expect_equal(bind_df$b, c(3,4,5))
})

test_that("bind_cols() works with data.frames", {
  df1 <- data.frame(x = c(1,2,3), y = c(3,4,5))
  df2 <- data.frame(a = c(1,2,3), b = c(3,4,5))

  bind_df <- df1 %>%
    dt_bind_cols(df2)

  expect_named(bind_df, c("x","y","a","b"))
  expect_equal(bind_df$x, c(1,2,3))
  expect_equal(bind_df$y, c(3,4,5))
  expect_equal(bind_df$a, c(1,2,3))
  expect_equal(bind_df$b, c(3,4,5))
})

test_that("bind_cols() works with a list", {
  df1 <- data.table(x = c(1,2,3), y = c(3,4,5))
  df2 <- data.table(a = c(1,2,3), b = c(3,4,5))

  df_list <- list(df1, df2)

  bind_df <- dt_bind_cols(df_list)

  expect_named(bind_df, c("x","y","a","b"))
  expect_equal(bind_df$x, c(1,2,3))
  expect_equal(bind_df$y, c(3,4,5))
  expect_equal(bind_df$a, c(1,2,3))
  expect_equal(bind_df$b, c(3,4,5))
})

test_that("duplicate names are fixed", {
  df1 <- data.table(x = c(1,2,3), y = c(3,4,5))
  df2 <- data.table(x = c(1,2,3), y = c(3,4,5))

  df_list <- list(df1, df2)

  bind_df <- dt_bind_cols(df_list)

  expect_named(bind_df, c("x","y","x1","y1"))
  expect_equal(bind_df$x, c(1,2,3))
  expect_equal(bind_df$y, c(3,4,5))
  expect_equal(bind_df$x1, c(1,2,3))
  expect_equal(bind_df$y1, c(3,4,5))
})
