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
