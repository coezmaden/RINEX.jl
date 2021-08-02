# RINEX.jl (WIP)

This package implements basic handling of RINEX (**R**eceiver **In**dependent **Ex**change Format) files. It ~~interfaces~~ plans to interface with FileIO.jl package to offer ease of use via `load` and `save` commands that just work outside of the box.

# Usage
## Install 
```julia
julia> ]
pkg> add git@github.com:ozmaden/RINEX.jl.git
```

## Reading
For now the repository stays unregistered with `FileIO.jl`.
```julia
julia> using RINEX, FileIO
julia> path = "path/to/*.rnx/"
julia> rnxfile = File{format"RNX"}(path)
julia> rinex_header, rinex_data = RINEX.load(rnxfile)
```
Once registered with `FileIO.jl` it would suffice to just call `load(path)` to achieve the same result.
## Writing
WIP