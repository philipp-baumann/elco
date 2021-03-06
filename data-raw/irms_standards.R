## code to prepare `irms_standards` dataset goes here

# C and N mass of coffeine (for IAEA 600 standard)
m_caffeine <- units::set_units(194.19, "g/mol")
m_caffeine_C <- units::set_units(8 * PeriodicTable::mass("C"), "g/mol")
m_caffeine_N <- units::set_units(4 * PeriodicTable::mass("N"), "g/mol")
m_caffeine_O <- units::set_units(2 * PeriodicTable::mass("O"), "g/mol")
m_caffeine_H <- units::set_units(10 * PeriodicTable::mass("H"), "g/mol")
m_caffeine_S <- units::set_units(0 * PeriodicTable::mass("S"), "g/mol")

irms_standards <-
  tibble::tibble(
    standard_name = c("IAEA 600", "BBOT_CN.", "BLS", "WFS"),
    C = c(m_caffeine_C/m_caffeine, units::set_units(c(0.72, 0.4809, 0.398), "g/g")),
    N =c( m_caffeine_N/m_caffeine, units::set_units(c(0.064, 0.0212, 0.0136), "g/g")),
    S = c(m_caffeine_S/m_caffeine, units::set_units(c(0.0744, 0.00172, 0.00092), "g/g")),
    H = c(m_caffeine_H/m_caffeine, units::set_units(c(NA, NA, NA), "g/g")),
    O = c(m_caffeine_O/m_caffeine, units::set_units(c(NA, NA, NA), "g/g")),
    "13C" = c(-27.771, -25.8, -27.2, -27.21),
    "15N" = c(1, -0.6, -1.7, 2.85),
    threshold_13C = c(0.2, NA, NA, NA),
    threshold_15N = c(0.2 * 2, NA, NA, NA),
    source = c("Coplen.2006", "IVAAnalysentechnikGmbH&Co.KGt.2016", NA, "IVAAnalysentechnikGmbH&Co.KGt.2016")
  )

usethis::use_data(irms_standards, overwrite = TRUE)



