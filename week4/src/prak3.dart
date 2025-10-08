void main(List<String> args) {
  // Langkah 1 & 2: Map dengan value campuran, lalu diperbaiki ke String semua
  var gifts = {'first': 'partridge', 'second': 'turtledoves', 'fifth': '1'};

  var nobleGases = {2: 'helium', 10: 'neon', 18: '2'};

  print('gifts awal: $gifts');
  print('nobleGases awal: $nobleGases');

  // Langkah 3: Map bertipe khusus dan update value agar konsisten
  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';
  gifts['nama'] = 'Hammam Abdullah BG';
  gifts['nim'] = '2341720203';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';
  nobleGases[99] = 'Hammam Abdullah BG';
  nobleGases[100] = '2341720203';

  mhs1['nama'] = 'Hammam Abdullah BG';
  mhs1['nim'] = '2341720203';

  mhs2[1] = 'Hammam Abdullah BG';
  mhs2[2] = '2341720203';

  print('\nSetelah update:');
  print('gifts: $gifts');
  print('nobleGases: $nobleGases');
}
