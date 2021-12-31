import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputDomain extends StatefulWidget {
  final Map<String, String>? inputDomain;
  const InputDomain({Key? key, this.inputDomain}) : super(key: key);

  @override
  _InputDomainState createState() => _InputDomainState();
}

class _InputDomainState extends State<InputDomain> {
  // Umur
  final minMudaController = TextEditingController(text: '25');
  final maxMudaController = TextEditingController(text: '45');
  final minParubayaController = TextEditingController(text: '35');
  final maxParubayaController = TextEditingController(text: '55');
  final minTuaController = TextEditingController(text: '45');
  final maxTuaController = TextEditingController(text: '65');

  // Masa Kerja
  final minJuniorController = TextEditingController(text: '5');
  final maxJuniorController = TextEditingController(text: '15');
  final minSeniorController = TextEditingController(text: '10');
  final maxSeniorController = TextEditingController(text: '20');

  void resetDomain() {
    minMudaController.text = '25';
    maxMudaController.text = '45';

    minParubayaController.text = '35';
    maxParubayaController.text = '55';

    minTuaController.text = '45';
    maxTuaController.text = '65';

    minJuniorController.text = '5';
    maxJuniorController.text = '15';

    minSeniorController.text = '10';
    maxSeniorController.text = '20';
  }

  @override
  void initState() {
    super.initState();

    // Check if inputDomain != null
    if (widget.inputDomain != null) {
      minMudaController.text = widget.inputDomain!['minMuda']!;
      maxMudaController.text = widget.inputDomain!['maxMuda']!;
      minParubayaController.text = widget.inputDomain!['minParubaya']!;
      maxParubayaController.text = widget.inputDomain!['maxParubaya']!;
      minTuaController.text = widget.inputDomain!['minTua']!;
      maxTuaController.text = widget.inputDomain!['maxTua']!;
      minJuniorController.text = widget.inputDomain!['minJunior']!;
      maxJuniorController.text = widget.inputDomain!['maxJunior']!;
      minSeniorController.text = widget.inputDomain!['minSenior']!;
      maxSeniorController.text = widget.inputDomain!['maxSenior']!;
    }

    maxJuniorController.addListener(() {
      setState(() {
        final maxJunior = int.parse(maxJuniorController.text) - 5;
        if (maxJunior <= 0) {
          minSeniorController.text = '0';
        } else {
          minSeniorController.text = maxJunior.toString();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, {
          'minMuda': minMudaController.text,
          'maxMuda': maxMudaController.text,
          'minParubaya': minParubayaController.text,
          'maxParubaya': maxParubayaController.text,
          'minTua': minTuaController.text,
          'maxTua': maxTuaController.text,
          'minJunior': minJuniorController.text,
          'maxJunior': maxJuniorController.text,
          'minSenior': minSeniorController.text,
          'maxSenior': maxSeniorController.text,
        });
        return Future(() => false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Setting Domain'),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: resetDomain,
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              Text('Usia', style: Theme.of(context).textTheme.headline6),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Text('Muda'), flex: 1),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: minMudaController,
                      decoration: InputDecoration(
                        labelText: 'min',
                      ),
                      enabled: true,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TextField(
                      enabled: true,
                      controller: maxMudaController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(labelText: 'max'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Text('Parubaya'), flex: 1),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: minParubayaController,
                      enabled: true,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(labelText: 'min'),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TextField(
                      controller: maxParubayaController,
                      enabled: true,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(labelText: 'max'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Text('Tua'), flex: 1),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: minTuaController,
                      enabled: true,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(labelText: 'min'),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TextField(
                      controller: maxTuaController,
                      enabled: true,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(labelText: 'max'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text('Masa Kerja', style: Theme.of(context).textTheme.headline6),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Text('Junior'), flex: 1),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: minJuniorController,
                      enabled: true,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(labelText: 'min'),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TextField(
                      controller: maxJuniorController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(labelText: 'max'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Text('Senior'), flex: 1),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: minSeniorController,
                      enabled: true,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(labelText: 'min'),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TextField(
                      controller: maxSeniorController,
                      enabled: true,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(labelText: 'max'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
