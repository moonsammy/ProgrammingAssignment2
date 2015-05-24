# Function to create a cache matrix object that can be stored
#
# param[in] - x - matrix (assumed invertable for this exersize)
# return[out] - list obj of processing functions
#
makeCacheMatrix <- function( x = matrix() ) 
{
  # Default the inverted matrix to be null
  invertedMatrix = NULL
  # Set function pushes the value to the object in a seperate enviornment throug the
  # <<- operator
  set = function( y ) 
  {
    x <<- y
    invertedMatrix <<- NULL
  }
  
  # Accesor functions
  get = function()
  {
    x
  }
  
  setinv = function( inverse )
  {
    invertedMatrix <<- inverse
  }
  
  getinv = function()
  { 
    invertedMatrix
  }
  
  # Return value
  list( set=set, get=get, setinv=setinv, getinv=getinv ) 
}


# Function takes a cacheMatrix object and either solves for its inverse and cching the 
# result in the same object, or returns the previously cached resut if it exists.
#
# param[in] - x - object returned from makeCacheMatrix
# return[out] - matrix inversed
#
cacheSolve <- function( x, ... ) 
{
  # Get the inverse of the matrix param
  inversedMAtrix = x$getinv()
  
  # Test if we already have the inverse cached
  if( is.null( invversedMatrix ) )
  {
    # Calculate the inverse 
    data = x$get()
    inversedMatrix = solve( data, ... )
  
    # Cache the inverse
    x$setinv( inversedMatrix )
  }
  
  # Return the inverse
  inversedMatrix
}

