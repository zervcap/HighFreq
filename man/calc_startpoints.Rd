% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{calc_startpoints}
\alias{calc_startpoints}
\title{Calculate a vector of start points equal to the lag of a vector of end
points.}
\usage{
calc_startpoints(end_points, look_back)
}
\arguments{
\item{\code{end_points}}{An \emph{unsigned integer} vector of end
points.}

\item{\code{look_back}}{The length of the look-back interval, equal to the
lag applied to the end points.}
}
\value{
An \emph{integer} vector of start points (vector of unsigned
  integers), associated with the vector \code{end_points}.
}
\description{
Calculate a vector of start points equal to the lag of a vector of end
points.
}
\details{
The start points are equal to the values of the vector
  \code{end_points} lagged by an amount equal to \code{look_back}. In
  addition, an extra \code{1} is added to them, to avoid data overlaps.  The
  lag operation requires adding a beginning warmup interval containing
  zeros, so that the vector of start points has the same length as the
  \code{end_points}.
  
  For example, consider the end points for a vector of length \code{25}
  divided into equal intervals of length \code{5}: \code{4, 9, 14, 19, 24}.
  (In \code{C++} the vector indexing is shifted by \code{-1} and starts at
  \code{0} not \code{1}.)
  Then the start points for \code{look_back = 2} are equal to: \code{0, 0, 
  5, 10, 15}.  The differences between the end points minus the
  corresponding start points are equal to \code{9}, except for the warmup
  interval.
}
\examples{
# Calculate end points
end_p <- HighFreq::calc_endpoints(25, 5)
# Calculate start points corresponding to the end points
start_p <- HighFreq::calc_startpoints(end_p, 2)

}
