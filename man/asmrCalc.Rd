% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/asmrCalc.R
\name{asmrCalc}
\alias{asmrCalc}
\title{ASMR calculation}
\usage{
asmrCalc(climateData, latitude = 55, soils = soilsData)
}
\arguments{
\item{climateData}{Climate data must be imported correctly.}

\item{latitude}{Latitude can be one of three numbers (50,55,60)}

\item{soils}{This can be the soilsData variable as already defined.  If you want to use
different parameters, then modify the soilsData variable.}
}
\description{
This function uses daily climate and soils data to estimate daily
water balance for five different soil moisture regimes.
}
