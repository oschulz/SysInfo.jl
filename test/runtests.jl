using SysInfo
using Test

@testset "SysInfo.jl" begin
    @test SysInfo.ncputhreads() > 0    # Write your tests here.
    @test SysInfo.ncores() > 0    # Write your tests here.
    @test SysInfo.nsockets() > 0    # Write your tests here.
    @test SysInfo.nnuma() > 0    # Write your tests here.
    @test isnothing(sysinfo())

    @static if Sys.islinux()
        @test SysInfo.Internals.check_consistency_backends()
    end
end
