import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuzzy/input_domain.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  // Domain
  Map<String, String> inputDomain = {
    'minMuda': '25',
    'maxMuda': '45',
    'minParubaya': '35',
    'maxParubaya': '55',
    'minTua': '45',
    'maxTua': '65',
    'minJunior': '5',
    'maxJunior': '15',
    'minSenior': '10',
    'maxSenior': '20',
  };

  final usiaController = TextEditingController();
  final masaKerjaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Card(
                    child: ListTile(
                      title: Text('Aplikasi Fuzzy',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      trailing: MaterialButton(
                        color: Theme.of(context).primaryColor,
                        colorBrightness: Brightness.dark,
                        child: Text(
                          'Tentang'.toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          showAboutDialog(
                              context: context,
                              applicationName: 'Aplikasi Fuzzy',
                              applicationVersion: 'v.0.1.0',
                              children: [
                                Text(
                                    'Dibuat oleh kelompok 4 untuk memenuhi tugas\npembuatan aplikasi penghitung sistem fuzzy'),
                                Text(
                                    '''\nAnggota Kelompok:\nR. Bagas Wastu Wiratama (10120128)\nKautsar Teguh Dwi Putra (10120155)\nJhonathan Kenzo (10120142)\nIrshal Mulky Herlambang (10120146)\n'''),
                                Text('\nKode sumber: '),
                                InkWell(
                                    onTap: () async {
                                      await launch(
                                          'https://gitlab.com/bagaswastuw/projectfuzzy');
                                    },
                                    child: Text(
                                      'gitlab.com/bagaswastuw/projectfuzzy',
                                      style: TextStyle(color: Colors.blue),
                                    )),
                              ]);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ListTile(
                                title: Text(
                                  'Domain',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                trailing: OutlinedButton(
                                    onPressed: () async {
                                      final inputDomain = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => InputDomain(
                                            inputDomain: this.inputDomain,
                                          ),
                                        ),
                                      );

                                      setState(() {
                                        this.inputDomain = inputDomain;
                                      });
                                    },
                                    child: Text('Setting Domain'.toUpperCase(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600))),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Usia',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor)),
                                        SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 8),
                                              height: 10,
                                              width: 10,
                                              color: Colors.green,
                                            ),
                                            Text(
                                                'Muda: ${inputDomain['minMuda']}-${inputDomain['maxMuda']}'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 8),
                                              height: 10,
                                              width: 10,
                                              color: Colors.amber,
                                            ),
                                            Text(
                                                'Parubaya: ${inputDomain['minParubaya']}-${inputDomain['maxParubaya']}'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 8),
                                              height: 10,
                                              width: 10,
                                              color: Colors.red,
                                            ),
                                            Text(
                                                'Tua: ${inputDomain['minTua']}-${inputDomain['maxTua']}'),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 16),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Masa Kerja',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor)),
                                        SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 8),
                                              height: 10,
                                              width: 10,
                                              color: Colors.cyan,
                                            ),
                                            Text(
                                                'Junior: ${inputDomain['minJunior']}-${inputDomain['maxJunior']}'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 8),
                                              height: 10,
                                              width: 10,
                                              color: Colors.purple,
                                            ),
                                            Text(
                                                'Senior: ${inputDomain['minSenior']}-${inputDomain['maxSenior']}'),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(
                                  'Hitung',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      TextFormField(
                                        controller: usiaController,
                                        decoration: InputDecoration(
                                          labelText: 'Usia',
                                        ),
                                        validator: (text) {
                                          if (text == null || text.isEmpty) {
                                            return 'Usia tidak boleh kosong';
                                          }
                                        },
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      TextFormField(
                                        controller: masaKerjaController,
                                        validator: (text) {
                                          if (text == null || text.isEmpty) {
                                            return 'Masa kerja tidak boleh kosong';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'Masa Kerja',
                                        ),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      MaterialButton(
                                          color: Theme.of(context).primaryColor,
                                          colorBrightness: Brightness.dark,
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Text('Cek Fuzzy'),
                                                      content:
                                                          SingleChildScrollView(
                                                        child: Builder(
                                                            builder: (context) {
                                                          // Klasifikasi usia
                                                          final usia =
                                                              int.parse(
                                                                  usiaController
                                                                      .text);
                                                          final minMuda = 25;
                                                          final maxMuda = int
                                                              .parse(inputDomain[
                                                                  'maxMuda']!);
                                                          final minParubaya = int
                                                              .parse(inputDomain[
                                                                  'minParubaya']!);
                                                          final maxParubaya = int
                                                              .parse(inputDomain[
                                                                  'maxParubaya']!);
                                                          final maxTua = 65;

                                                          late String muMuda;
                                                          late String
                                                              muParubaya;
                                                          late String muTua;

                                                          if (usia <=
                                                              minParubaya) {
                                                            muMuda = '1';
                                                            muParubaya = '0';
                                                            muTua = '0';
                                                          } else if (usia >=
                                                                  minParubaya &&
                                                              usia <= maxMuda) {
                                                            muMuda = ((maxMuda -
                                                                        usia) /
                                                                    (maxMuda -
                                                                        minMuda))
                                                                .toString();
                                                            muParubaya = ((usia -
                                                                        minParubaya) /
                                                                    (maxParubaya -
                                                                        minParubaya))
                                                                .toString();
                                                            muTua = '0';
                                                          } else if (usia >=
                                                                  maxMuda &&
                                                              usia <
                                                                  maxParubaya) {
                                                            muMuda = '0';
                                                            muParubaya = ((maxParubaya -
                                                                        usia) /
                                                                    (maxParubaya /
                                                                        minParubaya))
                                                                .toString();
                                                            muTua = ((usia -
                                                                        maxMuda) /
                                                                    (maxTua -
                                                                        minMuda))
                                                                .toString();
                                                          } else {
                                                            muMuda = '0';
                                                            muParubaya = '0';
                                                            muTua = '1';
                                                          }

                                                          print(
                                                              'usia: $usia, minParubaya: $minParubaya, maxMuda: $maxMuda');

                                                          // Klasifikasi masa kerja
                                                          final masaKerja =
                                                              int.parse(
                                                                  masaKerjaController
                                                                      .text);
                                                          final maxJunior = int
                                                              .parse(inputDomain[
                                                                  'maxJunior']!);

                                                          final minSenior = int
                                                              .parse(inputDomain[
                                                                  'minSenior']!);

                                                          late String muJunior;
                                                          late String muSenior;

                                                          if (masaKerja <=
                                                              minSenior) {
                                                            muJunior = '1';
                                                            muSenior = '0';
                                                          } else if (masaKerja >=
                                                                  minSenior &&
                                                              masaKerja <=
                                                                  maxJunior) {
                                                            muJunior = ((maxJunior -
                                                                        masaKerja) /
                                                                    (maxJunior -
                                                                        minSenior))
                                                                .toString();
                                                            muSenior = ((masaKerja -
                                                                        minSenior) /
                                                                    (maxJunior -
                                                                        minSenior))
                                                                .toString();
                                                          } else {
                                                            muJunior = '0';
                                                            muSenior = '1';
                                                          }

                                                          // Keterangan Ket Usia
                                                          String ketUsia = '';

                                                          if (double.parse(
                                                                  muMuda) >
                                                              double.parse(
                                                                  muParubaya)) {
                                                            ketUsia = 'muda';
                                                          } else if ((double.parse(
                                                                      muMuda) <
                                                                  double.parse(
                                                                      muParubaya)) &&
                                                              (double.parse(
                                                                      muParubaya) >
                                                                  double.parse(
                                                                      muTua))) {
                                                            ketUsia =
                                                                'parubaya';
                                                          } else if (double.parse(
                                                                  muParubaya) <
                                                              double.parse(
                                                                  muTua)) {
                                                            ketUsia = 'tua';
                                                          }

                                                          // Keterangan Masa Kerja
                                                          String ketMasaKerja =
                                                              '';

                                                          if (double.parse(
                                                                  muJunior) >
                                                              double.parse(
                                                                  muSenior)) {
                                                            ketMasaKerja =
                                                                'junior';
                                                          } else {
                                                            ketMasaKerja =
                                                                'senior';
                                                          }

                                                          return Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  'μ Muda: $muMuda'),
                                                              Text(
                                                                  'μ Parubaya: $muParubaya'),
                                                              Text(
                                                                  'μ Tua: $muTua'),
                                                              Divider(),
                                                              Text(
                                                                  'μ Junior: $muJunior'),
                                                              Text(
                                                                  'μ Senior: $muSenior'),
                                                              Divider(),
                                                              Builder(builder:
                                                                  (context) {
                                                                // Keterangan status
                                                                String status =
                                                                    '';
                                                                if (ketUsia ==
                                                                        'Muda' &&
                                                                    ketMasaKerja ==
                                                                        'Junior') {
                                                                  status =
                                                                      'tidak mendapatkan pinjaman';
                                                                } else if (ketUsia ==
                                                                        'Muda' &&
                                                                    ketMasaKerja ==
                                                                        'Senior') {
                                                                  status =
                                                                      'ditunda';
                                                                } else if (ketUsia ==
                                                                        'Parubaya' &&
                                                                    ketMasaKerja ==
                                                                        'Junior') {
                                                                  status =
                                                                      'ditunda';
                                                                } else if (ketUsia ==
                                                                        'Parubaya' &&
                                                                    ketMasaKerja ==
                                                                        'Senior') {
                                                                  status =
                                                                      'mendapatkan pinjaman';
                                                                } else if (ketUsia ==
                                                                        'Tua' &&
                                                                    ketMasaKerja ==
                                                                        'Junior') {
                                                                  status =
                                                                      'ditunda';
                                                                } else {
                                                                  status =
                                                                      'mendapatkan pinjaman';
                                                                }

                                                                String
                                                                    keteranganStatus =
                                                                    '''Karena umur karyawan tersebut ${usiaController.text} tahun termasuk kategori $ketUsia, serta lama kerja karyawan tersebut ${masaKerjaController.text} tahun termasuk kategori $ketMasaKerja, maka status pinjaman karyawan tersebut adalah $status.
                                                                ''';

                                                                return Text(
                                                                    keteranganStatus);
                                                              }),
                                                            ],
                                                          );
                                                        }),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context),
                                                            child: Text('Kembali'
                                                                .toUpperCase()))
                                                      ],
                                                    );
                                                  });
                                            }
                                          },
                                          child: Text(
                                            'Cek Fuzzy'.toUpperCase(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          )),
                                      SizedBox(height: 8),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(child: _GrafikUsia(inputDomain: inputDomain)),
                    SizedBox(height: 8),
                    Expanded(child: _GrafikMasaKerja(inputDomain: inputDomain)),
                  ],
                )),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

