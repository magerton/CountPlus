

module CountPlus

export countplus!, resetcount, startcount, stopcount

# Initialize Count
global C, D, iters, d_vec

# functions that allow adjusting settings
include("set.jl")
# machinery for reporting
include("oper.jl")

# Set everything to defaults
startcount()
resetcount()




end
