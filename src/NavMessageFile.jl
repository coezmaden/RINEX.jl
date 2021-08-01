abstract type AbstractNavMessageFile end

struct GPSNavMessageFile <: AbstractNavMessageFile
    prn::Int
    toc::DateTime
    clock_bias::Float64
    clock_drift::Float64
    clock_drift_rate::Float64
    IODE::Float64
    C_rs::Float64
    Δn::Float64
    M_0::Float64
    C_uc::Float64
    e::Float64
    Cus::Float64
    sqrt_A::Float64
    t_oe::Float64
    C_ic::Float64
    ω₀::Float64
    C_is::Float64
    i₀::Float64
    C_rc::Float64
    ω::Float64
    Ω_dot::Float64
    IDOT::Float64
    l2codes::Float64
    gps_week::Float64
    l2pflag::Float64
    ura::Float64
    sv_health::Float64
    T_GD::Float64
    IODC::Float64
    ttm::Float64
    fit_interval::Float64
end