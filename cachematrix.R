## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  rm <- NULL
  set <- function(y) {
    x <<- y
    rm <<- NULL
  }
  get <- function() x
  setrm <- function(reverse_matrix) rm <<- reverse_matrix
  getrm <- function() rm
  list(set = set, get = get,
       setrm = setrm,
       getrm = getrm)
}


cacherm <- function(x, ...) {
  rm <- x$getrm()
  if(!is.null(rm)) {
    message("getting cached data")
    return(rm)
  }
  data <- x$get()
  rm <- solve(data, ...)
  x$setrm(rm)
  rm
}
