# Copyright (C) Tal Galili
#
# This file is part of dendextend.
#
# dendextend is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# dendextend is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with dendextend.  If not, see <http://www.gnu.org/licenses/>.








#' @title Convert dendrogram Objects to Class hclust 
#' @description Convert dendrogram Objects to Class hclust while preserving the call/method/dist.method values of the original hclust object (hc)
#' @export
#' @param x a dendrogram object to turn into hclust
#' @param hc an old hclust object from which to re-use the call/method/dist.method values
#' @param ... passed to as.hclust
#' @return An hclust object (from a dendrogram) with the original hclust call/method/dist.method values
#' @seealso \link{as.hclust}
#' @examples
#' hc <- hclust(dist(USArrests[1:3,]), "ave")
#' dend <- as.dendrogram(hc)
#' 
#' as.hclust(dend)
#' as_hclust_fixed(dend, hc)
as_hclust_fixed <- function(x, hc, ...) {
   x <- as.hclust(x) 
   
   # these elements are removed after using as.hclust - so they have to be manually re-introduced into the object.
   x$call <- hc$call
   x$method <- hc$method
   x$dist.method <- hc$dist.method   
   
   return(x)
}
