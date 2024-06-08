"""
    Strata(x::Symbol)

Create a `StrataTerm` object that holds a variable in the construction of a formula to stratify an estimator. 

The behavior of the stratification depends on the fitted estimator: is is usally used on the right hand side of formulas from [`StatsModels.jl`](https://github.com/JuliaStats/StatsModels.jl) as

    @formula(Surv(time,status) ~ Strata(covariate1) + covariate 2)

It then has a behavior that unufortunately heavily depends on the estimator, e.g. stratification of a log-rank-type test. 
"""
Strata(x) = x
struct StrataTerm{X} <: AbstractTerm
    Covariable::X
end
Base.show(io::IO, t::StrataTerm) = print(io, "Strata($((t.Covariable)))")
Strata(Covariables::Vector) = StrataTerm(term(Covariables))
StatsModels.termvars(p::StrataTerm) = StatsModels.termvars(p.Covariable)
function StatsModels.apply_schema(t::FunctionTerm{typeof(Strata)},
    sch::StatsModels.Schema,
    Mod::Type{<:Any})
    return apply_schema(StrataTerm(t.args...), sch, Mod) 
end
function StatsModels.apply_schema(t::StrataTerm,
    sch::StatsModels.Schema,
    Mod::Type{<:Any})
    X = apply_schema(t.Covariable, sch, Mod)
    return StrataTerm(X)
end
function StatsModels.modelcols(t::StrataTerm, d::NamedTuple)
    return modelcols(t.Covariable, d)
end