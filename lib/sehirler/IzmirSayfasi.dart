import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class IzmirSayfasi extends StatefulWidget {
  const IzmirSayfasi({super.key});

  @override
  _IzmirSayfasiState createState() => _IzmirSayfasiState();
}

class _IzmirSayfasiState extends State<IzmirSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'İzmir',
          style: TextStyle(
            color: Color(0xFF8B0000),
            fontSize: 27,
            fontWeight: FontWeight.bold,
            fontFamily: 'Serif',
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF8B0000),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          // Favori şehirler butonu
          IconButton(
            icon: Icon(
              context
                      .watch<FavoriSehirlerProvider>()
                      .favoriSehirler
                      .contains('İzmir')
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: const Color(0xFF8B0000),
            ),
            onPressed: () {
              final provider = context.read<FavoriSehirlerProvider>();
              if (provider.favoriSehirler.contains('İzmir')) {
                provider.removeFavoriSehir('İzmir');
              } else {
                provider.addFavoriSehir('İzmir');
              }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    provider.favoriSehirler.contains('İzmir')
                        ? 'İzmir favorilere eklendi!'
                        : 'İzmir favorilerden çıkarıldı!',
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          ),

          // Gidilen şehirler butonu
          IconButton(
            icon: Icon(
              context
                      .watch<GidilenSehirlerProvider>()
                      .gidilenSehirler
                      .contains('İzmir')
                  ? Icons.check
                  : Icons.check_box_outline_blank,
              color: context
                      .watch<GidilenSehirlerProvider>()
                      .gidilenSehirler
                      .contains('İzmir')
                  ? Colors.green
                  : Colors.grey,
            ),
            onPressed: () {
              final provider = context.read<GidilenSehirlerProvider>();
              if (provider.gidilenSehirler.contains('İzmir')) {
                provider.removeGidilenSehir('İzmir');
              } else {
                provider.addGidilenSehir('İzmir');
              }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    provider.gidilenSehirler.contains('İzmir')
                        ? 'İzmir gidilen şehirlere eklendi!'
                        : 'İzmir gidilen şehirlerden çıkarıldı!',
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 20)
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: AspectRatio(
                  aspectRatio: 1.2,
                  child: Image.network(
                    '',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 10)
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Text(
                    '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const YerSayfasiIzmir(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.map, color: Colors.green),
                            SizedBox(width: 6),
                            Text('Nereye gitmek istersin?',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const YemekSayfasiIzmir(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.fastfood, color: Colors.yellow),
                            SizedBox(width: 6),
                            Text('Ne yemek istersin?',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Hava durumu butonu doğrudan CityPage'e yönlendiriyor
                      ElevatedButton(
                        onPressed: () {
                          // Burada, aradaki gereksiz sayfa geçişini kaldırıyoruz
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const WeatherPage(cityName: 'İzmir'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.wb_sunny, color: Colors.white),
                            SizedBox(width: 6),
                            Text('Hava Durumunu Gör',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Ana sayfa butonu
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Ana sayfaya yönlendirme
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SehirSayfasi()),
                );
              },
            ),
            // Favoriler butonu
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                // Favoriler sayfasına yönlendirme
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavorilerSayfasi()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                // Gidilen şehirler sayfasına yönlendirme
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GidilenlerSayfasi()),
                );
              },
            ),
            // Profil butonu
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                // Profil sayfasına yönlendirme
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfilSayfasi()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class YerSayfasiIzmir extends StatelessWidget {
  const YerSayfasiIzmir({super.key});

  final List<Map<String, String>> mekanlar = const [
    {'isim': 'Efes Antik Kenti',
      'gorsel':
      'https://img-hopi.mncdn.com/03/d7/03d7c69c2a56486fa7eca272d9235e9f.jpeg',
      'bilgi':
      'UNESCO Dünya Mirası Listesi’nde yer alan çukur İçihöyük, Ayasuluk Tepesi, Efes Antik Kenti ve Meryem Ana bölümlerine ev sahipliği yapan antik kent; Türkiye’nin en çok ziyaret edilen tarihi hazinelerinden biri. Antik dönemin en büyük ve en güçlü kentlerinden biri olma özelliği taşıyan kent Herakleitos ve Hermodos gibi pek çok bilim insanına da geçmiş yıllarda ev sahipliği yapmış.',
      'enlem': 37.940979177654675,
      'boylam': 27.341437124206053,
    },
    {'isim': '',
      'gorsel': '',
      'bilgi': ''
    },
    {'isim': '',
      'gorsel': '',
      'bilgi': ''
    },
    {'isim': '',
      'gorsel': '',
      'bilgi': ''
    },
    {'isim': '',
      'gorsel': '',
      'bilgi': ''
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gezilecek Yerler'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        itemCount: mekanlar.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Yeni sayfaya yönlendirme
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => YerDetaySayfasiIstanbul(
                    isim: mekanlar[index]['isim']!,
                    gorsel: mekanlar[index]['gorsel']!,
                    bilgi: mekanlar[index]['bilgi']!,
                    enlem: mekanlar[index]['enlem'], // Enlem parametresi burada gönderiliyor
                    boylam: mekanlar[index]['boylam'],
                    mekanIsmi: mekanlar[index]['isim'],
                  ),
                ),
              );
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(mekanlar[index]['gorsel']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                Center(
                  child: Text(
                    mekanlar[index]['isim']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Ana sayfa butonu
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SehirSayfasi()),
                );
              },
            ),
            // Favoriler butonu
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavorilerSayfasi()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                // Gidilen şehirler sayfasına yönlendirme
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GidilenlerSayfasi()),
                );
              },
            ),
            // Profil butonu
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfilSayfasi()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class YerDetaySayfasiIzmir extends StatelessWidget {
  final String isim;
  final String gorsel;
  final String bilgi;
  final double enlem; // Enlem parametresi eklendi
  final double boylam;
  final String mekanIsmi;

  const YerDetaySayfasiIzmir(
      {super.key,
      required this.isim,
      required this.gorsel,
      required this.bilgi,
      required this.enlem,
      required this.boylam,
      required this.mekanIsmi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isim),
      ),
      body: SingleChildScrollView(
        // SingleChildScrollView eklendi
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  gorsel,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                bilgi, // Burada "bilgi" parametresini kullanıyoruz
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20), // Biraz daha boşluk ekleyebiliriz
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YerleriHaritadaGoster(
                      enlem: enlem, // Parametreleri burada gönderiyoruz
                      boylam: boylam,
                      mekanIsmi: mekanIsmi, // Parametreleri burada gönderiyoruz
                    ),
                  ),
                );
              },
              child: const Text('Haritada Bul'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Ana sayfa butonu
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Ana sayfaya yönlendirme
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SehirSayfasi()),
                );
              },
            ),
            // Favoriler butonu
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                // Favoriler sayfasına yönlendirme
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavorilerSayfasi()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                // Gidilen şehirler sayfasına yönlendirme
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GidilenlerSayfasi()),
                );
              },
            ),
            // Profil butonu
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                // Profil sayfasına yönlendirme
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfilSayfasi()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}