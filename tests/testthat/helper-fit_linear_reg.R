library(workflowsets)

# Sample dataframe
set.seed(310)
quality <- sample(0:10, 10, replace = TRUE)
x1 <- rnorm(10, mean = 20, sd = 2)
x2 <- rnorm(10, mean = 20, sd = 2)
x3 <- rnorm(10, mean = 20, sd = 2)
correct_df <- data.frame(quality, x1, x2, x3)

# Sample linear regression output
lm_spec <- parsnip::linear_reg() %>%
  parsnip::set_engine("lm") %>%
  parsnip::set_mode("regression")
test_lm_recipe <- recipes::recipe(quality ~ ., data = correct_df)
test_lm_fit <- workflows::workflow() %>%
  workflows::add_recipe(test_lm_recipe) %>%
  workflows::add_model(lm_spec) %>%
  parsnip::fit(data = correct_df)

# Sample object inside output
test_coeffs <- test_lm_fit %>%
  workflowsets::extract_fit_parsnip()

# Sample empty input
empty_df <- data.frame(quality = character(0))
