// -*-c++-*-
#ifndef TREE_CONTROL_H_
#define TREE_CONTROL_H_

#include <Rcpp.h>

#include "lookup.h"
#include "util.h"
#include "ode_control.h"

namespace model {

class Control : public util::Lookup {
public:
  typedef util::PtrWrapper<Control> ptr;
  Control();
  Control(Rcpp::List x);

  bool   plant_assimilation_over_distribution;
  double plant_assimilation_tol;
  int    plant_assimilation_iterations;

  double plant_seed_tol;
  int    plant_seed_iterations;

  double cohort_gradient_eps;
  bool   cohort_gradient_richardson;
  int    cohort_gradient_richardson_depth;

  double environment_light_tol;
  int    environment_light_nbase;
  int    environment_light_max_depth;

  double ode_step_size_min;
  double ode_step_size_max;
  double ode_tol_rel;
  double ode_tol_abs;
  double ode_tol_y;
  double ode_tol_dydt;

private:
  double _plant_assimilation_over_distribution;
  double _plant_assimilation_iterations;

  double _plant_seed_iterations;

  double _cohort_gradient_richardson;
  double _cohort_gradient_richardson_depth;

  double _environment_light_nbase;
  double _environment_light_max_depth;

  void do_build_lookup();
  void reset();
  void set_parameters_post_hook();
};

ode::OdeControl make_ode_control(const Control &control);

}

RCPP_EXPOSED_CLASS(model::Control)

#endif
