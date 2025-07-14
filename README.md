# WebXR

Dart bindings for the WebXR APIs.

## Overview

WebXR provides Dart bindings for the WebXR Device API, enabling developers to create immersive virtual reality (VR) and augmented reality (AR) experiences using Dart and web technologies.

## Installation

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  webxr: ^0.1.0
```

Then run:

```bash
dart pub get
```

## Usage

### Basic Example

```dart
 import 'dart:js_interop';

import 'package:web/web.dart' as web;
import 'package:webxr/webxr.dart';

void main() async {
  final body = web.document.body;

  if (body == null) {
    print('Body element not found');
    return;
  }

  body.append(web.document.createElement('div')..textContent = 'WebXR Example');

  final navigator = Navigator.$(web.window.navigator);
  final xr = navigator.xr;

  if (xr == null) {
    print('WebXR is not supported in this browser');
    return;
  }

  try {
    final vrSupported = await xr.isSessionSupported('immersive-vr'.toJS).toDart;
    body.append(web.document.createElement('div')
      ..textContent = 'Immersive VR supported: $vrSupported');

    final arSupported = await xr.isSessionSupported('immersive-ar'.toJS).toDart;
    body.append(web.document.createElement('div')
      ..textContent = 'Immersive AR supported: $arSupported');

    final inlineSupported = await xr.isSessionSupported('inline'.toJS).toDart;
    body.append(web.document.createElement('div')
      ..textContent = 'Inline mode supported: $inlineSupported');
  } catch (e) {
    body.append(web.document.createElement('div')
      ..textContent = 'Error checking WebXR support: $e');
  }
}
```

## Development

This package provides type-safe Dart bindings for the WebXR APIs. The bindings are designed to work with Dart's `dart:js_interop` library for seamless JavaScript integration.

## How the package is created

The bindings are generated using the packages
- [ts-ast-export](https://github.com/Blimster/ts-ast-export): Generates a representation of a TypeScript definition file in JSON format.
- [ts_interop](https://github.com/Blimster/ts_interop): Creates Dart bindings from the JSON file.

Both packages are work in progress. 

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

- 📖 [Documentation](https://pub.dev/documentation/webxr/latest/)
- 🐛 [Issue Tracker](https://github.com/blimster/webxr/issues)
- 💬 [Discussions](https://github.com/blimster/webxr/discussions)

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for a detailed history of changes.
