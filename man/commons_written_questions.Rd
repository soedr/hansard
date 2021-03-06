% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/commons_written_questions.R
\name{commons_written_questions}
\alias{commons_written_questions}
\title{commons_written_questions}
\usage{
commons_written_questions(comsWritType = c("all", "department", "dates",
  "askedBy"))
}
\arguments{
\item{comsWritType}{The type of data you want, allows the arguments 'all', 'department', 'dates' and 'askedBy'}

\item{all}{Returns a data frame with all written questions}

\item{department}{Requests a department name, and returns all written questions by department. The query acts as a search, so entering <health> will return all questions answered by the Department of Health}

\item{dates}{Requests two dates and imports a data frame with all available written questions from between the two dates.}

\item{askedBy}{Requests a member ID and returns a data frame with all written questions asked by that member}
}
\description{
Imports data on House of Commons written questions
}
\examples{
\dontrun{
x <- commons_written_questions('all')

x <- commons_written_questions('department')

x <- commons_written_questions('dates')

x <- commons_written_questions('askedBy')
}
}
\keyword{Commons}
\keyword{House}
\keyword{Questions}
\keyword{Written}
\keyword{of}

