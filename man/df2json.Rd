\docType{package}
\name{df2json}
\alias{df2json}
\alias{df2json-package}
\title{df2json}
\usage{
  df2json(df)
}
\arguments{
  \item{df}{input dataframe object}
}
\description{
  df2json

  Convert a dataframe to JSON
}
\examples{
library(df2json)
df <- data.frame(name=c("a", "b", "c"), x=c(NA, 2 ,3), y=c(10, 20, -Inf), show=c(TRUE, FALSE, TRUE))
df2json(df)
}

