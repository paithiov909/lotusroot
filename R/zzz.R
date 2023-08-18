#' @noRd
#' @import parsnip
.onLoad <- function(libname, pkgname) {
  add_linear_reg_estimatr()
  add_linear_reg_glmSparse()
}
