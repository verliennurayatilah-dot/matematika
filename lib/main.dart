import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Volume(),
  ));
}

class Volume extends StatefulWidget {
  @override
  State<Volume> createState() => VolumeState();
}

class VolumeState extends State<Volume> {
  final panjang = TextEditingController();
  final lebar = TextEditingController();
  final tinggi = TextEditingController();

  String hasil = "";

  void hitung() {
    double? p = double.tryParse(panjang.text);
    double? l = double.tryParse(lebar.text);
    double? t = double.tryParse(tinggi.text);

    if (p == null || l == null || t == null) {
      setState(() {
        hasil = "Masukkan angka pada semua kolom!";
      });
      return;
    }

    double volume = p * l * t;

    setState(() {
      hasil = "V = p × l × t\n"
          "V = $p × $l × $t\n"
          "Volume = $volume cm³";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Volume Balok"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: panjang,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Panjang",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: lebar,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Lebar",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: tinggi,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Tinggi",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: hitung,
              child: Text("Hitung Volume"),
            ),
            SizedBox(height: 20),
            Text(
              hasil,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
