using SurvivalBase
using Test
using Aqua

@testset "SurvivalBase.jl" begin
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(
            SurvivalBase,
            ambiguities=false,
        )
    end
    # Write your tests here.
end
