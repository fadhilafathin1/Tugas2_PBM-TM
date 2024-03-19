import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Point Juice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Menu> daftar = [
    Menu(
      nama: "Jus Jambu",
      harga: 15000,
      deskripsi:
          "Jus jambu segar yang disajikan dengan es batu, memberikan sensasi dingin.",
      rate: 4.5,
      gambar:
          "https://i.pinimg.com/564x/87/6e/ac/876eac6d9409a4175443f860cb341a02.jpg",
    ),
    Menu(
      nama: "Jus Kiwi",
      harga: 18000,
      deskripsi: "Minuman segar dari buah kiwi matang kaya akan vitamin C.",
      rate: 4.5,
      gambar:
          "https://i.pinimg.com/564x/6d/6c/e3/6d6ce35ef6452fe4aaac9fa76a26340f.jpg",
    ),
    Menu(
      nama: "Jus Mangga",
      harga: 15000,
      deskripsi:
          "Minuman segar dari buah mangga matang, dengan rasa manis yang khas.",
      rate: 5.0,
      gambar:
          "https://i.pinimg.com/564x/55/a3/49/55a3490010db1baf06cba1cc9a935f63.jpg",
    ),
    Menu(
      nama: "Jus Alpukat",
      harga: 16000,
      deskripsi:
          "Minuman segar dari alpukat matang, dengan rasa krimi yang lembut dan nikmat.",
      rate: 4.6,
      gambar:
          "https://i.pinimg.com/564x/6d/ee/e0/6deee00a4051d4634707486b5732d80f.jpg",
    ),
    Menu(
      nama: "Jus Apel",
      harga: 18000,
      deskripsi:
          "Minuman segar dari apel matang, menyegarkan dan kaya nutrisi.",
      rate: 4.5,
      gambar:
          "https://i.pinimg.com/564x/3a/8c/d4/3a8cd4818956233638765fcdd754a1a6.jpg",
    ),
    Menu(
      nama: "Jus Nanas",
      harga: 12000,
      deskripsi:
          "Minuman segar dari nanas matang, memberikan kesegaran tropis.",
      rate: 4.0,
      gambar:
          "https://i.pinimg.com/564x/12/3d/92/123d92b3dde643f1f6bc6239ac34b285.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Point Juice',
          style: TextStyle(
              fontWeight: FontWeight.w900, color: Colors.white, fontSize: 28),
        ),
        backgroundColor: const Color.fromARGB(255, 198, 77, 68),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: daftar.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            color: const Color.fromARGB(255, 208, 107, 100),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FadeInImage.assetNetwork(
                      placeholder: "assets/placeholder.png",
                      image: daftar[index].gambar,
                      width: 100,
                      height: 125,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          daftar[index].nama,
                          style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 6.0),
                        Text(
                          daftar[index].deskripsi,
                          style: const TextStyle(
                              fontSize: 14.0, color: Colors.white),
                        ),
                        const SizedBox(height: 6.0),
                        Row(
                          children: <Widget>[
                            Text(
                              "Rp. ${daftar[index].harga}",
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6.0),
                        Row(
                          children: <Widget>[
                            for (int i = 0; i < 5; i++)
                              if (daftar[index].rate >= i + 1)
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                )
                              else if (daftar[index].rate >= i + 0.5)
                                const Icon(
                                  Icons.star_half,
                                  color: Colors.yellow,
                                )
                              else
                                const Icon(
                                  Icons.star_border,
                                  color: Colors.white,
                                ),
                            const SizedBox(width: 6.0),
                            Text(
                              "${daftar[index].rate}",
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Menu {
  String nama;
  int harga;
  String deskripsi;
  double rate;
  String gambar;

  Menu({
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.rate,
    required this.gambar,
  });
}
