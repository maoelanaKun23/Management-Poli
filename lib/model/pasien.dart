class Pasien {
  int? id;
  String? namaPasien;
  String? nomor_rm;
  String? tanggal_lahir;
  String? alamat;
  String? nomor_telepon;

  // ignore: non_constant_identifier_names
  Pasien(
      {this.id,
      required this.namaPasien,
      required this.nomor_rm,
      this.alamat,
      this.nomor_telepon,
      this.tanggal_lahir
      });
}
