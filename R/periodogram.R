#' @title Estimate the Spectral Density of a Time Series using a Periodogram
#'
#' @description
#' `periodogram` computes the periodogram of a given time series, which can be used to estimate the spectral density.
#'
#' @details
#' The \strong{periodogram} is a sample-based function from which we obtain estimators of the spectral density.
#' For a given time series \eqn{\{x_1, \dots, x_n\}}, the periodogram can be computed using the formula:
#'
#' \deqn{I_n(\lambda) = \displaystyle{\frac{1}{n}} \left| \displaystyle{\sum_{t=1}^n x_t e^{-it\lambda}} \right|^2.}
#'
#' Within the \code{\link{plot}} function, this function is used to calculate the periodogram
#' of a given time series for several lambda values in the interval \eqn{(-\pi, \pi]}.
#'
#' @param X A numeric or complex atomic vector representing the time series data.
#' The time series should be stationary,  meaning its mean and covariance function should be independent of time.
#' @param lambda A numeric value from the interval \eqn{(- \pi, \pi]} that represents the frequency at which the periodogram is evaluated.
#'
#' @returns A numeric value representing the periodogram.
#'
#' @references Brockwell, P.J., Davis, R.A. (2016) \emph{Introduction to Time Series and Forecasting}. Springer.
#'
#' @examples
#' # Example 1: Periodogram for a simple sine curve
#' X <- sin(2 * pi * 1:100 / 100)
#' lambda <- 2 * pi / 100
#' periodogram(X, lambda)
#'
#' # Example 2: Periodogram for a complex exponential curve
#' X <- exp(2 * pi * 1i * 1:100 / 100)
#' lambda <- 2 * pi / 100
#' periodogram(X, lambda)
#'
#' # Example 3: Periodogram for white noise
#' set.seed(123)
#' X <- rnorm(100)
#' lambda <- pi / 4
#' periodogram(X, lambda)
#'
#' @export
periodogram <- function(X, lambda) {
  stopifnot(
    "X must be an atomic vector" = is.atomic(X),
    "X must have positive length" = length(X) > 0,
    "X may not contain NAs" = !any(is.na(X)),
    "X may not contain Inf or -Inf values" = !any(is.infinite(X)),
    "The values of X must be numeric or complex" = (is.numeric(X) | is.complex(X)),
    "lambda must be a value of length 1" = (is.atomic(lambda) & length(lambda) == 1),
    "lambda must be numeric" = is.numeric(lambda),
    "lambda must be from the interval (-pi, pi]" = (-pi < lambda & lambda <= pi)
  )
  warning("This function works for stationary time series with zero-mean. Results may be inaccurate for non-stationary time series.")
  
  n <- length(X)
  
  exponentials <- exp(-1i * lambda * (1:n))
  
  result <- (abs(sum(X * exponentials))^2) / n

  return(result)
}
