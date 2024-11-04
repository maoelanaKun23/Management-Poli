import 'package:flutter/material.dart';
import '../views/poli_detail.dart';
import '../views/poli_form.dart';
import '../model/poli.dart';

class Polipage extends StatefulWidget {
  @override
  _PolipageState createState() => _PolipageState();
}

class _PolipageState extends State<Polipage> {
  List<Poli> poliList = [
    Poli(namaPoli: "Poli Anak"),
    Poli(namaPoli: "Poli Kandungan"),
    Poli(namaPoli: "Poli Gigi"),
    Poli(namaPoli: "Poli THT"),
  ];

  void _addPoli() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PoliForm()),
    );

    if (result != null && result is String) {
      setState(() {
        poliList.add(Poli(namaPoli: result)); // Menambahkan nama poli baru ke daftar
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Poli baru berhasil ditambahkan')),
      );
    }
  }

  void _updatePoli(int index, String newName) {
    setState(() {
      poliList[index].namaPoli = newName; // Mengubah nama poli
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Poli berhasil diubah')),
    );
  }

  void _deletePoli(int index) {
    setState(() {
      poliList.removeAt(index); // Menghapus poli dari daftar
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Poli berhasil dihapus')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Data Poli",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onTap: _addPoli,
          )
        ],
        backgroundColor: const Color(0xFF2499C0),
      ),
      body: ListView.builder(
        itemCount: poliList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(poliList[index].namaPoli ?? "Poli Tidak Diketahui"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PoliDetail(
                      poli: poliList[index],
                      onUpdate: (newName) => _updatePoli(index, newName),
                      onDelete: () => _deletePoli(index),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
