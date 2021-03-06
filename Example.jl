
using CountPlus

# T = 10
# T = 100
T = 2000

## Print iteration count
[countplus!() for ii in 1:T]

# You can reset the count with
resetcount()
[countplus!() for ii in 1:T]

## Iteration Count

# CountPlus has a pre-set pattern for displaying counts but you can change
# this count with startcount(iter,denom).
startcount([10,50,500,], [1,3,50,500,])
[countplus!() for ii in 1:T]
# TIP: You can add an extra entry to the 2nd array that occurs after the
# maximum of the first array is reached. Otherwise it continues with last entry
# forever.
startcount() # resets to default pattern

## Print iteration count and fval
resetcount()
[countplus!(1.0*mod(ii,5)) for ii in 1:T]
  # currently requires Float64

## Print iteration count, fval, and parameter vector
resetcount()
[countplus!((ii-100)^2,ii) for ii in 1.0:T]
  # currently requires Float64
