function check()
	global D
	sel = findfirst(x-> x.>C, iters)
	D == d_vec[sel] || println("switching to every $(d_vec[sel])...")
	D = d_vec[sel]
	mod(C, D) == 0
end

"""
`countplus!(,[f,p] )`

Announces current iteration using default rules or those set by set_count().
Use resetcount() to set count back to 0.

Default Rules:
* Every iteration until 10
* Every 5 iterations until 50
* Every 50 iterations until 500
* Every 500 iterations
"""
function countplus!()
  # Announce iterations
  global C += 1
  check() &&  println("Eval ", C)
  return C
end

function countplus!(f::Number)
  # Announce iteration and fval
  global C += 1
  check() && println("Eval ", C, ": value = ", round(f; digits=8))
  return C
end

function countplus!(f::Number,p::AbstractArray)
  # Announce iteration, fval, and pvec
  global C += 1
  check() && println("Eval ", C, " value = ", round(f; digits=8), "\tpvec = ", round.(p; digits=5))
  return C
end
