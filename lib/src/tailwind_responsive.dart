import 'package:flutter/material.dart';

/// A utility class that provides responsive design capabilities inspired by Tailwind CSS breakpoints
/// and responsive utilities. This class helps in building responsive Flutter applications by providing
/// methods to handle different screen sizes efficiently.
///
/// The class uses predefined breakpoints similar to Tailwind CSS:
/// - initial: < 640px (mobile)
/// - sm: >= 640px (tablet)
/// - md: >= 768px (tablet landscape)
/// - lg: >= 1024px (desktop)
/// - xl: >= 1280px (large desktop)
/// - xxl: >= 1536px (extra large screens)
///
/// Example usage with responsive widget:
/// ```dart
/// TailwindResponsive.responsive(
///   context: context,
///   child: Text('Mobile Layout'), // Default for smallest screens
///   sm: Text('Tablet Layout'),    // For screens >= 640px
///   md: Text('Tablet Landscape'), // For screens >= 768px
///   lg: Text('Desktop Layout'),   // For screens >= 1024px
///   xl: Text('Large Desktop'),    // For screens >= 1280px
///   xxl: Text('Extra Large'),     // For screens >= 1536px
/// )
/// ```
///
/// Example usage with responsive values:
/// ```dart
/// double padding = TailwindResponsive.value<double>(
///   context: context,
///   initial: 8,  // Mobile padding
///   sm: 16,      // Tablet padding
///   lg: 24,      // Desktop padding
/// );
/// ```
class TailwindResponsive {
  /// Breakpoint for small screens (sm)
  /// Equivalent to Tailwind's sm breakpoint
  static const double smBreakpoint = 640;

  /// Breakpoint for medium screens (md)
  /// Equivalent to Tailwind's md breakpoint
  static const double mdBreakpoint = 768;

  /// Breakpoint for large screens (lg)
  /// Equivalent to Tailwind's lg breakpoint
  static const double lgBreakpoint = 1024;

  /// Breakpoint for extra large screens (xl)
  /// Equivalent to Tailwind's xl breakpoint
  static const double xlBreakpoint = 1280;

  /// Breakpoint for 2xl screens (xxl)
  /// Equivalent to Tailwind's 2xl breakpoint
  static const double xxlBreakpoint = 1536;

  /// Returns the current breakpoint name based on screen width.
  /// 
  /// This method is useful for debugging or conditional logic based on current breakpoint.
  /// 
  /// Returns one of: 'initial', 'sm', 'md', 'lg', 'xl', 'xxl'
  /// 
  /// Example:
  /// ```dart
  /// String currentBreakpoint = TailwindResponsive.getBreakpoint(context);
  /// print('Current breakpoint: $currentBreakpoint');
  /// ```
  static String getBreakpoint(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= xxlBreakpoint) return 'xxl';
    if (width >= xlBreakpoint) return 'xl';
    if (width >= lgBreakpoint) return 'lg';
    if (width >= mdBreakpoint) return 'md';
    if (width >= smBreakpoint) return 'sm';
    return 'initial';
  }

  /// Creates a responsive widget that adapts to different screen sizes.
  /// 
  /// This method allows you to specify different widgets for different breakpoints,
  /// similar to how Tailwind CSS handles responsive designs.
  /// 
  /// Parameters:
  /// - [context]: The build context
  /// - [child]: Default widget for mobile (< 640px)
  /// - [sm]: Widget for small screens (>= 640px)
  /// - [md]: Widget for medium screens (>= 768px)
  /// - [lg]: Widget for large screens (>= 1024px)
  /// - [xl]: Widget for extra large screens (>= 1280px)
  /// - [xxl]: Widget for 2xl screens (>= 1536px)
  /// 
  /// The method returns the most appropriate widget based on the current screen width.
  /// If a breakpoint is not specified, it falls back to the next smaller breakpoint's widget.
  /// 
  /// Example:
  /// ```dart
  /// TailwindResponsive.responsive(
  ///   context: context,
  ///   child: SingleChildScrollView(...), // Mobile layout
  ///   lg: Row(                          // Desktop layout
  ///     children: [
  ///       Expanded(child: sidebar),
  ///       Expanded(child: mainContent),
  ///     ],
  ///   ),
  /// )
  /// ```
  static Widget responsive({
    required BuildContext context,
    Widget? child,
    Widget? sm,
    Widget? md,
    Widget? lg,
    Widget? xl,
    Widget? xxl,
  }) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= xxlBreakpoint && xxl != null) return xxl;
    if (width >= xlBreakpoint && xl != null) return xl;
    if (width >= lgBreakpoint && lg != null) return lg;
    if (width >= mdBreakpoint && md != null) return md;
    if (width >= smBreakpoint && sm != null) return sm;
    return child ?? Container();
  }

  /// Returns a responsive value based on the current screen width.
  /// 
  /// This method is generic and can work with any type of value (numbers, strings, objects, etc.).
  /// It's particularly useful for responsive values like padding, font sizes, or any other
  /// properties that need to change based on screen size.
  /// 
  /// Parameters:
  /// - [context]: The build context
  /// - [initial]: Default value for mobile (< 640px)
  /// - [sm]: Value for small screens (>= 640px)
  /// - [md]: Value for medium screens (>= 768px)
  /// - [lg]: Value for large screens (>= 1024px)
  /// - [xl]: Value for extra large screens (>= 1280px)
  /// - [xxl]: Value for 2xl screens (>= 1536px)
  /// 
  /// Example with different types:
  /// ```dart
  /// // Responsive padding
  /// double padding = TailwindResponsive.value<double>(
  ///   context: context,
  ///   initial: 8,
  ///   sm: 16,
  ///   lg: 24,
  /// );
  /// 
  /// // Responsive axis alignment
  /// Axis direction = TailwindResponsive.value<Axis>(
  ///   context: context,
  ///   initial: Axis.vertical,   // Mobile: Stack vertically
  ///   lg: Axis.horizontal,      // Desktop: Stack horizontally
  /// );
  /// 
  /// // Responsive grid columns
  /// int columns = TailwindResponsive.value<int>(
  ///   context: context,
  ///   initial: 1,  // Mobile: Single column
  ///   sm: 2,       // Tablet: Two columns
  ///   lg: 4,       // Desktop: Four columns
  /// );
  /// ```
  static T value<T>({
    required BuildContext context,
    required T initial,
    T? sm,
    T? md,
    T? lg,
    T? xl,
    T? xxl,
  }) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= xxlBreakpoint && xxl != null) return xxl;
    if (width >= xlBreakpoint && xl != null) return xl;
    if (width >= lgBreakpoint && lg != null) return lg;
    if (width >= mdBreakpoint && md != null) return md;
    if (width >= smBreakpoint && sm != null) return sm;
    return initial;
  }
}