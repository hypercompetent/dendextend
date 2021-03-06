% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_subdendrograms.R
\name{find_dendrogram}
\alias{find_dendrogram}
\title{Search for the subdendrogram structure composed of indicated labels}
\usage{
find_dendrogram(dend, selected_labels)
}
\arguments{
\item{dend}{a dendrogram object}

\item{selected_labels}{logical vector with TRUE values at positions of
members which should be included in the resulting subdendrogram}
}
\value{
A subdendrogram composed of only members indicated in the given logical
vector
clusters.
}
\description{
Given a dendrogram object, the function performs a recursive DFS algorithm to determine
the subdendrogram which is composed of all indicated labels. The labels
which should compose the subdendrogram are marked as TRUE in the logical
vector of length \code{nleaves(dend)}
}
\examples{

\dontrun{
# define dendrogram object to play with:
dend <- iris[,-5] \%>\% dist \%>\% hclust \%>\% as.dendrogram \%>\%  
      set("labels_to_character") \%>\% color_branches(k=5)
first.subdend.only <- cutree(dend, 4) == 1
sub.dend <- find_dendrogram(dend, first.subdend.only)
# Plotting the result
par(mfrow=c(1,2))
plot(dend, main = "Original dendrogram")
plot(sub.dend, main = "First subdendrogram")
}

}
