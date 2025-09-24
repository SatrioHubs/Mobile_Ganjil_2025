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
  // var gifts = {
  //   'first': 'partridge',
  //   'second': 'turtledoves',
  //   'fifth': 1,
  // };
  // gifts['nama'] = 'Satrio Ahmad Ramadhani';
  // gifts['nim'] = '2341720163';

  // var nobleGases = {
  //   2: 'helium',
  //   10: 'neon',
  //   18: 2,
  // };
  // nobleGases[99] = 'Satrio Ahmad Ramadhani';
  // nobleGases[100] = '2341720163';

  // print(gifts);
  // print(nobleGases);

  // var mhs1 = <String, String>{};
  // mhs1['nama'] = 'Satrio Ahmad Ramadhani';
  // mhs1['nim'] = '2341720163';
  // print(mhs1);

  // var mhs2 = <int, String>{};
  // mhs2[1] = 'Satrio Ahmad Ramadhani';
  // mhs2[2] = '2341720163';
  // print(mhs2);

  //praktikum 4
  // var list = [1, 2, 3];
  // var list2 = [0, ...list];
  // print(list);
  // print(list2);
  // print(list2.length);

// var list1 = [1, 2, null, 2341720163];
// print(list1);
// var list3 = [0, ...?list1];
// print(list3.length);

  // bool promoActive = false; // atau false
  // var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  // print(nav);

  // var login = 'user'; // atau 'User'
  // var nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
  // print(nav2);

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);
}
