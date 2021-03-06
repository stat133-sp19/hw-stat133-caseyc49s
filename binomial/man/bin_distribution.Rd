% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/distribution_objects.R
\name{bin_distribution}
\alias{bin_distribution}
\title{Bin Distribution}
\usage{
bin_distribution(trials, prob = 0.5)
}
\arguments{
\item{trials}{number of trials (integer)}

\item{prob}{probability of success in one trial (integer)}
}
\value{
'bindis' data.frame with successes and probability
}
\description{
Creates an object of class 'bindis' (binomial distribution)
}
\examples{
# binomial probability distribution
bin_distribution(trials = 5, prob = 0.5)
}
