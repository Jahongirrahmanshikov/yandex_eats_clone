import 'package:flutter/material.dart';

class NewLocation extends StatefulWidget {
  const NewLocation({super.key});

  @override
  State<NewLocation> createState() => _NewLocationState();
}

class _NewLocationState extends State<NewLocation> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(28),
            topLeft: Radius.circular(28),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "My addresses",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          SizedBox(
                            height: 25,
                            width: 25,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.amber,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.check_sharp,
                                  color: Colors.black,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          TextMini(text: 'Beruniy Street,3A'),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                              Icons.settings_input_component_outlined))
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 15),
                      TextMini(text: 'Add new')
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.black12, thickness: 15),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextMini(text: "Delivery time"),
                      Row(
                        children: [
                          TextMini(text: "ASAP"),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Expanded(
                      child: Card(
                        color: Colors.amber,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 140),
                          child: TextMini(text: "Done"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextMini extends StatelessWidget {
  final String text;

  const TextMini({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
    );
  }
}
