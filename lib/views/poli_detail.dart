import 'package:flutter/material.dart';
import '../model/poli.dart';

class PoliDetail extends StatefulWidget {
  final Poli poli;
  final Function(String) onUpdate; 
  final Function() onDelete;

  const PoliDetail({
    super.key,
    required this.poli,
    required this.onUpdate,
    required this.onDelete,
  });

  @override
  State<PoliDetail> createState() => _PoliDetailState();
}

class _PoliDetailState extends State<PoliDetail> {
  final TextEditingController _namaPoliController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _namaPoliController.text = widget.poli.namaPoli ?? "";
  }

  @override
  void dispose() {
    _namaPoliController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Poli", 
        style: TextStyle(
          color: Colors.white
        ),
        ),
        backgroundColor: const Color(0xFF2499C0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "Nama Poli: ${widget.poli.namaPoli}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final updatedName = await showDialog<String>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Ubah Nama Poli"),
                          content: TextField(
                            controller: _namaPoliController,
                            decoration: const InputDecoration(hintText: "Nama Poli Baru"),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Tutup dialog
                              },
                              child: const Text("Batal"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, _namaPoliController.text); // Kembali dengan nama baru
                              },
                              child: const Text("Simpan"),
                            ),
                          ],
                        );
                      },
                    );

                    if (updatedName != null && updatedName.isNotEmpty) {
                      widget.onUpdate(updatedName); // Panggil callback untuk update
                      setState(() {}); // Memperbarui UI
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text("Ubah"),
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.onDelete(); // Panggil callback untuk hapus
                    Navigator.pop(context); // Kembali ke halaman sebelumnya
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text("Hapus"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
