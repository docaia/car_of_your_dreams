import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'dart:ui' as ui;

class GoogleMap extends StatelessWidget {
  final num? latitude;
  final num? longitude;
  String htmNum;
  String mechName;
  GoogleMap(this.latitude, this.longitude, this.htmNum, this.mechName);
    @override
  Widget build(BuildContext context) {
    String htmlId = htmNum;

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = LatLng(latitude,longitude); //30.1546430, 31.6187200

      final mapOptions = MapOptions()
        ..zoom = 10
        ..center = LatLng(latitude, longitude);

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = GMap(elem, mapOptions);

     final marker=Marker(MarkerOptions()
        ..position = myLatlng
        ..map = map
        ..title = 'This is the location of the mechanic'
        ..label = '$mechName'
      );
marker.onClick.listen((e) {
 // window.alert("Map was clicked!");
  window.open("https://maps.google.com/?q=$latitude,$longitude",'location of $mechName');
})



;

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }
}