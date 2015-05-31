type ChemharpError <: Exception
    message::String
end
Base.show(io::IO, e::ChemharpError) = show(io, "Chemharp error: $(e.message)")
export ChemharpError

function check(result)
    if result != 0
        str = "Unlnown error"
        try
            str = lib.chrp_strerror(result)
        end
        throw(ChemharpError(str))
    end
end