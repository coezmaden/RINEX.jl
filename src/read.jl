# returns iostream for debugging purposes for now, not in use
function rinex_read(filename::String)
    open(filename) do iostream 
        rinex_header = rinex_read_header(iostream)
    end
end

function rinex_read(iostream::IOStream)
    rinex_header = rinex_read_header(iostream, RINEXHeader())
    rinex_data = rinex_read_data(iostream, rinex_header)
    return rinex_header, rinex_data
end

function rinex_read_header(iostream::IOStream)
    header = readlines(IOBuffer(readuntil(iostream, EOH, keep = true)))
    
    # # RINEX VERSION / TYPE
    # file_version = parse.(Float64, header[6:20])
    # file_type = header[21:40]
    # satellite_system = header[41:60]

    return header
    # return num_header_lines, file_version, file_type, satellite_system
end

function rinex_read_data(iostream::IOStream, header)
    data = readlines(iostream)
    num_of_entries = length(data) ÷ 8
    for entry = 1:num_of_entries
        for line = 1:length(data)

        end
    end
    # sat_line = 0
    return data
end