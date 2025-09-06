
void cetakDetailProfil(String nama, String? bio) {
  print('Nama: $nama');

  if (bio != null) {
    print('Bio: $bio');
    print('Panjang Bio: ${bio.length}'); 
  } else {
    print('Bio: (Tidak diatur)');
  }
  print('---');
}

void main() {

  cetakDetailProfil('Budi', 'Penggemar Flutter dan Kopi.');

  cetakDetailProfil('Citra', null);
}