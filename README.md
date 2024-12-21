# Time Series Analysis with R

This R package is designed for the simulation and analysis of time series data, with a focus on autoregressive (AR) and moving average (MA) processes. The package was developed as part of a university course project and is based on the theoretical foundations presented in the book:

**Brockwell, P.J., Davis, R.A., *Introduction to Time Series and Forecasting*, Springer (2016)**  
[Book Link](https://link.springer.com/book/10.1007/978-3-319-29854-2)

## Features

### AR(p) and MA(q) Process Generators
The package includes functions to generate time series data from AR(p) processes or MA(q) processes.

### Sample Autocovariance Function
The sample autocovariance function allows users to estimate the autocovariance structure of time series data.

### Durbin-Levinson Algorithm
Using the sample autocovariance function, the Durbin-Levinson algorithm is implemented to recursively estimate AR coefficients.

### Innovation Algorithm
The innovation algorithm is included to provide estimates based on orthogonalized innovations.

### Periodogram for Spectral Density Estimation
A periodogram function is implemented to estimate the spectral density of time series data.

### Plotting Functions
The package includes user-friendly plotting functions for plotting spectral densities.

### Examples and Illustrations
Each method is demonstrated with appropriate examples and visualizations to aid understanding and application.

## Installation
To install the `TimeSeriesR` package from GitHub, follow these steps in your R console or RStudio: 

Install the `devtools` package (if not already installed):

```r
install.packages("devtools")
```

Use `devtools` to install the `TimeSeriesR` package and then load it:

```r
devtools::install_github("alexanderk001/TimeSeriesR")
library(TimeSeriesR)
```

## Acknowledgments
This package was developed as part of a group project for a university course on R programming. The implementations closely follow the theoretical frameworks and algorithms presented in the book by Brockwell and Davis. Special thanks to the course instructors for their guidance and to all group members for their contributions.
