function check()
    # global iters, d_vec
    dv = d_vec[]
    it = iters[]

    sel = findfirst(x-> x .> C[], it)
    D[] == dv[sel] || println("switching to every $(dv[sel])...")
    D[] = dv[sel]
    return mod(C[], D[]) == 0
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
  # global
  C[] += 1
  check() &&  println("Eval ", C[])
  return C[]
end

function countplus!(f::Number)
  # Announce iteration and fval
  # global
  C[] += 1
  roundf = round(f; digits=8)
  check() && println("Eval $(C[]): value = $roundf")
  return C[]
end

function countplus!(f::Number,p)
  # Announce iteration, fval, and pvec
  # global
  C[] += 1
  roundf = round(f; digits=8)
  roundp = round.(p; digits=5)
  check() && println("Eval $(C[]) value = $roundf\tpvec = $roundp")
  return C[]
end

function countplus!(f::Number,p::AbstractArray,g::AbstractArray)
  # Announce iteration, fval, and pvec
  C[] += 1
  if check()
		roundf = round(f; digits=8)
		roundp = round.(p; digits=5)
		roundg = round.(g; digits=5)
	  println("Eval $(C[]) value = $roundf\tpvec = $roundp")
	  println("\tGrad = $roundg")
  return C[]
end
