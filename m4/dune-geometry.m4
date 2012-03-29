dnl -*- autoconf -*-
# Macros needed to find dune-geometry and dependent libraries.  They are called by
# the macros in ${top_src_dir}/dependencies.m4, which is generated by
# "dunecontrol autogen"

# Additional checks needed to build dune-geometry
# This macro should be invoked by every module which depends on dune-geometry, as
# well as by dune-geometry itself
AC_DEFUN([DUNE_GEOMETRY_CHECKS], [
  AC_REQUIRE([DUNE_PATH_ALGLIB])
])

# Additional checks needed to find dune-geometry
# This macro should be invoked by every module which depends on dune-geometry, but
# not by dune-geometry itself
AC_DEFUN([DUNE_GEOMETRY_CHECK_MODULE],
[
  AC_MSG_NOTICE([Searching for dune-geometry...])
  DUNE_CHECK_MODULES([dune-geometry], [geometry/quadraturerules.hh],[dnl
  Dune::GeometryType gt;
  gt.makeQuadrilateral();
  (Dune::QuadratureRules<double, 2>::rule(gt, 2).size());])
])
