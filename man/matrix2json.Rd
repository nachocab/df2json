\name{matrix2json}
\alias{matrix2json}
\title{Convert a matrix to JSON}
\usage{
  matrix2json(mat)
}
\arguments{
  \item{mat}{input matrix object}
}
\description{
  Convert a matrix to JSON
}
\examples{
library(df2json)
df <- m <- matrix(1:9, byrow = TRUE, nrow=3)
matrix2json(df)
}

