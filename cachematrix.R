## The first function returns a list of four functions and in one of them cache the inverse of the input matrix.
## The second function try to get the cached inverse from the first one, if it is not there, then it will compute the inverse.

## I just tried to mimic the example code and after running on my computer I think the results are right.

makeCacheMatrix <- function(x = matrix()) {
  i<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function()x
  setinv<-function(solve)i<<-solve
  getinv<-function()i
  list(set=set,get=get,
       setinv=setinv,
       getinv=getinv)

}


## Try to creat a special "matrix" object that can cache its inverse

cacheSolve <- function(x, ...) {
  i<-x$getinv()
  if(!is.null(i)){
    message("getting cached data")
    return(i)
  }
  data<-x$get()
  i<-solve(data,...)
  x$setinv(i)
  i
        ## Return a matrix that is the inverse of 'x'
}
