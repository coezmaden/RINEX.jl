module RINEX

    using Base: Float64
    using FileIO, Unitful

    export RINEXHeader, rinex_read

    include("RINEXHeader.jl")
    include("RINEXData.jl")
    include("io.jl")
    include("read.jl")
    
    const EOH = "END OF HEADER       \n"
end
