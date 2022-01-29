import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'dart:ui' as ui;

class GoogleMap extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    String htmlId = "7";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = LatLng(30.1546430, 31.6187200);

      final mapOptions = MapOptions()
        ..zoom = 10
        ..center = LatLng(30.1546430, 31.6187200);

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = GMap(elem, mapOptions);

      Marker(MarkerOptions()
        ..position = myLatlng
        ..map = map
        ..title = 'Hello World!'
        ..label = 'Fathy Tito'
      );

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }
}