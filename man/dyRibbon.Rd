% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plugins.R
\name{dyRibbon}
\alias{dyRibbon}
\title{dyRibbon plugin adds a horizontal band of colors that runs through the chart. It
can be useful to visualize categorical variables
(http://en.wikipedia.org/wiki/Categorical_variable) that change over time (along
the x-axis).}
\usage{
dyRibbon(
  dygraph,
  data = NULL,
  palette = NULL,
  parser = NULL,
  top = 1,
  bottom = 0
)
}
\arguments{
\item{dygraph}{Dygraph to add plugin to}

\item{data}{Vector of numeric values in the range from 0 to 1}

\item{palette}{Vector with colors palette}

\item{parser}{JavaScrip function (function (data, dygraph)) returning the array of
numeric values. Parser is used if no data was provided}

\item{top}{Vertical position of the top edge of ribbon relative to chart height.}

\item{bottom}{Vertical position of the bottom edge of ribbon relative to chart height.}
}
\description{
dyRibbon plugin adds a horizontal band of colors that runs through the chart. It
can be useful to visualize categorical variables
(http://en.wikipedia.org/wiki/Categorical_variable) that change over time (along
the x-axis).
}
\examples{
\dontrun{
library(quantmod)

getSymbols("SPY", from = "2016-12-01", auto.assign=TRUE)

difference <- SPY[, "SPY.Open"] - SPY[, "SPY.Close"]
decreasing <- which(difference < 0)
increasing <- which(difference > 0)

dyData <- SPY[, "SPY.Close"]

ribbonData <- rep(0, nrow(dyData))
ribbonData[decreasing] <- 0.5
ribbonData[increasing] <- 1

dygraph(dyData) \%>\%
    dyRibbon(data = ribbonData, top = 0.1, bottom = 0.02)
}

}
