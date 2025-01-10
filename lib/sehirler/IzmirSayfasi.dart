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
                    'https://st3.depositphotos.com/1871501/33278/i/450/depositphotos_332784402-stock-photo-konak-square-street-view-old.jpg',
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
  const YerSayfasiIzmir({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> mekanlar = const [
    {
      'isim': 'Efes Antik Kenti',
      'gorsel':
      'https://img-hopi.mncdn.com/03/d7/03d7c69c2a56486fa7eca272d9235e9f.jpeg',
      'bilgi':
      'UNESCO Dünya Mirası Listesi’nde yer alan çukur İçihöyük, Ayasuluk Tepesi, Efes Antik Kenti ve Meryem Ana bölümlerine ev sahipliği yapan antik kent; Türkiye’nin en çok ziyaret edilen tarihi hazinelerinden biri. Antik dönemin en büyük ve en güçlü kentlerinden biri olma özelliği taşıyan kent Herakleitos ve Hermodos gibi pek çok bilim insanına da geçmiş yıllarda ev sahipliği yapmış.',
      'enlem': 37.940979177654675,
      'boylam': 27.341437124206053,
    },
    {
      'isim': 'İzmir Saat Kulesi',
      'gorsel':
      'https://yuzyillikhikayeler.com/wp-content/uploads/2022/08/izmir-saat-kulesi.jpg',
      'bilgi':
      'İzmir’in en önemli simgelerinden biri olan Saat Kulesi’nin 1901 yılında Osmanlı padişahı II. Abdülhamit tarafından inşa edildiği biliniyor. Padişahın tahta çıkışının 25. yılını kutlamak amacıyla inşa ettirdiği bu şaheser günümüzde İzmir’in en önemli simgelerinden biri haline gelmiş durumda. Kemeraltı Çarşısı’nın girişinde konumlanan ve Konak Yalı Camii’nin hemen yanında olması sebebiyle kolaylıkla ulaşabileceğiniz saat kulesi 25 m yüksekliğe sahip. En önemli özelliği ise sahip olduğu özgün mimari. Özgün mimarisiyle diğer Osmanlı saat kulelerinden ayrılan ve ünlü bir Fransız mimar tarafından tasarlanan kulenin kesme taşları ile inşa edildiği görülüyor. Saat Kulesi, İzmirliler için oldukça önemli ve genellikle buluşma yeri olarak tercih ediliyor.',
      'enlem': 38.41895884140284,
      'boylam': 27.12867854224219,
    },
    {
      'isim': 'Kemeraltı Çarşısı',
      'gorsel':
      'https://hiddenbay.com.tr/media/1390/turkiyenin_en_otantik_yeri_izmir_tarihi_kemeralti_carsisi_h106642_3de51.jpg',
      'bilgi':
      'İzmir’in tarihi yerlerinden biri olan Kemeraltı Çarşısı, 16. yüzlü yıllara dayanan köklü bir geçmişe sahip. Antik çağlardan bu yana yerini ve önemini hiçbir zaman kaybetmemiş olan Kemeraltı Çarşısı, 5 kilometrelik bir alana yayılmış durumda. 15 bin iş yerine ev sahipliği yapıyor olması sebebiyle dikkat çeken Kemeraltı Çarşısı, dünyanın en büyük açık hava alışveriş alanı. Bu özelliği sayesinde her yıl binlerce yerli ve yabancı turist tarafından ziyaret edildiğini dile getirmek mümkün. Kemeraltı Çarşısı içerisinde 16 yüzyıldan kalma çeşmeler, hanlar ve hamamlar bulunuyor. Bunun yanı sıra güncel ihtiyaçların karşılanması adına da çok sayıda işletmeye yer verildiğini dile getirmek mümkün.',
      'enlem': 38.418777316031445,
      'boylam': 27.133013863642415,
    },
    {
      'isim': 'İzmir Tarihi Asansör',
      'gorsel':
      'https://visitizmiryonetim.izmir.bel.tr/YuklenenDosyalar/DestinasyonFotograflari/1024/25042021232008899.jpg',
      'bilgi':
      'Mithatpaşa Caddesi ile Halil Rıfat Paşa Caddesini birbirine bağlamak amacıyla yapılmış bir sokak asansörü olan Tarihi Asansör’ün hikayesini ise dillere destan! Asansörün olmadığı yıllarda iki cadde arası uzunluğun 58 metre olduğu ve bir caddeden diğer caddeye ulaşmak için onlarca basamak çıkmanın gerekiyormuş. Oldukça zahmetli ve yorucu olan bu durumu yaşayan bir ailenin babası olan Devidas, merdivenlerden düşerek ayağını kırıyor ve bunun üstüne yakın dostu Nesim Levi, iki cadde arasında bir asansör yaptırmaya karar vermiş.Tuğlaları bile Marsilya’dan sipariş edilen ve büyük bir özen ile iki caddeyi birbirine bağlayan asansör, 1907 yılında yapılmış olsa da Anadolu’da halen böyle bir yapının başka bir örneği ile karşılaşmak mümkün değil.',
      'enlem': 38.40872957800596,
      'boylam': 27.11765703827491,
    },
    {
      'isim': 'Agora Açıkhava Müzesi',
      'gorsel':
      'https://media-cdn.tripadvisor.com/media/photo-s/1b/30/c5/57/agora-acikhava-muzesi.jpg',
      'bilgi':
      'İzmir\'in tarihi dokusunun bir parçası olan ve şehir merkezinde bulunan Agora Açık Hava Müzesi, çok sayıda kültüre ve çok sayıda katmana sahiplik etmektedir. Kadifekale\"den bakıldığında, açık hava müzesini ve kazı alanlarını çok net bir şekilde görmek mümkündür. Üç katlı tasarımıyla şehir merkezinde yer alan büyük agoralardan biri olan İzmir Agorası, türünün nadide örneklerinden biridir. İzmir’in en eski bölgelerinden biri olan Namazgah\'ta bulunan Agora, Roma Dönemi’nde mermer döşemeli büyük bir dörtlü etrafındaki kemer ve sütunlar üzerine inşa edilmiş çok katlı bir yapıdır. Agora kelimesi “pazar yeri” anlamına gelir.',
      'enlem': 38.41984884649436,
      'boylam': 27.138352898053235,
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
      {Key? key,
        required this.isim,
        required this.gorsel,
        required this.bilgi,
        required this.enlem, // Enlem parametresi
        required this.boylam,
        required this.mekanIsmi, // Boylam parametresi
      }) : super(key: key);

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

class YemekSayfasiIzmir extends StatelessWidget {
  const YemekSayfasiIzmir({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> yemekler = const [
    {
      'isim': 'Boyoz',
      'gorsel':
      'https://cdn.ye-mek.net/App_UI/Img/out/650/2022/09/yufkadan-yalanci-boyoz-resimli-yemek-tarifi(19).jpg',
      'yemekBilgisi':
      'İzmir denildiğinde akla ilk gelen yemeklerden biri olan boyoz temelde bir hamur işi ürünü. Un ve sirke ile hazırlanan ve kendine ait bir hamura sahip olan boyoz, oldukça lezzetli bir alternatif. İzmir’de özellikle sabah kahvaltılarında yaygın olarak tercih edilen boyoz, genellikle yumurta ile satılıyor.',
      'enlem': 38.43922654243253,
      'boylam': 27.143869813594247,
      'restoranIsmi': 'Restoran ismi',
    },
    {
      'isim': 'İzmir Bombası',
      'gorsel':
      'https://cdn.kisikates.com.tr/image-cache/cache/recipe_main_image_large/https---cdn.kisikates.com.tr/recipe-media/41ac46667d323180dce928ef7d68c973672e86ee.jpeg',
      'yemekBilgisi':
      'Son yılların en sevilen tatlılarından biri haline gelen ve orijinali İzmir’de yapılan İzmir bombası, ince açılmış bir hamur içerisinde bulunan çikolata dolgusu ile hazırlanıyor. Ağızda dağılan eşsiz çikolatanın verdiği lezzet, kesinlikle eşsiz bir deneyim yaşamayı sağlıyor. Bomba adıyla da anılan ve Türkiye’nin farklı yerlerinde karşılaşabileceğiniz bu kurabiyenin orijinal ise İzmir’de yapılıyor.',
      'enlem': 38.441201060752455,
      'boylam': 27.14401792680544,
      'restoranIsmi': 'Restoran ismi',
    },
    {
      'isim': 'Şambali Tatlısı',
      'gorsel':
      'https://image.hurimg.com/i/hurriyet/75/750x422/5ec92fbe7af50710c8ceed3c.jpg',
      'yemekBilgisi':
      'İzmir şambalisi olarak da adlandırılan bu tatlı buğday irmiği, toz şeker, süt, yoğurt, nişasta ve kabartma tozu ile hazırlanan bir tatlı. Tepside pişirilen hamurun üzerine piştikten sonra şerbet dökülmesi ile hazırlanan ve oldukça sevilen bir tatlı olan şambali tatlısı, badem ve fıstık ile süsleniyor. Şerbetli bir tatlı olması sebebiyle besleyici ve doyurucu. Bu sebeple özellikle akşam saatlerinde ve yemekten sonra tercih ediliyor.',
      'enlem': 38.460943915945364,
      'boylam': 27.212032085253192,
      'restoranIsmi': 'Restoran ismi',
    },
    {
      'isim': 'İzmir Köftesi',
      'gorsel':
      'https://i.lezzet.com.tr/images-xxlarge-recipe/izmir_kofte-22742567-6176-4e66-945b-8b3499f98bb3.jpg',
      'yemekBilgisi':
      'Akşam yemeklerin vazgeçilmezi olan İzmir Köftesi; kıyma, galeta unu ve domates sosu ile hazırlanıyor. Klasik köftelerden en önemli farkı ise kendine ait özel domates sosu. Yalnızca İzmir için değil Türkiye için en önemli besinlerden biri olan İzmir köftesi, hem yaz hem de kış aylarında tercih ediliyor. Doyurucu bir yemek olan İzmir köftesi genellikle domates, biber de patates gibi sebzeler ile bir arada sunuluyor. Sulu bir yemeğe benzeyen dolayısıyla hem lezzetli hem besleyici olan İzmir Köftesi, özellikle akşam yemeği için hazırlanır.',
      'enlem': 38.41994422800586,
      'boylam': 27.13374328524143,
      'restoranIsmi': 'Restoran ismi',
    },
    {
      'isim': 'İzmir Kumru',
      'gorsel':
      'https://cdn.getiryemek.com/restaurants/1676636783859_1125x522.jpeg',
      'yemekBilgisi':
      'Salam, sosis ve sucuk ile hazırlanan ve son olarak tulum peyniri ilave edilerek servis edilen kumru, İzmir’in ve Çeşme bölgesinin en sevilen yiyeceklerinden biri. Sabah kahvaltılarında ya da akşam saatlerinde tüketilebilecek dolayısıyla keyifli bir alternatif olan kumru, Türkiye’de en çok dikkat çeken atıştırmalıklardan biri. İzmir’den gelen ve en gözde lezzetlerden biri olan kumru, ketçap ve mayonez ile servis ediliyor. Türkiye’nin farklı noktalarında da kumruyla karşılaşmak mümkün. Ancak İzmir şehrinde yapılan ve orijinal kumrunun en önemli özelliği, kendine ait farklı ekmeği ve İzmir tulum peyniri ile hazırlanıyor olması. İçerisinde sosis, sucuk, salam ve peynir gibi pek çok farklı besini bulunduruyor olması oldukça besleyici hale gelmesini sağlıyor.',
      'enlem': 38.45166314758574,
      'boylam': 27.104763428607686,
      'restoranIsmi': 'Restoran ismi',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yenilecek Yemekler'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        itemCount: yemekler.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Yeni sayfaya yönlendirme
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => YemekDetaySayfasiIstanbul(
                    isim: yemekler[index]['isim']!,
                    gorsel: yemekler[index]['gorsel']!,
                    yemekBilgisi: yemekler[index]['yemekBilgisi']!,
                    enlem: yemekler[index]['enlem'], // Enlem parametresi burada gönderiliyor
                    boylam: yemekler[index]['boylam'],
                    restoranIsmi: yemekler[index]['restoranIsmi'],
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
                      image: NetworkImage(yemekler[index]['gorsel']!),
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
                    yemekler[index]['isim']!,
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

class YemekDetaySayfasiIzmir extends StatelessWidget {
  final String isim;
  final String gorsel;
  final String yemekBilgisi;
  final double enlem; // Enlem parametresi eklendi
  final double boylam;
  final String restoranIsmi;

  const YemekDetaySayfasiIzmir(
      {Key? key,
        required this.isim,
        required this.gorsel,
        required this.yemekBilgisi,
        required this.enlem,
        required this.boylam,
        required this.restoranIsmi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isim),
      ),
      body: SingleChildScrollView(
        // SingleChildScrollView eklendi
        child: Padding(
          // Padding ile içerik etrafında boşluk bırakıyoruz
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // Column içinde tüm içerikleri sıralıyoruz
            crossAxisAlignment: CrossAxisAlignment.start, // Sola hizalamak için
            children: [
              // Görselin kenarlarını yuvarlatmak için ClipRRect kullanıyoruz
              ClipRRect(
                borderRadius:
                BorderRadius.circular(40), // Kenar yuvarlama oranı
                child: Image.network(
                  gorsel,
                  width: double.infinity, // Görselin genişliğini tam yapıyoruz
                  height: 300, // Görselin yüksekliğini belirliyoruz
                  fit: BoxFit
                      .cover, // Görselin orantılı şekilde sığmasını sağlıyoruz
                ),
              ),
              const SizedBox(height: 20),
              Text(
                yemekBilgisi, // Yemek hakkında detaylı bilgi
                style:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => YemekleriHaritadaGoster(
                          enlem: enlem, // Parametreleri burada gönderiyoruz
                          boylam: boylam,
                          restoranIsmi:
                          restoranIsmi, // Parametreleri burada gönderiyoruz
                        ),
                      ),
                    );
                  },
                  child: const Text('Haritada Bul'),
                ),
              ),
            ],
          ),
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