% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vr_alluvial_wrangling.R
\name{vr_alluvial_wrangling}
\alias{vr_alluvial_wrangling}
\title{vr_alluvial_wrangling}
\usage{
vr_alluvial_wrangling(
  data,
  id = "PatientID",
  linename = "LineName",
  linenumber = "LineNumber",
  drop_maintenance_therapy = TRUE,
  linenumber_upper_limit = 4,
  n_common = 2
)
}
\arguments{
\item{data}{a dataframe}

\item{id}{patient id variable name, Defoult: 'PatientID'}

\item{linename}{lines of therapy variable name, Defoult: 'LineName'}

\item{linenumber}{lines of therapy number variable name,
Defoult: 'LineNumber'}

\item{drop_maintenance_therapy}{should you include maintenance}

\item{linenumber_upper_limit}{upper limit for LoT}

\item{n_common, }{Number of most common lines of therapy presented
in alluvial plot, Default: 2}
}
\value{
list
}
\description{
Create tables with alluvial data.
}
\examples{

dataset <- NULL

for(PatientID in 1:5000){

  max_line <- sample(0:5, 1, prob = c(0.2, 0.4, 0.2, 0.15, 0.04, 0.01))

  if(max_line == 1){

    min_line <- sample(c(0, 1), 1, prob = c(0.3, 0.7))

  } else{ min_line <- 0 }

  for(LineNumber in min_line:max_line){

    LineName <- sample(c('Treatment_A', 'Treatment_B', 'Treatment_C'), 1, prob = c(0.5, 0.3, 0.2))

    patient_data_line <- data.frame(PatientID = PatientID,
                                    LineName = LineName,
                                    LineNumber = LineNumber)

    dataset <- rbind(patient_data_line , dataset)

  }

}

result <- dataset \%>\% vr_alluvial_wrangling()
result$alluvial_plot_data
result$linenames_summary

}
