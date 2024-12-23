% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/periodogram.R
\name{periodogram}
\alias{periodogram}
\title{Estimate the Spectral Density of a Time Series using a Periodogram}
\usage{
periodogram(X, lambda)
}
\arguments{
\item{X}{A numeric or complex atomic vector representing the time series data.
The time series should be stationary,  meaning its mean and covariance function should be independent of time.}

\item{lambda}{A numeric value from the interval \eqn{(- \pi, \pi]} that represents the frequency at which the periodogram is evaluated.}
}
\value{
A numeric value representing the periodogram.
}
\description{
\code{periodogram} computes the periodogram of a given time series, which can be used to estimate the spectral density.
}
\details{
The \strong{periodogram} is a sample-based function from which we obtain estimators of the spectral density.
For a given time series \eqn{\{x_1, \dots, x_n\}}, the periodogram can be computed using the formula:

\deqn{I_n(\lambda) = \displaystyle{\frac{1}{n}} \left| \displaystyle{\sum_{t=1}^n x_t e^{-it\lambda}} \right|^2.}

Within the \code{\link{plot}} function, this function is used to calculate the periodogram
of a given time series for several lambda values in the interval \eqn{(-\pi, \pi]}.
}
\examples{
# Example 1: Periodogram for a simple sine curve
X <- sin(2 * pi * 1:100 / 100)
lambda <- 2 * pi / 100
periodogram(X, lambda)

# Example 2: Periodogram for a complex exponential curve
X <- exp(2 * pi * 1i * 1:100 / 100)
lambda <- 2 * pi / 100
periodogram(X, lambda)

# Example 3: Periodogram for white noise
set.seed(123)
X <- rnorm(100)
lambda <- pi / 4
periodogram(X, lambda)

}
\references{
Brockwell, P.J., Davis, R.A. (2016) \emph{Introduction to Time Series and Forecasting}. Springer.
}
