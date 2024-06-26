using SurvivalBase
using Documenter

DocMeta.setdocmeta!(SurvivalBase, :DocTestSetup, :(using SurvivalBase); recursive=true)

makedocs(;
    modules=[SurvivalBase],
    authors="Oskar Laverny <oskar.laverny@univ-amu.fr> and contributors",
    sitename="SurvivalBase.jl",
    format=Documenter.HTML(;
        canonical="https://JuliaSurv.github.io/SurvivalBase.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/JuliaSurv/SurvivalBase.jl",
    devbranch="main",
)
