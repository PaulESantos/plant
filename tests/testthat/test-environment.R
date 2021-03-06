
strategy_types <- get_list_of_strategy_types()

for (x in names(strategy_types)) {

  context(sprintf("Environment-%s",x))

  test_that("Empty environment", {
    p <- Parameters(x, paste0(x, "_Env"))()
    e <- make_environment(x, p)

    ## At this point, we should have full canopy openness, partly because
    ## the spline is just not constructed.
    expect_equal(e$canopy_openness(0), 1.0)
    expect_equal(e$canopy_openness(100), 1.0)

    spline <- e$environment_interpolator
    expect_equal(spline$size, 33)
    expect_equal(spline$x, seq(0,1, length.out=33))
  })

  test_that("Manually set environment", {
    e <- make_environment(x, Parameters(x, paste0(x, "_Env"))())
    ## Now, set the light environment.
    hh <- seq(0, 10, length.out=101)
    light_env <- function(x) {
      exp(x/(max(hh)*2)) - 1 + (1 - (exp(.5) - 1))/2
    }
    ee <- light_env(hh)
    interplator <- Interpolator()
    interplator$init(hh, ee)

    ## And set it
    e$environment_interpolator <- interplator

    expect_identical(e$environment_interpolator$xy, interplator$xy)

    hmid <- (hh[-1] + hh[-length(hh)])/2
    expect_identical(sapply(hmid, e$environment_interpolator$eval), sapply(hmid, interplator$eval))
  })

  test_that("Disturbance related parameters", {
    e <- make_environment(x, Parameters(x, paste0(x, "_Env"))())
    expect_identical(e$time, 0.0)
    expect_identical(e$patch_survival_conditional(e$time), 1.0)

    disturbance <- Disturbance(30.0)
    e$time <- 10
    expect_identical(e$patch_survival_conditional(0), disturbance$pr_survival_conditional(e$time, 0))
    expect_identical(e$patch_survival_conditional(2), disturbance$pr_survival_conditional(e$time, 2))

    expect_is(e$disturbance_regime, "Disturbance")
  })

  test_that("Seed rain related parameters", {
    e <- make_environment(x, Parameters(x, paste0(x, "_Env"))())
    expect_error(e$seed_rain_dt, "Cannot get seed rain for empty environment")

    z <- c(.1, .2)
    e <- test_environment(x, 10, n_strategies=2, seed_rain=z)

    expect_identical(e$seed_rain_dt, z[[1]])
    e$set_seed_rain_index(1)
    expect_identical(e$seed_rain_dt, z[[1]])
    e$set_seed_rain_index(2)
    expect_identical(e$seed_rain_dt, z[[2]])
    expect_error(e$set_seed_rain_index(0), "Invalid value for index")
    expect_error(e$set_seed_rain_index(3), "Index 3 out of bounds")
  })
}
