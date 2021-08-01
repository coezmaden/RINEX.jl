# FileIO compatible load function
function load(rnxfile::File{format"RNX"})
    open(rnxfile) do rnxstream
        iostream = stream(rnxstream) #convert to regular ::IOStream
        rinex_header = rinex_read(iostream)
    end
end