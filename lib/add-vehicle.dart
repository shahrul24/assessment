import 'package:assessment_project/repository.dart';
import 'package:flutter/material.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({Key? key}) : super(key: key);

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  Repository repository = Repository();

  final _reg_noController = TextEditingController();
  final _modelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => Navigator.of(context).popAndPushNamed('/home'),
          ),
        ],
        title: const Text('Add Vehicle'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _reg_noController,
              decoration: const InputDecoration(
                  hintText: 'Registration no', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _modelController,
              decoration: const InputDecoration(
                  hintText: 'Model', border: OutlineInputBorder()),
            ),
            ElevatedButton(
                onPressed: () async {
                  bool response = await repository.postData(
                      _reg_noController.text, _modelController.text);

                  if (response) {
                    Navigator.of(context).popAndPushNamed('/home');
                  } else {
                    Navigator.of(context).popAndPushNamed('/home');
                  }
                },
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}
