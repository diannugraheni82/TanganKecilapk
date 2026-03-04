import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TanganKecil',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF000080)),
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/menu': (context) => const MenuPage(),
      },
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000080),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', width: 150, height: 150),
            const SizedBox(height: 20),
            const Text("TanganKecil",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white,
                )),
            const SizedBox(height: 10),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: 
                  Text("Temukan berbagai produk handmade unik dan menarik untuk anda", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.white70))),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/menu');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[700],
                foregroundColor: const Color(0xFF000080),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Lihat Katalog",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const KatalogView(),
    const SearchView(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF000080),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Setting'),
        ],
      ),
    );
  }
}

class KatalogView extends StatelessWidget {
  const KatalogView({super.key});

  void _tampilkanFormPesanan(BuildContext context, String namaProduk) {
    final TextEditingController controllerPesanan = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Pesan: $namaProduk", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controllerPesanan,
                autofocus: true,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Tulis detail pesanan (warna, ukuran, jumlah)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Pesanan $namaProduk berhasil dikirim!"),
                        backgroundColor: const Color(0xFF000080),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF000080),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Konfirmasi Pesanan"),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> daftarProduk = [
      {
        "nama": "Gelang",
        "harga": "10.000",
        "deskripsi": "Gelang manik aesthetic buatan tangan.",
        "img": "https://plus.unsplash.com/premium_photo-1760620294310-9c90cdbf4a5d?q=80&w=1170"
      },
      {
        "nama": "Boneka Rajut",
        "harga": "120.000",
        "deskripsi": "Amigurumi lucu dari benang katun lembut.",
        "img": "https://images.unsplash.com/photo-1735042390791-8901b96e1794?q=80&w=687"
      },
      {
        "nama": "Tas Rajut",
        "harga": "150.000",
        "deskripsi": "Tas rajut untuk gaya kasual.",
        "img": "https://plus.unsplash.com/premium_photo-1747054588078-696772a1b18d?q=80&w=736"
      },
      {
        "nama": "Topi Rajut",
        "harga": "95.000",
        "deskripsi": "Beanie rajut hangat dengan berbagai warna.",
        "img": "https://plus.unsplash.com/premium_photo-1727427850285-bf6715d4dcc4?q=80&w=687"
      },
      {
        "nama": "Aksesoris",
        "harga": "35.000",
        "deskripsi": "Set aksesoris cantik penambah gaya.",
        "img": "https://plus.unsplash.com/premium_photo-1727427849946-aff41dc09a40?q=80&w=687"
      },
      {
        "nama": "Gantungan Kunci",
        "harga": "50.000",
        "deskripsi": "Gantungan kunci unik rajut premium.",
        "img": "https://images.unsplash.com/photo-1753370474663-1b0ad622c5fc?q=80&w=687"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Katalog TanganKecil",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF000080),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                childAspectRatio: 0.62,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: daftarProduk.length,
              itemBuilder: (context, index) {
                final produk = daftarProduk[index];
                return Card(
                  elevation: 4,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image.network(produk['img']!,
                                fit: BoxFit.cover),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.bookmark,
                                  color: Colors.orange, size: 24),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                produk['nama']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text("Rp ${produk['harga']}",
                                  style: const TextStyle(color: Color(0xFF000080), fontWeight: FontWeight.bold,fontSize: 12)),
                              const SizedBox(height: 6),
                              Text(produk['deskripsi']!,
                                  style: TextStyle(fontSize: 11, color: Colors.grey[700]),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis),
                              const Spacer(),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: () => _tampilkanFormPesanan(context, produk['nama']!),
                                  icon: const Icon(Icons.shopping_cart_outlined, size: 16),
                                  label: const Text("Beli Sekarang", style: TextStyle(fontSize: 11)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF000080),
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();

  List<String> recentSearches = [
    "Gelang Manik Aesthetic",
    "Boneka Rajut Custom",
    "Tas Rajut Selempang",
    "Gantungan Kunci Lucu",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Cari produk handmade...',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        prefixIcon:
                            Icon(Icons.search, color: Colors.grey, size: 20),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: recentSearches.length,
              separatorBuilder: (context, index) =>
                  const Divider(height: 1, indent: 15),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    recentSearches[index],
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  trailing:
                      const Icon(Icons.north_west, size: 16, color: Colors.grey),
                  onTap: () {
                    _searchController.text = recentSearches[index];
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF000080),
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Text("User TanganKecil",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF000080)),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}