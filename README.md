# Ivan's Book Store Mobile
Nama : Ivan Jehuda Angi

NPM : 2306152222

Kelas : PBP E



## Tugas 7
### Stateless Widget dan Stateful Widget

1. ### Stateless Widget


- Widget yang bersifat statis/tidak berubah (immutable)
- Tidak memiliki data internal yang dapat berubah setelah widget dibuat
- Cocok untuk tampilan yang tidak memerlukan perubahan data/state
- Lebih ringan dan performa lebih baik karena tidak perlu melakukan rebuild
- Contoh penggunaan: text, icon, image yang statis

2. ### Stateful Widget

- Widget yang bersifat dinamis dan dapat berubah (mutable)
- Memiliki internal state yang dapat diubah selama widget hidup
- Dapat melakukan rebuild saat state berubah dengan setState()
- Cocok untuk tampilan yang memerlukan perubahan data/interaksi user
- Contoh penggunaan: form, counter, animasi
### Widget yang digunakan
- Material App Berfungsi sebagai root aplikasi Flutter dan mengatur tema, nama aplikasi, serta konfigurasi awal. Ini mengatur navigasi dan tampilan keseluruhan aplikasi.
- Scaffold Menyediakan struktur dasar layar, seperti AppBar, Body, dan Bottom Navigation. Di sini digunakan untuk membangun tampilan utama aplikasi.
- Text Menampilkan teks statis atau dinamis sesuai dengan data yang diberikan.
- Padding Menambahkan ruang di sekitar widget agar tampilan lebih rapi.
- Column Mengatur tata letak widget secara vertikal
Row Mengatur tata letak secara horizontal
- Card Menyediakan tampilan berupa kartu dengan elevation
- GridView.builder Membuat tata letak berbentuk grid secara dinamis berdasarkan data yang ada.
- ItemCard widget kustom yang menampilkan setiap item dalam grid dengan warna latar belakang tertentu dan ikon yang sesuai.
- SnackBar Menampilkan notifikasi sementara di bagian bawah layar saat pengguna mengetuk item tertentu

### Fungsi `setState()`, dan penggunaanya
Dalam Flutter, fungsi `setState()` digunakan untuk memberi tahu framework bahwa ada perubahan pada state sebuah widget. Saat diminta, Flutter akan merender ulang bagian widget yang terkena dampak untuk menyesuaikan tampilan dengan perubahan data.

Karena setiap widget yang digunakan pada `Ivan's Book Store` saat ini adalah Stateless Widget, seperti  npm, kelas, dan nama,  yang diinisialisasi sekali saat pembuatan widget dan tidak akan berubah maka tidak ada fungsi `setState()`yang digunakan. 



### Variable Final dan Constant

1. ### Final


- Variabel final hanya bisa diassign sekali dan nilainya tidak bisa diubah setelahnya
- Nilai variabel final bisa ditentukan saat runtime
- Cocok untuk nilai yang baru diketahui saat runtime
- Bisa diinisialisasi di constructor

2. ### Constant
- Variabel const nilainya harus sudah diketahui saat compile time
- Tidak bisa menggunakan nilai yang ditentukan saat runtime
- Lebih optimal untuk performa karena nilai sudah fixed saat compile
- Tidak bisa diinisialisasi di constructor biasa (harus const constructor)


### Step by Step Tugas 7
1.  Membuat projek Flutter baru dengan menjalankan _command_ .
    ```
    flutter create ivans_book_store
    ```
2. Memodifikasi main.dart pada direktori ivans_book_store/lib menjadi
    ``` dart
    import 'package:flutter/material.dart';
    import 'package:ivans_book_store/menu.dart';

    void main() {
    runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a purple toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSwatch( primarySwatch: Colors.amber,).copyWith(secondary: Colors.deepPurple[400]),
            useMaterial3: true,
        ),
        home: MyHomePage(),
        );
    }
    }

    ```
3. Membuat file baru pada folder `lib` dengan nama `menu.dart`
4. Mengimport package `material.dart` di `menu.dart`
    ```dart
    import 'package:flutter/material.dart';
    ```
