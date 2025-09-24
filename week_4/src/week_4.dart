void main(List<String> arguments) {
  // Praktikum 1
	// final List<String?> list = List<String?>.filled(5, null);
	// list[1] = 'Satrio Ahmad Ramadhani'; 
	// list[2] = '2341720163';
	// print(list);

  // Praktikum 2
  // var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  // print(halogens);

var names1 = <String>{};
Set<String> names2 = {}; // This works, too.
var names3 = {}; // Creates a map, not a set.

names1.add('Satrio Ahmad Ramadhani\n');
names1.add('2341720163');

names2.addAll({'Satrio Ahmad Ramadhani\n', '2341720163'});

print(names1);
print(names2);
print(names3);
}
