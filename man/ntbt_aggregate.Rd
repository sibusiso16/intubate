\name{ntbt_aggregate}
\alias{ntbt_aggregate}
\title{Interface to aggregate for data science pipelines.}
\description{
  \code{ntbt_aggregate} is an interface to \code{stats::\link{aggregate}}
  (Compute Summary Statistics of Data Subsets) that can be used
  in a pipeline implemented by \code{magrittr}.}
\usage{
ntbt_aggregate(data, formula, FUN, ...)
}
\arguments{
  \item{data}{an data frame, tibble, list (or object coercible by as.data.frame to a data frame) containing the variables in the model.}
  \item{formula}{an object of class "formula" (or one that can be coerced to that class): a symbolic description of the model to be fitted.}
  \item{FUN}{a function to compute the summary statistics which can be applied to all data subsets.}
  \item{...}{Other arguments passed to \code{\link{aggregate}}.}
}
\details{
  ntbt_aggregate reverses the order of \code{data} and \code{formula}, so it can be
  used in a pipeline. It then calls \code{\link{aggregate}}.
}
\value{
  Object returned by \code{\link{aggregate}}.
}
\author{
Roberto Bertolusso
}
\seealso{
  \code{\link{aggregate}}, \code{\link{ntbt_xtabs}}
}
\examples{
## Original function to interface
ag <- aggregate(len ~ ., data = ToothGrowth, mean)
xtabs(len ~ ., data = ag)

## The interface reverses the order of data and formula
ag <- ntbt_aggregate(ToothGrowth, len ~ ., mean)
ntbt_xtabs(ag, len ~ .)

## so it can be used easily in a pipeline.
library(magrittr)
ToothGrowth \%>\%
  ntbt_aggregate(len ~ ., mean) \%>\%
  ntbt_xtabs(len ~ .)
  
esoph \%>\%
  ntbt_aggregate(cbind(ncases, ncontrols) ~ alcgp + tobgp, sum)
}
\keyword{intubate}
\keyword{magrittr}
\keyword{ntbt_aggregate}
\keyword{aggregate}
\keyword{ntbt_xtabs}
