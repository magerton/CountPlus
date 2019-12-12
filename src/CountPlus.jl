module CountPlus

export countplus!, resetcount!, startcount!, stopcount!

const T = Int
const VecT = Vector{Int}
const InfT = typemax(T)

# Initialize Count
const C=Ref{T}()
const D=Ref{T}()
const iters=Ref{VecT}()
const d_vec=Ref{VecT}()

# functions that allow adjusting settings
include("set.jl")
# machinery for reporting
include("oper.jl")

# Set everything to defaults
startcount()
resetcount()

end
