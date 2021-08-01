module RINEX

    using FileIO, Unitful, Dates, DataFrames

    export RINEXHeader, rinex_read

    include("NavMessageFile.jl")
    include("RINEXHeader.jl")
    include("RINEXData.jl")
    include("io.jl")
    include("read.jl")
    
    const EOH = "END OF HEADER       \n"
end
