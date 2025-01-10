class KaramanSayfasi extends StatefulWidget {
  const KaramanSayfasi({super.key});

  @override
  _KaramanSayfasiState createState() => _KaramanSayfasiState();
}

class _KaramanSayfasiState extends State<KaramanSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Karaman',
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
                  .contains('Karaman')
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: const Color(0xFF8B0000),
            ),
            onPressed: () {
              final provider = context.read<FavoriSehirlerProvider>();
              if (provider.favoriSehirler.contains('Karaman')) {
                provider.removeFavoriSehir('Karaman');
              } else {
                provider.addFavoriSehir('Karaman');
              }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    provider.favoriSehirler.contains('Karaman')
                        ? 'Karaman favorilere eklendi!'
                        : 'Karaman favorilerden çıkarıldı!',
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
                  .contains('Karaman')
                  ? Icons.check
                  : Icons.check_box_outline_blank,
              color: context
                  .watch<GidilenSehirlerProvider>()
                  .gidilenSehirler
                  .contains('Karaman')
                  ? Colors.green
                  : Colors.grey,
            ),
            onPressed: () {
              final provider = context.read<GidilenSehirlerProvider>();
              if (provider.gidilenSehirler.contains('Karaman')) {
                provider.removeGidilenSehir('Karaman');
              } else {
                provider.addGidilenSehir('Karaman');
              }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    provider.gidilenSehirler.contains('Karaman')
                        ? 'Karaman gidilen şehirlere eklendi!'
                        : 'Karaman gidilen şehirlerden çıkarıldı!',
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
                              builder: (context) => const YerSayfasiKaraman(),
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
                              builder: (context) =>
                              const YemekSayfasiKaraman(),
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
                              const WeatherPage(cityName: 'Karaman'),
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