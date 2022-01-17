import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Native Code',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int? _batteryLevel;

  Future<void> _getBatteryLevel() async {
    const platform = MethodChannel(
        'course.flutter.dev/battery'); //this is unique identifier for platfor course.flutter.dev/battery is just a unique url type string only
    try {
      final batteryLevel = await platform
          .invokeMethod('getBatteryLevel'); //sending massege to platform
      setState(() {
        _batteryLevel = batteryLevel;
      });
    } on PlatformException catch (error) {
      _batteryLevel = null;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Native Code'),
      ),
      body: Center(
        child: Text('Battery Level: $_batteryLevel'),
      ),
    );
  }
}
