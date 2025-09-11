void main() {
  String nim = "2341720163 - Satrio Ahmad Ramadhani";

  for (int index = 0; index <= 201; index++) {
    bool adalahPrima = true;

    if (index <= 1) {
      adalahPrima = false;
    } else {
      for (int i = 2; i * i <= index; i++) {
        if (index % i == 0) {
          adalahPrima = false; 
          break; 
        }
      }
    }

    if (adalahPrima) {
      print("Prima (${index}): ${nim}");
    } else {
      print(index);
    }
  }
}