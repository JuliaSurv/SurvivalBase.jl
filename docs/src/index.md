```@meta
CurrentModule = SurvivalBase
```

# SurvivalBase

The [`SurvivalBase.jl`](https://github.com/JuliaSurv/SurvivalBase.jl) package is intended to hold internals and shared infrastructure for several other front-facing packages in the [JuliaSurv](https://github.com/JuliaSurv) organization, while having the minimal set of dependencies. Please do not use it directly and instead used other front-facing packages and interfaces from the organization.

Right now, the main infrastructure consists of special functions `Surv` and `Strata` used in [`StatsModels.jl`](https://juliastats.org/StatsModels.jl/stable/api/)'s `@formula`s to be able to express as formulas strandard survival models. 

The current implementation only provides bindings for right censored survivals times (with `Surv(T,Δ)`, left-hand-side of formulas) and *stratified* estimators (with `Strata(x)`, right-hand-side of formulas), but extensions to more complex survival times (e.g. truncation and/or censoring from right and/or left) is planned (note: it would be straightforward and non-breaking). 


```@index
```

```@autodocs
Modules = [SurvivalBase]
```
