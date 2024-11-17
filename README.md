# tailwind_responsive_design

A Flutter package that provides responsive design capabilities inspired by Tailwind CSS breakpoints and responsive utilities. Build adaptive Flutter UIs with ease using predefined breakpoints and intuitive APIs.

[![pub package](https://img.shields.io/pub/v/tailwind_responsive_design.svg)](https://pub.dev/packages/tailwind_responsive_design)
[![likes](https://img.shields.io/pub/likes/tailwind_responsive_design?logo=dart)](https://pub.dev/packages/tailwind_responsive_design/score)
[![popularity](https://img.shields.io/pub/popularity/tailwind_responsive_design?logo=dart)](https://pub.dev/packages/tailwind_responsive_design/score)

## Features

- 🎯 Tailwind CSS-inspired breakpoints
- 📱 Responsive widgets that adapt to screen sizes
- 🔄 Generic value adaptation based on breakpoints
- 🎨 Intuitive API for responsive design
- 📏 Predefined breakpoints for common screen sizes
- ⚡ Zero external dependencies

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  tailwind_responsive_design: ^1.0.0
```

Then run:
```bash
flutter pub get
```

## Usage

### Breakpoints

The package uses the following breakpoints, matching Tailwind CSS conventions:

| Breakpoint | Width    | Description        |
|------------|----------|--------------------|
| initial    | < 640px  | Mobile            |
| sm         | ≥ 640px  | Tablet            |
| md         | ≥ 768px  | Tablet Landscape  |
| lg         | ≥ 1024px | Desktop           |
| xl         | ≥ 1280px | Large Desktop     |
| xxl        | ≥ 1536px | Extra Large       |

### Responsive Widgets

Create widgets that adapt to different screen sizes:

```dart
import 'package:tailwind_responsive_design/tailwind_responsive_design.dart';

TailwindResponsive.responsive(
  context: context,
  // Mobile layout (default)
  child: SingleChildScrollView(
    child: Column(
      children: [menuButton, content],
    ),
  ),
  // Tablet layout
  sm: Row(
    children: [
      Expanded(child: sidebar),
      Expanded(flex: 2, child: content),
    ],
  ),
  // Desktop layout
  lg: Row(
    children: [
      Expanded(child: sidebar),
      Expanded(flex: 3, child: content),
      Expanded(child: rightPanel),
    ],
  ),
);
```

### Responsive Values

Adapt any value based on screen size:

```dart
// Responsive padding
double padding = TailwindResponsive.value<double>(
  context: context,
  initial: 8,   // Mobile padding
  sm: 16,       // Tablet padding
  lg: 24,       // Desktop padding
);

// Responsive layout direction
Axis direction = TailwindResponsive.value<Axis>(
  context: context,
  initial: Axis.vertical,    // Stack vertically on mobile
  lg: Axis.horizontal,       // Stack horizontally on desktop
);

// Responsive grid columns
int columns = TailwindResponsive.value<int>(
  context: context,
  initial: 1,  // Single column on mobile
  sm: 2,       // Two columns on tablet
  lg: 4,       // Four columns on desktop
);
```

### Get Current Breakpoint

Check the current breakpoint for conditional logic:

```dart
String breakpoint = TailwindResponsive.getBreakpoint(context);
print('Current breakpoint: $breakpoint'); // e.g., 'sm', 'md', 'lg'
```

## Complete Example

Here's a complete example showing how to create a responsive layout:

```dart
import 'package:flutter/material.dart';
import 'package:tailwind_responsive_design/tailwind_responsive_design.dart';

class ResponsivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TailwindResponsive.responsive(
        context: context,
        // Mobile Layout
        child: Column(
          children: [
            AppBar(title: Text('Mobile View')),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                padding: EdgeInsets.all(
                  TailwindResponsive.value<double>(
                    context: context,
                    initial: 8,
                    sm: 16,
                    lg: 24,
                  ),
                ),
                itemBuilder: (context, index) => ListTile(
                  title: Text('Item $index'),
                ),
              ),
            ),
          ],
        ),
        // Desktop Layout
        lg: Row(
          children: [
            // Sidebar
            Container(
              width: 250,
              color: Colors.grey[200],
              child: ListView(
                children: [
                  ListTile(title: Text('Menu Item 1')),
                  ListTile(title: Text('Menu Item 2')),
                  ListTile(title: Text('Menu Item 3')),
                ],
              ),
            ),
            // Main Content
            Expanded(
              child: Column(
                children: [
                  AppBar(title: Text('Desktop View')),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: TailwindResponsive.value<int>(
                          context: context,
                          initial: 1,
                          lg: 2,
                          xl: 3,
                        ),
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      padding: const EdgeInsets.all(24),
                      itemCount: 20,
                      itemBuilder: (context, index) => Card(
                        child: Center(
                          child: Text('Item $index'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

## Additional Information

### Contribution

Contributions are welcome! If you find a bug or want to add a feature, please:

1. Open an issue to discuss the changes
2. Fork the repository
3. Create a pull request

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Support

If you find this package helpful, please give it a like on [pub.dev](https://pub.dev/packages/tailwind_responsive_design) ❤️

For bugs or feature requests, please [create an issue](https://github.com/RaghavTheGreat1/tailwind_responsive_design/issues) on GitHub.