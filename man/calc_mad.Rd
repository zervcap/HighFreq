% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{calc_mad}
\alias{calc_mad}
\title{Calculate the Median Absolute Deviations \emph{MAD} of the columns of a
\emph{time series} or a \emph{matrix} using \code{RcppArmadillo}.}
\usage{
calc_mad(t_series)
}
\arguments{
\item{\code{t_series}}{A \emph{time series} or a \emph{matrix} of data.}
}
\value{
A row vector equal to the Median Absolute Deviations \emph{MAD} of
  the columns of \code{t_series} matrix.
}
\description{
Calculate the Median Absolute Deviations \emph{MAD} of the columns of a
\emph{time series} or a \emph{matrix} using \code{RcppArmadillo}.
}
\details{
The function \code{calc_mad()} calculates the variance of the
  columns of a \emph{time series} or a \emph{matrix} of data using
  \code{RcppArmadillo} \code{C++} code.

  The function \code{calc_mad()} performs the same calculation as the
  function \code{stats::mad}, but it's much faster because it uses
  \code{RcppArmadillo} \code{C++} code.
}
\examples{
\dontrun{
# Calculate VTI returns
re_turns <- na.omit(rutils::etf_env$re_turns[ ,"VTI", drop=FALSE])
# Compare calc_mad() with stats::mad()
all.equal(drop(HighFreq::calc_mad(re_turns)), 
  mad(re_turns))
# Compare the speed of RcppArmadillo with stats::mad()
library(microbenchmark)
summary(microbenchmark(
  Rcpp=HighFreq::calc_mad(re_turns),
  Rcode=mad(re_turns),
  times=10))[, c(1, 4, 5)]  # end microbenchmark summary
}

}
