# SurvivalBase

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://JuliaSurv.github.io/SurvivalBase.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://JuliaSurv.github.io/SurvivalBase.jl/dev/)
[![Build Status](https://github.com/JuliaSurv/SurvivalBase.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/JuliaSurv/SurvivalBase.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/JuliaSurv/SurvivalBase.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/JuliaSurv/SurvivalBase.jl)
[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)
[![ColPrac: Contributor's Guide on Collaborative Practices for Community Packages](https://img.shields.io/badge/ColPrac-Contributor's%20Guide-blueviolet)](https://github.com/SciML/ColPrac)
[![PkgEval](https://JuliaCI.github.io/NanosoldierReports/pkgeval_badges/S/SurvivalBase.svg)](https://JuliaCI.github.io/NanosoldierReports/pkgeval_badges/S/SurvivalBase.html)
[![Aqua](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)


The [`SurvivalBase.jl`](https://github.com/JuliaSurv/SurvivalBase.jl) package is intended to hold internals and shared infrastructure for several other front-facing packages in the [JuliaSurv](https://github.com/JuliaSurv) organization, while having the minimal set of dependencies. Please do not use it directly and instead used other front-facing packages and interfaces from the organization.

Right now, the main infrastructure consists of special functions `Surv` and `Strata` used in [`StatsModels.jl`](https://juliastats.org/StatsModels.jl/stable/api/)'s `@formula`s to be able to express as formulas strandard survival models. 

The current implementation only provides bindings for right censored survivals times (with `Surv(T,Δ)`, left-hand-side of formulas) and *stratified* estimators (with `Strata(x)`, right-hand-side of formulas), but extensions to more complex survival times (e.g. truncation and/or censoring from right and/or left) is planned (note: it would be straightforward and non-breaking). 