class _GrafikMasaKerja extends StatelessWidget {
  const _GrafikMasaKerja({
    Key? key,
    required this.inputDomain,
  }) : super(key: key);

  final Map<String, String> inputDomain;

  @override
  Widget build(BuildContext context) {
    final max = double.parse(inputDomain['maxSenior']!) +
        double.parse(inputDomain['minJunior']!);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32),
          child: Text(
            'Grafik Masa Kerja',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: LineChart(
            LineChartData(
                minX: 0,
                maxX: max,
                minY: 0,
                maxY: 1.2,
                titlesData: FlTitlesData(
                  bottomTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 22,
                    margin: 10,
                    getTitles: (value) {
                      if (value ==
                          double.parse(inputDomain['minSenior']!) +
                              double.parse(inputDomain['maxJunior']!)) {
                        return '∞';
                      } else if (value % 5 == 0) {
                        return value.round().toString();
                      }

                      return '';
                    },
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    colors: [Colors.cyan],
                    belowBarData: BarAreaData(
                        show: true, colors: [Colors.cyan.withOpacity(0.15)]),
                    spots: [
                      FlSpot(0, 1),
                      FlSpot(double.parse(inputDomain['minJunior']!), 1),
                      FlSpot(double.parse(inputDomain['maxJunior']!), 0),
                    ],
                  ),
                  LineChartBarData(
                    colors: [Colors.purple],
                    belowBarData: BarAreaData(
                        show: true, colors: [Colors.purple.withOpacity(0.15)]),
                    spots: [
                      FlSpot(double.parse(inputDomain['minSenior']!), 0),
                      FlSpot(double.parse(inputDomain['maxSenior']!), 1),
                      FlSpot(max, 1),
                    ],
                  ),
                ]),
            swapAnimationDuration: Duration(milliseconds: 150), // Optional
            swapAnimationCurve: Curves.linear, // Optional
          ),
        ),
      ],
    );
  }
}

