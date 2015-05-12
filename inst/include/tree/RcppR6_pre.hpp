// Generated by RcppR6 (0.2.1): do not edit by hand
#ifndef _TREE_RCPPR6_PRE_HPP_
#define _TREE_RCPPR6_PRE_HPP_

#include <RcppCommon.h>


namespace tree {
namespace RcppR6 {
template <typename T> class RcppR6;
}
}

namespace tree { namespace ode { namespace test { class OdeR; } } }



namespace Rcpp {
template <typename T> SEXP wrap(const tree::RcppR6::RcppR6<T>&);
namespace traits {
template <typename T> class Exporter<tree::RcppR6::RcppR6<T> >;
}

template <> SEXP wrap(const tree::ode::test::Lorenz&);
template <> tree::ode::test::Lorenz as(SEXP);

template <> SEXP wrap(const tree::ode::test::OdeR&);
template <> tree::ode::test::OdeR as(SEXP);

template <> SEXP wrap(const tree::ode::Runner<tree::ode::test::Lorenz>&);
template <> tree::ode::Runner<tree::ode::test::Lorenz> as(SEXP);

template <> SEXP wrap(const tree::ode::Runner<tree::ode::test::OdeR>&);
template <> tree::ode::Runner<tree::ode::test::OdeR> as(SEXP);

template <> SEXP wrap(const tree::ode::Runner<tree::tools::PlantRunner>&);
template <> tree::ode::Runner<tree::tools::PlantRunner> as(SEXP);

template <> SEXP wrap(const tree::CohortScheduleEvent&);
template <> tree::CohortScheduleEvent as(SEXP);

template <> SEXP wrap(const tree::CohortSchedule&);
template <> tree::CohortSchedule as(SEXP);

template <> SEXP wrap(const tree::Disturbance&);
template <> tree::Disturbance as(SEXP);

template <> SEXP wrap(const tree::Control&);
template <> tree::Control as(SEXP);

template <> SEXP wrap(const tree::ode::OdeControl&);
template <> tree::ode::OdeControl as(SEXP);

template <> SEXP wrap(const tree::quadrature::QK&);
template <> tree::quadrature::QK as(SEXP);

template <> SEXP wrap(const tree::quadrature::QAG&);
template <> tree::quadrature::QAG as(SEXP);

template <> SEXP wrap(const tree::interpolator::Interpolator&);
template <> tree::interpolator::Interpolator as(SEXP);

template <> SEXP wrap(const tree::Environment&);
template <> tree::Environment as(SEXP);

template <> SEXP wrap(const tree::Plant_internals&);
template <> tree::Plant_internals as(SEXP);

template <> SEXP wrap(const tree::Plant<tree::FFW16_Strategy>&);
template <> tree::Plant<tree::FFW16_Strategy> as(SEXP);

template <> SEXP wrap(const tree::tools::PlantRunner&);
template <> tree::tools::PlantRunner as(SEXP);

template <> SEXP wrap(const tree::FFW16_Strategy&);
template <> tree::FFW16_Strategy as(SEXP);

template <> SEXP wrap(const tree::FFW16_Parameters&);
template <> tree::FFW16_Parameters as(SEXP);

template <> SEXP wrap(const tree::FFW16_PlantPlus&);
template <> tree::FFW16_PlantPlus as(SEXP);

template <> SEXP wrap(const tree::FFW16_PlantPlus::internals&);
template <> tree::FFW16_PlantPlus::internals as(SEXP);

template <> SEXP wrap(const tree::Cohort<tree::FFW16_Plant>&);
template <> tree::Cohort<tree::FFW16_Plant> as(SEXP);

template <> SEXP wrap(const tree::Species<tree::FFW16_Plant>&);
template <> tree::Species<tree::FFW16_Plant> as(SEXP);

template <> SEXP wrap(const tree::Patch<tree::FFW16_Plant>&);
template <> tree::Patch<tree::FFW16_Plant> as(SEXP);

template <> SEXP wrap(const tree::EBT<tree::FFW16_Plant>&);
template <> tree::EBT<tree::FFW16_Plant> as(SEXP);
}

#endif