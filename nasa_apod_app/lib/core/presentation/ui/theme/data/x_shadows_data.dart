part of x_metrics_data;

class XShadowsData {
  final BoxShadow small;
  final BoxShadow medium;
  final BoxShadow large;

  XShadowsData({
    BoxShadow? small,
    BoxShadow? medium,
    BoxShadow? large,
  })  : small = small ??
            BoxShadow(
              blurRadius: const XSpacingsData().extraSmall / 2,
              spreadRadius: const XSpacingsData().extraSmall / 4,
              color: Colors.white.withOpacity(.4),
            ),
        medium = medium ??
            BoxShadow(
              blurRadius: const XSpacingsData().extraSmall,
              spreadRadius: const XSpacingsData().extraSmall / 4,
              color: Colors.white.withOpacity(.4),
            ),
        large = large ??
            BoxShadow(
              blurRadius: const XSpacingsData().extraSmall * 2,
              spreadRadius: const XSpacingsData().extraSmall / 2,
              color: Colors.white.withOpacity(.4),
            );
}
