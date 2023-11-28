import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../common/utils/custom_extension.dart';
import '../../common/styles/app_colors.dart';
import '../controller/main_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ChangeLocation extends StatefulWidget {
  const ChangeLocation({super.key});

  @override
  State<ChangeLocation> createState() => _ChangeLocationState();
}

class _ChangeLocationState extends State<ChangeLocation> {
  @override
  void initState() {
    super.initState();
    context.read<MainController>().getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            zoomControlsEnabled: false,
            onMapCreated: (controller) {
              context.read<MainController>().onMapCreated(controller);
            },
            onTap: (LatLng latLng) {
              context.read<MainController>().mapOnTap(latLng);
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(
                context.watch<MainController>().lat,
                context.watch<MainController>().lon,
              ),
              zoom: 12,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('current'),
                position: LatLng(
                  context.watch<MainController>().lat,
                  context.watch<MainController>().lon,
                ),
                icon: BitmapDescriptor.defaultMarker,
              )
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: Text(
                  context.watch<MainController>().currenAddressName,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          context.read<MainController>().getCurrentLocation();
                        },
                        backgroundColor: AppColors.white,
                        child: const Icon(
                          Icons.telegram,
                          size: 40,
                        ),
                      ),
                    ),
                    FilledButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 60),
                        ),
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(17),
                            ),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.mainColor),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Готово',
                        style: context.textTheme.titleMedium?.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