class _GrafikUsia extends StatelessWidget {
  const _GrafikUsia({
    Key? key,
    required this.inputDomain,
  }) : super(key: key);

  final Map<String, String> inputDomain;

  @override
  Widget build(BuildContext context) {
    final max = double.parse(inputDomain['maxTua']!) +
        double.parse(inputDomain['minMuda']!);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32),
          child: Text(
            'Grafik Fuzzy Usia',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: LineChart(
            LineChartData(
                minX: 0,
                maxX: max,
                minY: 0,
                maxY: 1.2,
                titlesData: FlTitlesData(
                  bottomTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 22,
                    margin: 10,
                    getTitles: (value) {
                      if (value == max) {
                        return '∞';
                      } else if (value % 5 == 0) {
                        return value.round().toString();
                      }

                      return '';
                    },
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    colors: [Colors.green],
                    belowBarData: BarAreaData(
                        show: true, colors: [Colors.green.withOpacity(0.15)]),
                    spots: [
                      FlSpot(0, 1),
                      FlSpot(double.parse(inputDomain['minMuda']!), 1),
                      FlSpot(double.parse(inputDomain['maxMuda']!), 0),
                    ],
                  ),
                  LineChartBarData(
                    colors: [Colors.amber],
                    belowBarData: BarAreaData(
                        show: true, colors: [Colors.amber.withOpacity(0.15)]),
                    spots: [
                      FlSpot(double.parse(inputDomain['minParubaya']!), 0),
                      FlSpot(
                          (double.parse(inputDomain['minParubaya']!) +
                                  double.parse(inputDomain['maxParubaya']!)) /
                              2,
                          1),
                      FlSpot(double.parse(inputDomain['maxParubaya']!), 0),
                    ],
                  ),
                  LineChartBarData(
                    colors: [Colors.red],
                    belowBarData: BarAreaData(
                        show: true, colors: [Colors.red.withOpacity(0.15)]),
                    spots: [
                      FlSpot(double.parse(inputDomain['minTua']!), 0),
                      FlSpot(double.parse(inputDomain['maxTua']!), 1),
                      FlSpot(max, 1),
                    ],
                  ),
                ]),
            swapAnimationDuration: Duration(milliseconds: 150), // Optional
            swapAnimationCurve: Curves.linear, // Optional
          ),
        ),
      ],
    );
  }
}
