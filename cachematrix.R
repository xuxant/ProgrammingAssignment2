## R script containing two functions for working with matrix. Functions available
## in this script calculate and cache the matrix.


## Set the matrix and cache the inverse of the matrix
makeCacheMatrix <- function(b = matrix()) {
  a <- NULL
  
  set <- function(y) {
    b <<- y
    a <<- NULL
  }
  get <- function() b
  setInverse <- function(solve) a <<- solve
  getInverse <- function() a
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Get the inverse of the matrix from cache if available
## else calculate the inverse of the matrix.
cacheSolve <- function(x, ...) {
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached inverse matrix")
    return(m)
  }
  matrix <- x$get()
  inverse <- solve(matrix, ...)
  x$setInverse(inverse)
  inverse
}