4. Memindahakan class MyHomePage yang awalnya berada di `main.dart` ke `menu.dart` dengan beberapa modifikasi
    ```dart
    class MyHomePage extends StatelessWidget {
    final String npm = '2306152222'; // NPM
    final String name = 'Ivan Jehuda Angi'; // Nama
    final String className = 'PBP E'; // Kelas
    MyHomePage({super.key});
    final List<ItemHomepage> items = [
            ItemHomepage("Tambah Produk", Icons.add, Colors.amber),
            ItemHomepage("Lihat daftar Produk", Icons.store_rounded, Colors.amber.shade600),
            ItemHomepage("Logout", Icons.logout, Colors.amber.shade700),
        ];
        @override
    Widget build(BuildContext context) {
        // Scaffold menyediakan struktur dasar halaman dengan AppBar dan body.
        return Scaffold(
        // AppBar adalah bagian atas halaman yang menampilkan judul.
        appBar: AppBar(
            // Judul aplikasi "Mental Health Tracker" dengan teks putih dan tebal.
            title: const Text(
            "Ivan's Book Store",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
            ),
            ),
            // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
            backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        // Body halaman dengan padding di sekelilingnya.
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            // Menyusun widget secara vertikal dalam sebuah kolom.
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                // Row untuk menampilkan 3 InfoCard secara horizontal.
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    InfoCard(title: 'NPM', content: npm),
                    InfoCard(title: 'Name', content: name),
                    InfoCard(title: 'Class', content: className),
                ],
                ),

                // Memberikan jarak vertikal 16 unit.
                const SizedBox(height: 16.0),

                // Menempatkan widget berikutnya di tengah halaman.
                Center(
                child: Column(
                    // Menyusun teks dan grid item secara vertikal.

                    children: [
                    // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
                    const Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                        "Welcome to Ivan's Book Store",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                        ),
                        ),
                    ),

                    // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
                    GridView.count(
                        primary: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        // Agar grid menyesuaikan tinggi kontennya.
                        shrinkWrap: true,

                        // Menampilkan ItemCard untuk setiap item dalam list items.
                        children: items.map((ItemHomepage item) {
                        return ItemCard(item);
                        }).toList(),
                    ),
                    ],
                ),
                ),
            ],
            ),
        ),
        );
    }
    }
    ```
5. Menambahkan class-class widget seperti ItemCard dan SnackBar kepada `menu.dart` untuk menyesuaikan fungsionalitas dan tampilan app
    ```dart
    class InfoCard extends StatelessWidget {
    // Kartu informasi yang menampilkan title dan content.

    final String title;  // Judul kartu.
    final String content;  // Isi kartu.

    const InfoCard({super.key, required this.title, required this.content});

    @override
    Widget build(BuildContext context) {
        return Card(
        // Membuat kotak kartu dengan bayangan dibawahnya.
        elevation: 2.0,
        child: Container(
            // Mengatur ukuran dan jarak di dalam kartu.
            width: MediaQuery.of(context).size.width / 3.5, // menyesuaikan dengan lebar device yang digunakan.
            padding: const EdgeInsets.all(16.0),
            // Menyusun title dan content secara vertikal.
            child: Column(
            children: [
                Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Text(content),
            ],
            ),
        ),
        );
    }
    }
    class ItemHomepage {
        final String name;
        final IconData icon;
        final Color color;


        ItemHomepage(this.name, this.icon, this.color);
    }

    class ItemCard extends StatelessWidget {
    // Menampilkan kartu dengan ikon dan nama.

    final ItemHomepage item; 
    
    const ItemCard(this.item, {super.key}); 

    @override
    Widget build(BuildContext context) {
        return Material(
        // Menentukan warna latar belakang dari tema aplikasi.
        color: item.color,
        // Membuat sudut kartu melengkung.
        borderRadius: BorderRadius.circular(12),
        
        child: InkWell(
            // Aksi ketika kartu ditekan.
            onTap: () {
            // Menampilkan pesan SnackBar saat kartu ditekan.
            ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
                );
            },
            // Container untuk menyimpan Icon dan Text
            child: Container(
            padding: const EdgeInsets.all(8),
            child: Center(
                child: Column(
                // Menyusun ikon dan teks di tengah kartu.
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Icon(
                    item.icon,
                    color: Colors.white,
                    size: 30.0,
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                    ),
                ],
                ),
            ),
            ),
        ),
        );
    }
    
    }

    ```
6. Membuat repositori baru pada github bertajuk `ivans-book-store-mobile` dan melakukan push kepada repositori tersebut.
