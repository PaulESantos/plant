context("Modular")

test_that("Construction", {

  ## This is a *minimal* set of tests that checks that it is possible
  ## to create the full set of different object types (Individual, Species,
  ## Patch etc) with different underlying Strategy types.  It doesn't
  ## actually try to run them though, so do that elsewhere.

  strategy_types <- get_list_of_strategy_types()

  for (x in names(strategy_types)) {
    s <- strategy_types[[x]]()
    expect_is(s, paste0(x, "_Strategy"))

    p <- Individual(x, paste0(x, "_Env"))(s)

    expect_is(p, "Individual")
    expect_is(p, sprintf("Individual<%s,%s_Env>", x, x))
    expect_equal(class(p$strategy), class(s))
    expect_equal(p$strategy, s)

    coh <- Cohort(x, paste0(x, "_Env"))(s)

    expect_is(coh, "Cohort")
    expect_is(coh, sprintf("Cohort<%s,%s_Env>", x, x))
    expect_equal(class(coh$plant), class(p))

    sp <- Species(x, paste0(x, "_Env"))(s)

    expect_is(sp, "Species")
    expect_is(sp, sprintf("Species<%s,%s_Env>", x, x))
    expect_equal(class(sp$seed), class(coh))

    par <- Parameters(x, paste0(x, "_Env"))(strategies=list(s))
    expect_is(par, "Parameters")
    expect_is(par, sprintf("Parameters<%s,%s_Env>", x, x))
    expect_equal(par$strategies[[1]], s)

    pat <- Patch(x, paste0(x, "_Env"))(par)
    expect_is(pat, "Patch")
    expect_is(pat, sprintf("Patch<%s,%s_Env>", x, x))
    expect_equal(class(pat$species[[1]]), class(sp))

    scm <- SCM(x, paste0(x, "_Env"))(par)
    expect_is(scm, "SCM")
    expect_is(scm, sprintf("SCM<%s,%s_Env>", x, x))
    expect_equal(class(scm$patch), class(pat))

    ## Stochastic model:
    s_sp <- StochasticSpecies(x, paste0(x, "_Env"))(s)
    expect_is(s_sp, "StochasticSpecies")
    expect_is(s_sp, sprintf("StochasticSpecies<%s,%s_Env>", x, x))
    expect_equal(class(s_sp$seed), class(p))

    s_pat <- StochasticPatch(x, paste0(x, "_Env"))(par)
    expect_is(s_pat, "StochasticPatch")
    expect_is(s_pat, sprintf("StochasticPatch<%s,%s_Env>", x, x))
    expect_equal(class(s_pat$species[[1]]), class(s_sp))

    s_pr <- StochasticPatchRunner(x, paste0(x, "_Env"))(par)
    expect_is(s_pr, "StochasticPatchRunner")
    expect_is(s_pr, sprintf("StochasticPatchRunner<%s,%s_Env>", x, x))
    expect_equal(class(s_pr$patch), class(s_pat))
  }
})
