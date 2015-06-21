#  Cacheable Matrix Inverse calculator
#

#
#  Creates a list that
#  a) Holds the cached values
#  b) Returns functions for caclulating the mean, 
#  that are closed over this function
#
#
makeCacheMatrix <- function(cachedVal = matrix()) {
  cachedInv <- NULL
  #  Sets a new value
  #  invalidates cached inverse
  set        <- function(x) {
                cachedVal <<- x
                cachedInv <<- NULL
  }
  get <- function() cachedVal
  setInv <- function(inv) cachedInv <<- inv
  getInv <- function() cachedInv
  list(
    set = set,
    get = get,
    setInv = setInv,
    getInv = getInv
  )
}


# Given a list created by makeCachedMean
# Either calculates of returns from cache the 
# martix inverse, and stores it in cache in the
# former case
cacheSolve <- function(inverseList, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- inverseList$getInv()
        if (!is.null(inv)) {
          message("Cache Hit")
          return(inv)
        }
        #  No cache hit, so work it out and store in cache
        mat <= inverseList$get()
        inv <- solve(mat,...)
        inverseList$setInv(inv)
        inv
}        

