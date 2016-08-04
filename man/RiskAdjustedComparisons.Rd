% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/risk_adjusted_comparisons.R
\docType{class}
\name{RiskAdjustedComparisons}
\alias{RiskAdjustedComparisons}
\title{Make risk adjusted comparisons between groups/units or years/months}
\format{An object of class \code{R6ClassGenerator} of length 24.}
\usage{
RiskAdjustedComparisons
}
\arguments{
\item{df}{Dataframe whose columns are used for calc.}

\item{predicted.col}{Column that you want to predict.}

\item{group.col}{Column that we'll use to differentiate}

\item{impute}{Set all-column imputation to F or T.}
}
\description{
This class allows you to create a model based on the
performance of many groups in a cohort (besides group A, for example) and
see how well group A does against what the model would predict. Ranking each
of the groups this way provides a sense of which group's doing best in
terms of a particular measure.
}
\examples{
# The examples will run as-is, but you can find the data used here
# C:\\Users\\levi.thatcher\\Documents\\R\\win-library\\3.2\\HCRTools\\extdata OR
# C:\\Program Files\\R\\R-3.2.3\\library\\HCRTools\\extdata

#### Example using csv data ####
library(HCRTools)
#setwd("C:/Your/script/location") # Needed if using YOUR CSV file
ptm <- proc.time()

# Can delete this line in your work
csvfile <- system.file("extdata", "HREmployeeDev.csv", package = "HCRTools")

totaldf <- read.csv(file = csvfile, #<-- Replace with 'your/path'
                    header = TRUE,
                    na.strings = 'NULL')

head(totaldf)

set.seed(43)
o <- RiskAdjustedComparisons$new(df = totaldf,
                                 group.col = 'Gender',
                                 #grain.col = OPTIONAL/ENCOURAGED
                                 predicted.col = 'SalariedFlag',
                                 impute = TRUE)

o$compare(debug=TRUE)

}
\references{
\url{http://products.healthcatalyst.com/Predictive}
}
\seealso{
\code{\link{HCRTools}}
}
\keyword{datasets}
