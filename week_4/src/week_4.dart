void main(List<String> arguments) {
  // Praktikum 1
	// final List<String?> list = List<String?>.filled(5, null);
	// list[1] = 'Satrio Ahmad Ramadhani'; 
	// list[2] = '2341720163';
	// print(list);

  // Praktikum 2
  // var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  // print(halogens);

  // var names1 = <String>{};
  // Set<String> names2 = {}; // This works, too.
  // var names3 = {}; // Creates a map, not a set.

  // names1.add('Satrio Ahmad Ramadhani\n');
  // names1.add('2341720163');

  // names2.addAll({'Satrio Ahmad Ramadhani\n', '2341720163'});

  // print(names1);
  // print(names2);
  // print(names3);

  // Praktikum 3
  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1,
  };
  // Tambahkan nama dan NIM
  gifts['nama'] = 'Satrio Ahmad Ramadhani';
  gifts['nim'] = '2341720163';

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2,
  };
  // Tambahkan nama dan NIM
  nobleGases[99] = 'Satrio Ahmad Ramadhani';
  nobleGases[100] = '2341720163';

  print(gifts);
  print(nobleGases);

  var mhs1 = <String, String>{};
  mhs1['nama'] = 'Satrio Ahmad Ramadhani';
  mhs1['nim'] = '2341720163';
  print(mhs1);

  var mhs2 = <int, String>{};
  mhs2[1] = 'Satrio Ahmad Ramadhani';
  mhs2[2] = '2341720163';
  print(mhs2);
}
