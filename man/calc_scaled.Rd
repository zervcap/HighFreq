% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{calc_scaled}
\alias{calc_scaled}
\title{Scale (standardize) the columns of a \emph{matrix} of data using
\code{RcppArmadillo}.}
\usage{
calc_scaled(mat_rix, use_median = FALSE)
}
\arguments{
\item{\code{mat_rix}}{A \emph{matrix} of data.}

\item{\code{use_median}}{A \emph{Boolean} argument: if \code{TRUE} then the 
centrality (central tendency) is calculated as the \emph{median} and the 
dispersion is calculated as the \emph{median absolute deviation}
(\emph{MAD}).
If \code{use_median} is \code{FALSE} then the centrality is calculated as 
the \emph{mean} and the dispersion is calculated as the \emph{standard
deviation}. (The default is \code{FALSE})}
}
\value{
A \emph{matrix} with the same dimensions as the input
  argument \code{mat_rix}.
}
\description{
Scale (standardize) the columns of a \emph{matrix} of data using
\code{RcppArmadillo}.
}
\details{
The function \code{calc_scaled()} scales (standardizes) the columns
  of the \code{mat_rix} argument using \code{RcppArmadillo}.
  If the argument \code{use_median} is \code{FALSE} (the default), then it
  performs the same calculation as the standard \code{R} function
  \code{scale()}, and it calculates the centrality (central tendency) as the
  \emph{mean} and the dispersion as the \emph{standard deviation}.
  If the argument \code{use_median} is \code{TRUE}, then it calculates the
  centrality as the \emph{median} and the dispersion as the \emph{median
  absolute deviation} (\emph{MAD}).
  
  The function \code{calc_scaled()} uses \code{RcppArmadillo} \code{C++}
  code and is about \emph{5} times faster than function \code{scale()}, for
  a \emph{matrix} with \emph{1,000} rows and \emph{20} columns.
}
\examples{
\dontrun{
# Create a matrix of random data
mat_rix <- matrix(rnorm(20000), nc=20)
scale_d <- calc_scaled(mat_rix=mat_rix, use_median=FALSE)
scale_d2 <- scale(mat_rix)
all.equal(scale_d, scale_d2, check.attributes=FALSE)
# Compare the speed of Rcpp with R code
library(microbenchmark)
summary(microbenchmark(
  Rcpp=calc_scaled(mat_rix=mat_rix, use_median=FALSE),
  Rcode=scale(mat_rix),
  times=100))[, c(1, 4, 5)]  # end microbenchmark summary
}

}
