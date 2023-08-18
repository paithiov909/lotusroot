add_linear_reg_glmSparse <- function() {
  parsnip::set_model_engine("linear_reg", "regression", "glmSparse")
  parsnip::set_dependency("linear_reg", "glmSparse", "lotusroot")

  parsnip::set_fit(
    model = "linear_reg",
    eng = "glmSparse",
    mode = "regression",
    value = list(
      interface = "formula",
      protect = c("formula", "data", "weights"),
      func = c(pkg = "lotusroot", fun = "glmSparse"),
      defaults = list(
        doFit = TRUE
      )
    )
  )
  parsnip::set_encoding(
    model = "linear_reg",
    eng = "glmSparse",
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
    eng = "glmSparse",
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
