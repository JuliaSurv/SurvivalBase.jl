"""
    Surv(T::Symbol, Δ::Symbol)

Create a `SurvTerm` object that holds a tuple of variables `(T,Δ)` in the construction of a formula, usually on the left-hand-side, representing a right-censored output time `T` with its status indicatrix `Δ`: Δ being true means that the time was indeed observed, while false means censoring. 

This information, usually on the left hand side a formula, has then a behavior that may depend on the estimator. It allows to use formulas from [`StatsModels.jl`](https://github.com/JuliaStats/StatsModels.jl) as follow: 

    @formula(Surv(time,status) ~ covariate1 + covariate 2)

This usage is common in, e.g., cox models. However, note that the *meaning* of the formula heavily depends on the model : for hazard regession and maximum likelyhood estimation, this does not mean the same thing. 
"""
Surv(T::Float64, Δ::Bool) = (T, Δ)
struct SurvTerm{X, Y} <: AbstractTerm
    T::X
    Δ::Y
    function SurvTerm(T,Δ)
        return new{typeof(T),typeof(Δ)}(T, Δ)
    end
end
Base.show(io::IO, t::SurvTerm) = print(io, "Surv($((t.T, t.Δ)))")
function StatsModels.apply_schema(t::FunctionTerm{typeof(Surv)},
    sch::StatsModels.Schema,
    Mod::Type{<:Any})
    return apply_schema(SurvTerm(t.args...), sch, Mod) 
end
function StatsModels.apply_schema(t::SurvTerm{X,Y},
    sch::StatsModels.Schema,
    Mod::Type{<:Any}) where {X,Y}
    T = apply_schema(t.T, sch, Mod)
    Δ = apply_schema(t.Δ, sch, Mod)
    isa(T, ContinuousTerm) || throw(ArgumentError("Surv only works with continuous terms (got $T)"))
    isa(Δ, ContinuousTerm) ||  throw(ArgumentError("Surv only works with discrete terms (got $Δ)"))
    return SurvTerm(T, Δ)
end
function StatsModels.modelcols(t::SurvTerm, d::NamedTuple)
    T = modelcols(t.T, d)
    Δ = modelcols(t.Δ, d)
    return hcat(T,Δ)
end
