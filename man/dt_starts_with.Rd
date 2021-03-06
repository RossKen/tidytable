% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/select_helpers.R
\name{dt_starts_with}
\alias{dt_starts_with}
\alias{dt_contains}
\alias{dt_ends_with}
\alias{dt_everything}
\title{Select helpers}
\usage{
dt_starts_with(match)

dt_contains(match)

dt_ends_with(match)

dt_everything()
}
\arguments{
\item{match}{The match for the helper function to use}
}
\description{
These functions allow you to select variables based on their names.
\itemize{
\item \code{dt_starts_with()}: Starts with a prefix
\item \code{dt_starts_with()}: Ends with a suffix
\item \code{dt_contains()}: Contains a literal string
\item \code{dt_everything()}: Matches all variables
}
}
\examples{
example_dt <- data.table::data.table(
  x = 1,
  y = 2,
  double_x = 2,
  double_y = 4)

example_dt \%>\%
  dt_select(dt_starts_with("x"))

example_dt \%>\%
  dt_select(dt_ends_with("y"))
}
