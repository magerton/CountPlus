"""
`resetcount()`

Resets iteration count to 0.
"""
function resetcount!()
	C[] = zero(T)
	D[] = one(T)
	return nothing
end

@deprecate resetcount() resetcount!()

"""
`stopcount()`

Disables printing of iterations.
"""
function stopcount!()
	D[] = InfT
	iters[] = [InfT,]
	d_vec[] = [InfT,]
	return nothing
end

@deprecate stopcount() stopcount!()

"""
`startcount(iter::Array{Int},denom::Array{Int})`

As the count reaches the iteration specified in `iter` it changes the
denomination of the reporting to the corresponding entry in `denom`. The last
entry in `denom` is used after the maximum of `iter`.

Currently finds the first such entry in `iter` so non-monotonically increasing
arrays have extra information.
"""
function startcount!(i::AbstractVector, d::AbstractVector)
	# could sort sort!(i) but would want to preserve order in d
	iters[] = vcat(i, InfT) # add Inf to avoid a check failure
	d_vec[] = vcat(d, d[end]) # repeat last forever
	return nothing
end

function startcount!()
	# Sets Defaults
	iters[] = [10,50,500,InfT]
	d_vec[] = [1,5,50,500]
	return nothing
end

@deprecate startcount(args...) startcount!(args...)
