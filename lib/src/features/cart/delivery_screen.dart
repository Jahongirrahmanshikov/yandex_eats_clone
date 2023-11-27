import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common/styles/app_colors.dart';
import '../controller/main_controller.dart';

class Delivery extends StatefulWidget {
  const Delivery({super.key});

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  String entrance = "";
  String doorPhone = "";
  String apartment = "";
  String floor = "";
  String instructions = "";
  String phoneNumber = "";
  ValueNotifier<bool> isActive = ValueNotifier(false);
  ValueNotifier<bool> isCash = ValueNotifier(false);
  //  TextEditingController _expiryDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            ListView(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 65,
                    child: ColoredBox(
                      color: Colors.grey[200] ?? Colors.grey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            color: Colors.yellow.shade600,
                            CupertinoIcons.location_solid,
                            size: 40,
                          ),
                          Text(
                            " ${context.watch<MainController>().currenAddressName}",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150,
                      child: TextFormField(
                        onChanged: (value) {
                          entrance = value;
                        },
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.yellowAccent,
                              width: 2,
                            ),
                          ),
                          label: Text("Entrance"),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    SizedBox(
                      width: 150,
                      child: TextFormField(
                        onChanged: (value) {
                          doorPhone = value;
                        },
                        decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.yellowAccent, width: 2),
                            ),
                            label: Text("Door phone")),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150,
                      child: TextFormField(
                        onChanged: (value) {
                          apartment = value;
                        },
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.yellowAccent, width: 2),
                          ),
                          label: Text("Apartment"),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    SizedBox(
                      width: 150,
                      child: TextFormField(
                        onChanged: (value) {
                          floor = value;
                        },
                        decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.yellowAccent, width: 2),
                            ),
                            label: Text("Floor")),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  onChanged: (value) {
                    instructions = value;
                  },
                  decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.yellowAccent, width: 2),
                    ),
                    icon: Icon(CupertinoIcons.chat_bubble,
                        color: Colors.yellow.shade600),
                    label: const Text("Intructions for courier"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "+998 ${context.watch<MainController>().user.phoneNumber}",
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          icon: const Icon(Icons.close),
                                        ),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Order for someone"),
                                        ValueListenableBuilder(
                                          builder: (context, value, child) {
                                            return Switch(
                                              activeColor: Colors.white,
                                              activeTrackColor: Colors.yellow,
                                              inactiveThumbColor: Colors.white,
                                              inactiveTrackColor:
                                                  Colors.grey[200],
                                              value: value,
                                              onChanged: (value) {
                                                isActive.value = value;
                                              },
                                              trackOutlineColor:
                                                  MaterialStateProperty.all(
                                                Colors.grey[200],
                                              ),
                                            );
                                          },
                                          valueListenable: isActive,
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                        child: SizedBox(
                                          height: 50,
                                          width: double.infinity,
                                          child: ColoredBox(
                                            color: Colors.yellow,
                                            child: Center(
                                              child: Text(
                                                "Done",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: TextFormField(
                    enabled: false,
                    onChanged: (value) {
                      phoneNumber = value;
                    },
                    decoration: InputDecoration(
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.yellowAccent,
                            width: 2,
                          ),
                        ),
                        label: const Text(
                          "+998 91 123 45 67",
                          style: TextStyle(
                            color: AppColors.black,
                          ),
                        ),
                        icon: Icon(
                          Icons.person,
                          color: Colors.yellow.shade600,
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 200,
                            child: Column(
                              children: [
                                const Text("Payment methods"),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Row(
                                      children: [
                                        Icon(Icons.money),
                                        Text("Cash"),
                                      ],
                                    ),
                                    ValueListenableBuilder(
                                      builder: (context, value, child) {
                                        return Switch(
                                          activeColor: Colors.white,
                                          activeTrackColor: Colors.yellow,
                                          inactiveThumbColor: Colors.white,
                                          inactiveTrackColor: Colors.grey[200],
                                          value: value,
                                          onChanged: (value) {
                                            isCash.value = value;
                                          },
                                          trackOutlineColor:
                                              MaterialStateProperty.all(
                                            Colors.grey[200],
                                          ),
                                        );
                                      },
                                      valueListenable: isCash,
                                    )
                                  ],
                                ),
                                const Divider(),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: SizedBox(
                                            height: 400,
                                            width: double.infinity,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: TextFormField(
                                                    validator: (value) {
                                                      if (value!.length > 16 ||
                                                          value.length < 16) {
                                                        return "Check your card number";
                                                      }
                                                      return null;
                                                    },
                                                    keyboardType:
                                                        TextInputType.number,
                                                    onChanged: (value) {
                                                      floor = value;
                                                    },
                                                    decoration:
                                                        const InputDecoration(
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .yellowAccent,
                                                            width: 2),
                                                      ),
                                                      label:
                                                          Text("Card number"),
                                                    ),
                                                  ),
                                                ),
                                                const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: 150,
                                                      child: MyForm(),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(CupertinoIcons.creditcard),
                                          Text("Link new card"),
                                        ],
                                      ),
                                      Icon(Icons.arrow_forward_ios_outlined)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: TextFormField(
                    enabled: false,
                    onChanged: (value) {
                      phoneNumber = value;
                    },
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.yellowAccent, width: 2),
                      ),
                      label: const Text(
                        "Select method for payment",
                        style: TextStyle(
                          color: AppColors.black,
                        ),
                      ),
                      icon: Icon(
                        CupertinoIcons.creditcard,
                        color: Colors.yellow.shade600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: ColoredBox(
                  color: Colors.grey[200] ?? Colors.grey,
                  child: SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "${context.watch<MainController>().sum + 5000}\nTotal",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<MainController>().clearCart();
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: const SizedBox(
                              height: 60,
                              width: 200,
                              child: ColoredBox(
                                color: Colors.yellow,
                                child: Center(
                                    child: Text(
                                  "Pay",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController _expiryDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _expiryDateController,
      decoration: const InputDecoration(
        labelText: 'Expiry Date (MM/YY)',
      ),
      keyboardType: TextInputType.number,
      maxLength: 5,
      onChanged: (value) {
        if (value.length == 2 && !_expiryDateController.text.contains('/')) {
          _expiryDateController.text = '$value/';
          _expiryDateController.selection = TextSelection.fromPosition(
            TextPosition(offset: _expiryDateController.text.length),
          );
        } else if (value.length < 2) {
          // Handle the case when the length is less than 2
          _expiryDateController.text = value;
        } else if (value.length == 2 &&
            _expiryDateController.text.endsWith('/')) {
          // Handle the case when the user deletes characters and removes the '/'
          _expiryDateController.text = value;
          _expiryDateController.selection = TextSelection.fromPosition(
            TextPosition(offset: _expiryDateController.text.length),
          );
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 5) {
          return 'Invalid Expiry Date';
        }
        // Additional validation logic if needed
        return null;
      },
    );
  }
}
