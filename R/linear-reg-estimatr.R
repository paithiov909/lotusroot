add_linear_reg_estimatr <- function() {
  parsnip::set_model_engine("linear_reg", "regression", "estimatr")
  parsnip::set_dependency("linear_reg", "estimatr", "estimatr")
  parsnip::set_dependency("linear_reg", "estimatr", "lotusroot")

  parsnip::set_fit(
    model = "linear_reg",
    eng = "estimatr",
    mode = "regression",
    value = list(
      interface = "formula",
      protect = c("formula", "data", "weights"),
      func = c(pkg = "estimatr", fun = "lm_robust"),
      defaults = list()
    )
  )
  parsnip::set_encoding(
    model = "linear_reg",
    eng = "estimatr",
    mode = "regression",
    options = list(
      predictor_indicators = "traditional",
      compute_intercept = TRUE,
      remove_intercept = TRUE,
      allow_sparse_x = FALSE
    )
  )
  parsnip::set_pred(
    model = "linear_reg",
    eng = "estimatr",
    mode = "regression",
    type = "numeric",
    value = list(
      pre = NULL,
      post = NULL,
      func = c(fun = "predict"),
      args =
        list(
          object = quote(object$fit),
          newdata = quote(new_data),
          type = "response"
        )
    )
  )
}
