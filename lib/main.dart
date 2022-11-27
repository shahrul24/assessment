import 'dart:io';

import 'package:assessment_project/add-vehicle.dart';
import 'package:assessment_project/model.dart';
import 'package:assessment_project/repository.dart';
import 'package:flutter/material.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/home': (context) => const MyHomePage(title: 'Assessment'),
        '/add-vehicle': (context) => const AddVehicle(),
        // '/new-vehicle': (context) => const NewVehicle(),
      },
      home: const MyHomePage(title: 'Assessment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Vehicle> listVehicle = [];
  Repository repository = Repository();

  getData() async {
    listVehicle = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
                margin: const EdgeInsets.all(5),
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    color: Colors.lightBlue,
                    elevation: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(listVehicle[index].id.toString()),
                        Text(listVehicle[index].reg_no.toString()),
                        Text(listVehicle[index].model.toString()),
                        Text(listVehicle[index].created_at.toString()),
                        Text(listVehicle[index].updated_at.toString()),
                      ],
                    )));
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: listVehicle.length),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).popAndPushNamed('/add-vehicle'),
        backgroundColor: const Color.fromARGB(255, 0, 71, 129),
        child: const Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
