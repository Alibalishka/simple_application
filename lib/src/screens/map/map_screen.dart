import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common/widgets/custom_colors.dart';
import 'package:flutter_application_1/src/common/widgets/custom_padding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  late GoogleMapController googleMapController;
 
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(10, 10),
    zoom: 14,
  );

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.scaffoldBackground,
      child: SafeArea(
        child: Stack(
          children: [
              Container(
                child: GoogleMap(
                    initialCameraPosition: _kGooglePlex,
                    // markers: markers,
                    mapType: MapType.normal,
                    zoomControlsEnabled: true,
                    onMapCreated: (GoogleMapController controller){
                      googleMapController = controller;
                    },
                  ),
              ),
              Padding(
                padding: AppPadings.verticalHorizontal,
                child: SearchTextField()
              ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () async{
      //     Position position = await _determinePosition();

      //     googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      //       target: LatLng(position.latitude, position.longitude),
      //       zoom: 15.0,
      //     )));

      //     markers.clear();
      //     markers.add(Marker(markerId: const MarkerId('currentLocation'), position: LatLng(position.latitude, position.longitude)));

      //     setState(() {
            
      //     });
      //   }, 
      //   label: Text(''),
      //   icon: Icon(Icons.navigation_rounded),
      // ),
    );
  }

    Future<Position> _determinePosition() async {

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    
    if(!serviceEnabled){
      return Future.error('Location service are disabled!');
    }

    permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();

      if(permission == LocationPermission.denied){
        return Future.error('Location permission denied');
      }
    }
    if(permission == LocationPermission.deniedForever){
        return Future.error('Location permission are permanently denied');
      }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }

  
}
class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      style: TextStyle(
        color: AppColors.black,
        fontSize: 16,
      ),
      placeholder: 'Поиск',
      placeholderStyle: TextStyle(
        color: AppColors.gray,
        fontSize: 16,
      ),
      itemColor: AppColors.gray,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.textFieldBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      prefixInsets: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    );
  }
}
