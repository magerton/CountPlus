## CountPlus

A simple facility for tracking the progress of an estimator. See `Example.jl` for a quick introduction. Based on functions developed by [Mark Agerton](https://github.com/magerton).

### Usage

```
using CountPlus
```
#### Print iteration count
```
resetcount()
[countplus!() for ii in 1:T]
```
#### Print iteration count and fval
```
resetcount()
[countplus!(1.0*mod(ii,5)) for ii in 1:T]
  # currently requires Float64
```
#### Print iteration count, fval, and x-value
```
resetcount()
[countplus!((ii-100)^2,ii) for ii in [1.0:T;]]
  # currently requires Float64
```
### Set reporting intervals
You can add an extra entry to the 2nd array that occurs after the maximum of the first array is reached.
```
set_count(iterations,denominations)
```
