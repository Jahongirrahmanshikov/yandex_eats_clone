import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../home/main_screen/main_screeen.dart';

class CompletedOrder extends StatefulWidget {
  const CompletedOrder({super.key});

  @override
  State<CompletedOrder> createState() => _CompletedOrderState();
}

class _CompletedOrderState extends State<CompletedOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const GoogleMap(
              initialCameraPosition: CameraPosition(
                zoom: 13,
                target: LatLng(
                  41.326432,
                  69.228402,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: const SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: ColoredBox(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text("Order created",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          Text(
                            "We will bring your order when it's ready",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                          Divider(),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Circles(icon: Icon(Icons.check)),
                              Circles(icon: Icon(Icons.restaurant)),
                              Circles(icon: Icon(Icons.directions_run)),
                              Circles(icon: Icon(Icons.flag)),
                            ],
                          ),
                          SizedBox(height: 15),
                          Divider(),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButton(text: "Cancel order"),
                              CustomButton(text: "Contact with us"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: BackButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(),
                      ),
                      (route) => true);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: 50,
        width: 150,
        child: ColoredBox(
          color: Colors.grey[200] ?? Colors.grey,
          child: Center(child: Text(text)),
        ),
      ),
    );
  }
}

class Circles extends StatelessWidget {
  final Icon icon;

  const Circles({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey[200],
      radius: 30,
      child: icon,
    );
  }
}
