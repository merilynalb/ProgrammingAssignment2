## The following two functions aim to simplify a costly computation by caching. Here we cache the inverse of a matrix. 

## The function below creates a special 'matrix', which is technically a list, and caches it's inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getmegetinversean = getinverse)
}


##The function below will return the inverse of makeCacheMatrix, using cacheSolve 

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}


