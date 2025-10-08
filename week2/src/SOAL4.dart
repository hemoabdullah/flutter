class Mahasiswa {
  String nama;
  String? noTelepon;
  late String alamat;

  Mahasiswa(this.nama, this.noTelepon);

  void setAlamat(String alamatBaru) {
    alamat = alamatBaru;
  }

  void showData() {
    print("Nama   : $nama");
    print("Telepon: ${noTelepon ?? 'Belum ada'}");
    print("Alamat : $alamat");
  }
}

void main() {
  var mhs1 = Mahasiswa("Hammam", null);
  mhs1.setAlamat("yaman");
  mhs1.showData();

  print("----");

  var mhs2 = Mahasiswa("aqila", "08123456789");
  mhs2.setAlamat("probolingo");
  mhs2.showData();
}
