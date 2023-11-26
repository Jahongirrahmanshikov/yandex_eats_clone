import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.black87,
            title: const Text(
              "Shops",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                CupertinoIcons.arrow_left,
                color: Colors.white,
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(
                  CupertinoIcons.share,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ListView(
                children: [
                  const TextWidgets(text: "Supermarkets and markets"),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Detail(
                              image:
                                  "https://eda.yandex/images/3512826/e02392a5f97684e63750efce7bbe7220.png",
                              name: "Barka market",
                              time: "35 - 45 min",
                            ),
                            const Detail(
                              image:
                                  "https://eda.yandex/images/3798638/29c4624aad0dc64272a3b082e45fc971.png",
                              name: "The Loaf",
                              time: "35 - 45 min",
                              color: Colors.black87,
                            ),
                            Detail(
                              image:
                                  "https://eda.yandex/images/3435765/b4fb7368189fd462e8451eab2c5f8835.png",
                              name: "Touch of Matcha",
                              time: "35 - 55 min",
                              color: Colors.grey.shade900,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const SizedBox(
                          height: 116,
                          width: 120,
                          child: Detail(
                            image:
                                "https://eda.yandex/images/3580810/83c8d73ee7e4b982d6ec4f3e0c889b36.png",
                            name: "OQ - OT",
                            time: "35 - 55 min",
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const TextWidgets(text: "Confectionery and pastries"),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Detail(
                              image:
                                  "https://eda.yandex/images/3609085/fb3dad12d50ccf10e342132fd08ab94a.png",
                              name: "Sandy",
                              time: "20 - 30 min",
                              color: Colors.deepPurple,
                            ),
                            const Detail(
                              image:
                                  "https://eda.yandex/images/3436037/2282e74a143574ecf1a8d63007b73136.png",
                              name: "Jelly",
                              time: "25 - 35 min",
                            ),
                            Detail(
                              image:
                                  "https://eda.yandex/images/3435765/b4fb7368189fd462e8451eab2c5f8835.png",
                              name: "Lazza Xadra",
                              time: "25 - 35 min",
                              color: Colors.red.shade200,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Detail(
                              image:
                                  "https://eda.yandex/images/3774488/115f7b80c40363010b597fd2630a2c3e.png",
                              name: "Dessert Mir Bac",
                              time: "25 - 45 min",
                              color: Colors.black87,
                            ),
                            const Detail(
                              image:
                                  "https://eda.yandex/images/3583740/ea1b5a2e278d507041afb35d580854e8.png",
                              name: "Heromochi",
                              time: "30 - 40 min",
                              color: Colors.black87,
                            ),
                            Detail(
                              image:
                                  "https://eda.yandex/images/3709189/0881ad0e730b42afb2afc662a825de06.png",
                              name: "Kulikov",
                              time: "30 - 40 min",
                              color: Colors.purpleAccent.shade700,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Row(
                          children: [
                            Detail(
                              image:
                                  "https://eda.yandex/images/3507668/2bbbfa7f1a2f5f24eeee4dd57353273b.png",
                              name: "Venskaya Pekarnaya",
                              time: "35 - 45 min",
                            ),
                            Detail(
                              image:
                                  "https://avatars.mds.yandex.net/get-eda/3420935/8f4be11aa193ad0db5cbcc177fd9043d/orig",
                              name: "La Baguette",
                              time: "35 - 45 min",
                            ),
                            Detail(
                              image:
                                  "https://eda.yandex/images/3377781/3880fbdb3e9f961b21b8a3671e3a865c.png",
                              name: "Hamsa boutiqu",
                              time: "35 - 45 min",
                              color: Colors.black54,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Detail(
                              image:
                                  "https://eda.yandex/images/3609085/7a56c739424fef3fd3753e157734da60.png",
                              name: "Natko",
                              time: "35 - 45 min",
                            ),
                            Detail(
                              image:
                                  "https://eda.yandex/images/3609085/d498c0080ea8dac5c0c11476038ae965.png",
                              name: "Crafers",
                              time: "35 - 45 min",
                              color: Colors.deepPurpleAccent.shade700,
                            ),
                            const Detail(
                              image:
                                  "https://eda.yandex/images/3580810/661c46e03eb07b1dd38d5bb1f7013119.png",
                              name: "ZFFR BUTIK",
                              time: "35 - 55 min",
                              color: Colors.black87,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Detail(
                              image:
                                  "https://eda.yandex/images/3580810/dbf98fc73379ffcbb92cfc071ad08bc0.png",
                              name: "Zira",
                              time: "35 - 45 min",
                              color: Colors.red.shade50,
                            ),
                            const Detail(
                              image:
                                  "https://eda.yandex/images/3596693/9b2dac1ee3e07481710e2dfcf27c408a.png",
                              name: "Berlion",
                              time: "35 - 45 min",
                            ),
                            const Detail(
                              image:
                                  "https://eda.yandex/images/3506707/da84446419e30bb23d72acd66da73165.png",
                              name: "Viva Maria",
                              time: "35 - 55 min",
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                  const TextWidgets(text: "Flowres and gifts"),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Detail(
                              image:
                                  "https://eda.yandex/images/3504598/c0cad0490c570bf5d75869a6f06c3429.png",
                              name: "The Flower Factory",
                              time: "35 - 45 min",
                              color: Colors.green.shade900,
                            ),
                            Detail(
                              image:
                                  "https://eda.yandex/images/3709189/f61bba24ea77c72210277b4511a2c37e.png",
                              name: "Hobby Games",
                              time: "35 - 55 min",
                              color: Colors.grey.shade900,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Row(
                          children: [
                            Detail(
                              image:
                                  "https://eda.yandex/images/3595156/f9b9df6e723baaa460f7021d1ab29d00.png",
                              name: "Orchides",
                              time: "35 - 45 min",
                            ),
                            Detail(
                              image:
                                  "https://eda.yandex/images/3583862/565452ab7d2720cf9940c5743aa4f415.png",
                              name: "Le Bouton",
                              time: "35 - 55 min",
                              color: Colors.black87,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                  const TextWidgets(text: "Beauty and health"),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Detail(
                              image:
                                  "https://eda.yandex/images/3513074/b98e5f07077ed680e1e3685def864c18.png",
                              name: "Binafsha",
                              time: "35 - 45 min",
                              color: Colors.deepPurple.shade900,
                            ),
                            Detail(
                              image:
                                  "https://avatars.mds.yandex.net/get-eda/3337779/66fe310fc525ae092c8faee9a3d0021e/orig",
                              name: "LETIQUE",
                              time: "35 - 55 min",
                              color: Colors.grey.shade200,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Row(
                          children: [
                            Detail(
                              image:
                                  "https://eda.yandex/images/3709189/d2e453fd093dff8f526af2a318ac8dfe.png",
                              name: "Bellstore",
                              time: "35 - 45 min",
                              color: Colors.pinkAccent,
                            ),
                            Detail(
                              image:
                                  "https://avatars.mds.yandex.net/get-eda/3702558/ea7c67023e1557df98e5268253c196a6/orig",
                              name: "La Levon",
                              time: "35 - 55 min",
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                  const TextWidgets(text: "Household goods"),
                  SizedBox(
                    child: Row(
                      children: [
                        Detail(
                          image:
                              "https://eda.yandex/images/3504598/a14c86769819f80a96d62fd49d904782.png",
                          name: "Moto",
                          time: "35 - 45 min",
                          color: Colors.deepPurple.shade900,
                        ),
                        const Detail(
                          image:
                              "https://eda.yandex/images/3490335/56a63758f75e1a07d61d1c75c8e45aba.png",
                          name: "Kukmara",
                          time: "35 - 55 min",
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                  const TextWidgets(text: "Ped stores"),
                  const SizedBox(
                    child: Row(
                      children: [
                        Detail(
                          image:
                              "https://eda.yandex/images/3378693/1f58bbef7954f244e711cab9b0726135.png",
                          name: "ZOO VET HAPPY",
                          time: "35 - 45 min",
                        ),
                        Detail(
                          image:
                              "https://eda.yandex/images/3585205/f75e840d72bac926ac3b254be2df6db1.png",
                          name: "Animal Planet",
                          time: "35 - 55 min",
                        ),
                      ],
                    ),
                  ),
                  const TextWidgets(text: "Something special"),
                  SizedBox(
                    child: Row(
                      children: [
                        Detail(
                          image:
                              "https://eda.yandex/images/3580810/70931bd9d44c27120530956a4e3e5842.png",
                          name: "Kish Mish ",
                          time: "35 - 45 min",
                          color: Colors.orange.shade900,
                        ),
                        const Detail(
                          image:
                              "https://eda.yandex/images/3682162/e1e9c4541227d09591e547772f49d4dc.png",
                          name: "Red Dragon",
                          time: "35 - 55 min",
                          color: Colors.white10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TextWidgets extends StatelessWidget {
  const TextWidgets({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13.0),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  const Detail({
    super.key,
    this.color = Colors.white,
    required this.image,
    required this.name,
    required this.time,
  });
  final Color? color;
  final String image;
  final String name;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: color,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Image(
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            name,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400),
          ),
          Text(
            time,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
