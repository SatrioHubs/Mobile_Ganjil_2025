class DatabaseService {
  String? ambilDataPenggunaDariDB(String userId) {
    if (userId == 'id-123') {
      return 'Andi Wijaya';
    }
    return null;
  }
}

class ProfilPengguna {
  final DatabaseService _db = DatabaseService();
  
  late String namaLengkap;

  // Method untuk menginisialisasi variabel 'late'
  void muatData(String userId) {
    print('Mencari data untuk user: $userId...');
    String? data = _db.ambilDataPenggunaDariDB(userId);
    if (data != null) {
      namaLengkap = data; // JANJI DITEPATI: variabel diinisialisasi
    } else {
      // Jika data tidak ditemukan, kita tetap harus menginisialisasi
      // atau akan terjadi error saat diakses.
      namaLengkap = 'Pengguna Tidak Dikenal';
    }
  }

  void tampilkanSalam() {
    // Saat baris ini dieksekusi, 'namaLengkap' HARUS sudah punya nilai.
    print('Halo, $namaLengkap!');
  }
}

void main() {
  // Skenario 1: Janji ditepati
  print('## Skenario Sukses ##');
  ProfilPengguna profilAndi = ProfilPengguna();
  profilAndi.muatData('id-123'); // Inisialisasi terjadi di sini
  profilAndi.tampilkanSalam();    // Aman diakses
  
  print('');

  // Skenario 2: Janji dilanggar -> Menyebabkan runtime error
  print('## Skenario Error ##');
  ProfilPengguna profilAnonim = ProfilPengguna();
  // Kita "lupa" memanggil muatData()
  try {
    profilAnonim.tampilkanSalam(); // Error akan terjadi di sini
  } catch (e) {
    print('Terjadi error: $e');
  }
}