#' Arrange/reorder rows by variables
#'
#' @description Order rows in ascending or descending order
#'
#' @param .data A data.frame or data.table
#' @param ... Variables to arrange by
#'
#' @export
#'
#' @examples
#' example_dt <- data.table::data.table(
#'   a = c(1,2,3),
#'   b = c(4,5,6),
#'   c = c("a","a","b"))
#'
#' example_dt %>%
#'   dt_arrange(a, -c)
dt_arrange <- function(.data, ...) {
  UseMethod("dt_arrange")
}

#' @export
dt_arrange.data.table <- function(.data, ...) {

  dots <- enexprs(...)

  eval_tidy(expr(
    .data[order(!!!dots)]
  ))
}

#' @export
dt_arrange.data.frame <- function(.data, ...) {
  .data <- as.data.table(.data)

  dt_arrange(.data, ...)
}
