"""
`resetcount()`

Resets iteration count to 0.
"""
function resetcount()
	global C = 0
	global D = 1
	return
end

"""
`stopcount()`

Disables printing of iterations.
"""
function stopcount()
	global iters = [Inf,]
	global D = Inf
	global d_vec = [Inf,]
	return
end

"""
`startcount(iter::Array{Int},denom::Array{Int})`

As the count reaches the iteration specified in `iter` it changes the
denomination of the reporting to the corresponding entry in `denom`. The last
entry in `denom` is used after the maximum of `iter`.

Currently finds the first such entry in `iter` so non-monotonically increasing
arrays have extra information.
"""
function startcount(i::AbstractArray, d::AbstractArray)
	# could sort sort!(i) but would want to preserve order in d
	global iters = [i,Inf,] # add Inf to avoid a check failure
	global d_vec = [d,d[end],] # repeat last forever
	return
end

function startcount()
	# Sets Defaults
	global iters = [10,50,500,Inf]
	global d_vec = [1,5,50,500]
	return
end
