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
      home: const LandingPage(),
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
            Image.asset('assets/logo.png', width: 150, height: 150
            ),
            const SizedBox(height: 20),
            const Text("TanganKecil", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white,)),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text("Temukan berbagai produk handmade unik dan menarik untuk anda", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.white70))),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[700],
                foregroundColor: const Color(0xFF000080),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Lihat Katalog", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

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
                  hintText: "Tulis detail pesanan (warna, ukuran, jumlah)...",
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
        title: const Text("Katalog TanganKecil", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF000080),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text("Temukan produk favoritmu!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF000080)),
              ),
            ),
          ),
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image.network(produk['img']!, fit: BoxFit.cover),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.bookmark, color: Colors.orange, size: 24),
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
                              Text(produk['nama']!,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text("Rp ${produk['harga']}", style: const TextStyle(color: Color(0xFF000080), fontWeight: FontWeight.bold, fontSize: 12)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(produk['deskripsi']!, style: TextStyle(fontSize: 11, color: Colors.grey[700]), maxLines: 2, overflow: TextOverflow.ellipsis),
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
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}