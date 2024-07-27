# SysInfo

[![Build Status](https://github.com/carstenbauer/SysInfo.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/carstenbauer/SysInfo.jl/actions/workflows/CI.yml?query=branch%3Amain)

This package will be a backend of [ThreadPinning.jl](https://github.com/carstenbauer/ThreadPinning.jl). However, you may use it directly to obtain core information about the compute system at hand (number of physical cores, NUMA domains, etc.).

## Features

* Get a compact summary of the system (topology and key figures).
* Query various properties of the system, including the number of CPU-threads, physical CPU-cores, and NUMA domains.
* Two backends: [Hwloc.jl](https://github.com/JuliaParallel/Hwloc.jl) and `lscpu`.
* Fake mode: Simulate being on a different system (useful in conjuction with [ThreadPinningCore.jl](https://github.com/carstenbauer/ThreadPinningCore.jl)'s fake mode).

## Usage

On a Perlmutter (NERSC) login node:

```julia-repl
julia> using SysInfo

julia> sysinfo() # only exported function
Hostname:       login19
CPU(s):         2 x AMD EPYC 7713 64-Core Processor
CPU target:     znver3
Cores:          128 (256 CPU-threads due to 2-way SMT)
NUMA domains:   8 (16 cores each)

∘ CPU 1: 
        → 64 cores (128 CPU-threads due to 2-way SMT)
        → 4 NUMA domains
∘ CPU 2: 
        → 64 cores (128 CPU-threads due to 2-way SMT)
        → 4 NUMA domains

Detected GPUs:  1

julia> SysInfo.ncores() # programmatic access, public API but not exported
128

julia> SysInfo.ncputhreads()
256

julia> SysInfo.nsockets()
2

julia> SysInfo.nnuma()
8
```

On a Mac mini M1:

```julia-repl
julia> sysinfo()
Hostname: 	pc2macmini.fritz.box
CPU(s): 	1 x Apple M1
CPU target:     apple-m1

∘ CPU 1:
	→ 8 cores (8 CPU-threads)
	→ 4 "efficiency cores", 4 "performance cores".
	→ 1 NUMA domain
```

## Backends

SysInfo.jl uses [Hwloc.jl](https://github.com/JuliaParallel/Hwloc.jl) as the source of truth. It also has a `lscpu`-based backend that can be used as a replacement or for consistency checks (at least on Linux).
