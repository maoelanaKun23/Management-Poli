import 'package:flutter/material.dart';
// import '../model/poli.dart';
import '../model/pasien.dart';
import '../views/pasien_page.dart';

class PasienDetail extends StatefulWidget {
  final Pasien pasien;
  // final String nomor_rm;
  // final String alamat;
  // final String tanggal_lahir;
  // final String nomor_telepon;

  final Function(String) onUpdate;
  final Function() onDelete;

  const PasienDetail({
    super.key,
    required this.pasien,
    // required this.nomor_rm,
    // required this.alamat,
    // required this.tanggal_lahir,
    // required this.nomor_telepon,
    required this.onUpdate,
    required this.onDelete,
  });

  @override
  State<PasienDetail> createState() => _PasienDetailState();
}

class _PasienDetailState extends State<PasienDetail> {
  final TextEditingController _namaPasienController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _namaPasienController.text = widget.pasien.namaPasien ?? "";
  }

  @override
  void dispose() {
    _namaPasienController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Pasien",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF2499C0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "Nama Pasien: ${widget.pasien.namaPasien}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 40),
            Text(
              "Nomor Rumah Sakit: ${widget.pasien.nomor_rm}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 40),
            Text(
              "Tanggal Lahir: ${widget.pasien.tanggal_lahir}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 40),
            Text(
              "Alamat: ${widget.pasien.alamat}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 40),
            Text(
              "Nomor Telepon: ${widget.pasien.nomor_telepon}",
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
                          title: const Text("Ubah Nama Pasien"),
                          content: TextField(
                            controller: _namaPasienController,
                            decoration: const InputDecoration(
                                hintText: "Nama Pasien Baru"),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Batal"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(
                                    context, _namaPasienController.text);
                              },
                              child: const Text("Simpan"),
                            ),
                          ],
                        );
                      },
                    );

                    if (updatedName != null && updatedName.isNotEmpty) {
                      widget.onUpdate(updatedName);
                      setState(() {});
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text("Ubah"),
                ),
                ElevatedButton(
                  // onPressed: () => showDialog<String>(
                  //   context: context,
                  //   builder: (BuildContext context) => AlertDialog(
                  //     title: const Text('Delete Confirmation'),
                  //     content: const Text(
                  //         'Apakah Yakin Ingin Mengahapus Data Ini ?'),
                  //     actions: <Widget>[
                  //       TextButton(
                  //         onPressed: () => Navigator.pop(context, 'Cancel'),
                  //         child: const Text('Cancel'),
                  //       ),
                  //       TextButton(
                  //         onPressed: () =>
                  //             Navigator.pop(context, widget.onDelete()),
                  //         child: const Text('Hapus'),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  onPressed: () async {
                    final deleteConfirmation = await showDialog<bool>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title:
                              const Text("Apakah Yakin Ingin Hapus Data Ini?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: const Text("Batal"),
                            ),
                            TextButton(
                              onPressed: () async {
                                await widget.onDelete();
                                Navigator.pop(context, true);
                              },
                              child: const Text("Hapus"),
                            ),
                          ],
                        );
                      },
                    );

                    if (deleteConfirmation == true) {
                      Navigator.pop(context);
                    }
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
