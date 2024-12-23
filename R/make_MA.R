#' @title Generator for MA(q) processes
#'
#' @description `make_MA` generates a synthetic time series that follows an MA(q) model.
#'
#' @details
#' The MA(q) model can be defined by the equation
#'
#' \deqn{X_t = Z_t + \theta_1 Z_{t-1} + \theta_2 Z_{t-2} + \dots + \theta_q Z_{t-q},}
#'
#' where \eqn{X_t} represents the time series at time \eqn{t} and \eqn{Z_t} is white noise with a mean of zero and variance of \eqn{\sigma^2}.
#'
#' @param t An integer specifying the desired length of the time series.
#' @param theta A numeric or complex atomic vector of length `q` containing the coefficients of the MA(q) process.
#' @param sigma A numeric value representing the standard deviation of the white noise, with a default value of 1.
#'
#' @returns A numeric atomic vector containing the generated MA(q) time series.
#'
#' @references Brockwell, P.J., Davis, R.A. (2016) \emph{Introduction to Time Series and Forecasting}. Springer.
#'
#' @examples
#' # Example 1: Simple MA(1) model
#' ma_one <- make_MA(t = 10, theta = -0.25, sigma = 2)
#' graphics::plot(ma_one, type = "l")
#'
#' # Example 2: Simple MA(2) model
#' ma_two <- make_MA(t = 10, theta = c(9, 2))
#' graphics::plot(ma_two, type = "l")
#'
#' # Example 3: Simple MA(3) model
#' ma_three <- make_MA(t = 10, theta = c(1, 3, 4))
#' graphics::plot(ma_three, type = "l")
#'
#' @export
make_MA <- function(t, theta, sigma = 1) {
  stopifnot(
    "t must be a value of length 1" = (is.atomic(t) & length(t) == 1),
    "t must not be infinite" = !is.infinite(t),
    "t must not be NA" = !is.na(t),
    "t must be numeric" = is.numeric(t),
    "t must be an integer" = t %% 1 == 0,
    "t must be positive" = t > 0,
    "theta must be an atomic vector" = is.atomic(theta),
    "theta must have positive length" = length(theta) > 0,
    "theta may not contain NAs" = !any(is.na(theta)),
    "theta may not contain Inf or -Inf values" = !any(is.infinite(theta)),
    "The values of theta must be numeric or complex" = (is.numeric(theta) | is.complex(theta)),
    "t must be greater than the length of theta" = t > length(theta),
    "sigma must be a value of length 1" = (is.atomic(sigma) & length(sigma) == 1),
    "sigma must not be infinite" = !is.infinite(sigma),
    "sigma must not be NA" = !is.na(sigma),
    "sigma must be numeric" = is.numeric(sigma),
    "sigma must be positive" = sigma > 0
  )

  q <- length(theta)
  
  X <- numeric(t)
  Z <- stats::rnorm(t + q, mean = 0, sd = sigma)

  for (i in (q + 1):t) {
    X[i] <- sum(theta * rev(Z[(i - q):(i - 1)])) + Z[i]
  }

  return(X)
}
