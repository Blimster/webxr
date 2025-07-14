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
