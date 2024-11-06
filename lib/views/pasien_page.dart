import 'package:flutter/material.dart';
import '../views/pasien_detail.dart';
import '../views/poli_form.dart';
import '../model/pasien.dart';

class Pasienpage extends StatefulWidget {
  @override
  _PasienpageState createState() => _PasienpageState();
}

class _PasienpageState extends State<Pasienpage> {
  List<Pasien> pasienList = [
    Pasien(
        id: 1,
        namaPasien: "Ahmad Nur",
        nomor_rm: "RM001",
        tanggal_lahir: "1985-05-10",
        alamat: "Jl. Merdeka No. 10, Jakarta",
        nomor_telepon: "081234567890"),
    Pasien(
        id: 2,
        namaPasien: "Rina Kartika",
        nomor_rm: "RM002",
        tanggal_lahir: "1990-12-22",
        alamat: "Jl. Raya Bogor No. 20, Bogor",
        nomor_telepon: "081987654321"),
    Pasien(
        id: 3,
        namaPasien: "Budi Santoso",
        nomor_rm: "RM003",
        tanggal_lahir: "1975-03-15",
        alamat: "Jl. Sudirman No. 5, Bandung",
        nomor_telepon: "085678912345"),
    Pasien(
        id: 4,
        namaPasien: "Siti Aminah",
        nomor_rm: "RM004",
        tanggal_lahir: "1988-08-18",
        alamat: "Jl. Gatot Subroto No. 45, Surabaya",
        nomor_telepon: "082345678901"),
  ];

  void _addPasien() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PoliForm()),
    );

    if (result != null && result is String) {
      setState(() {
        pasienList.add(Pasien(
          namaPasien: result,
          nomor_rm: result,
          tanggal_lahir: result,
          alamat: result,
          nomor_telepon: result,
        ));
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Poli baru berhasil ditambahkan')),
      );
    }
  }

  void _updatePasien(int index, String newName) {
    setState(() {
      pasienList[index].namaPasien = newName;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pasien berhasil diubah')),
    );
  }

  void _deletePasien(int index) {
    setState(() {
      pasienList.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pasien berhasil dihapus')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: pasienList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                  pasienList[index].namaPasien ?? "Pasien Tidak Diketahui"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PasienDetail(
                      pasien: pasienList[index],
                      onUpdate: (newName) => _updatePasien(index, newName),
                      onDelete: () => _deletePasien(index),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _addPasien();
        },
        label: Text("Add Pasien"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
