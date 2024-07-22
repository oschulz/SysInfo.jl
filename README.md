# SysInfo

[![Build Status](https://github.com/carstenbauer/SysInfo.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/carstenbauer/SysInfo.jl/actions/workflows/CI.yml?query=branch%3Amain)

This package will be a backend of [ThreadPinning.jl](https://github.com/carstenbauer/ThreadPinning.jl). However, you may use it directly to obtain core information about the compute system at hand (number of physical cores, NUMA domains, etc.).

## Usage

```julia
julia> using SysInfo

julia> sysinfo() # only exported function
Hostname: login17
CPU kind: AMD EPYC 7713 64-Core Processor

128 physical (256 virtual) cores distributed over 2 CPUs
         → CPU 1: 64 physical (128 virtual) cores
         → CPU 2: 64 physical (128 virtual) cores

NUMA domains: 8
         → CPU 1: 4 NUMA domains
         → CPU 2: 4 NUMA domains

Detected GPUs: 1

julia> SysInfo.ncores() # programmatic access, public API but not exported
128
```

## Backend

As of now, SysInfo.jl is based only on [Hwloc.jl](https://github.com/JuliaParallel/Hwloc.jl). In the future, we might add more sources of truth.