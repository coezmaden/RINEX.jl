# returns iostream for debugging purposes for now, not in use
function rinex_read(filename::String)
    open(filename) do iostream 
        rinex_header = rinex_read_header(iostream)
    end
end

function rinex_read(iostream::IOStream)
    rinex_header = rinex_read_header!(RINEXHeader(), iostream)
    rinex_data = rinex_read_data!(
        DataFrame(NavMessageID=String[], NavigationMessage=RINEX.AbstractNavMessageFile[]), 
        iostream)
    return rinex_header, rinex_data
end

function rinex_read_header!(header::RINEXHeader, iostream::IOStream)
    header = readlines(IOBuffer(readuntil(iostream, EOH, keep = true)))
    
    # # RINEX VERSION / TYPE
    # file_version = parse.(Float64, header[6:20])
    # file_type = header[21:40]
    # satellite_system = header[41:60]

    return header
    # return num_header_lines, file_version, file_type, satellite_system
end

function rinex_read_data!(data::DataFrame, iostream::IOStream)
    rxndata_raw = readlines(iostream)
    num_of_entries = length(rxndata_raw) ÷ 8
    for i = 1:num_of_entries
        chunk = rxndata_raw[1+(i-1)*8:8*i] #get 8 lines chunks
        gpsnavmsg = GPSNavMessageFile(
            parse(Int, chunk[1][2:3]),
            DateTime(
                parse(Int, chunk[1][5:8]), 
                parse(Int, chunk[1][10:11]),
                parse(Int, chunk[1][13:14]), 
                parse(Int, chunk[1][16:17]), 
                parse(Int, chunk[1][19:20]), 
                parse(Int, chunk[1][22:23])),
            parse(Float64, chunk[1][24:42]),
            parse(Float64, chunk[1][43:61]),
            parse(Float64, chunk[1][62:80]),
            parse(Float64, chunk[2][5:23]),
            parse(Float64, chunk[2][24:42]),
            parse(Float64, chunk[2][43:61]),
            parse(Float64, chunk[2][62:80]),
            parse(Float64, chunk[3][5:23]),
            parse(Float64, chunk[3][24:42]),
            parse(Float64, chunk[3][43:61]),
            parse(Float64, chunk[3][62:80]),
            parse(Float64, chunk[4][5:23]),
            parse(Float64, chunk[4][24:42]),
            parse(Float64, chunk[4][43:61]),
            parse(Float64, chunk[4][62:80]),
            parse(Float64, chunk[5][5:23]),
            parse(Float64, chunk[5][24:42]),
            parse(Float64, chunk[5][43:61]),
            parse(Float64, chunk[5][62:80]),
            parse(Float64, chunk[6][5:23]),
            parse(Float64, chunk[6][24:42]),
            parse(Float64, chunk[6][43:61]),
            parse(Float64, chunk[6][62:80]),
            parse(Float64, chunk[7][5:23]),
            parse(Float64, chunk[7][24:42]),
            parse(Float64, chunk[7][43:61]),
            parse(Float64, chunk[7][62:80]),
            parse(Float64, chunk[8][5:23]),
            parse(Float64, chunk[8][24:42])
        )
        push!(data, ("G$(gpsnavmsg.prn) $(gpsnavmsg.toc)", gpsnavmsg))
    end
    return data
end