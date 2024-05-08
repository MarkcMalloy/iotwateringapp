import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iotwateringapp/Utils/colors.dart';
import 'package:iotwateringapp/services/api_service.dart';

class ConnectToDevicePage extends StatefulWidget {
  final Function(String) function;
  const ConnectToDevicePage({Key? key, required this.function}) : super(key: key);

  @override
  State<ConnectToDevicePage> createState() => _ConnectToDevicePageState();
}

class _ConnectToDevicePageState extends State<ConnectToDevicePage> {
  ApiService _apiService = ApiService();
  final TextEditingController _ipController = TextEditingController();

  bool _isConnectedToDevice = false;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  void dispose() {
    _ipController.dispose();
    super.dispose();
  }

  void _updateIPAddress() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter IP Address'),
          content: TextField(
            controller: _ipController,
            decoration: InputDecoration(hintText: "192.168.1.1"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                widget.function(_ipController.text);
                Navigator.of(context).pop();
                setState(() {}); // Refresh the UI with the new IP address
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> connectToDevice() async {
    _isLoading = true;
    int code = await _apiService.connectToArduino(_ipController.text);
    print("code: $code");
    if (code == 200) {
      setState(() {
        _isConnectedToDevice = true;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors.oliveDune,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Text(
                    "To connect to the Start Watering System",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Text(
                    "please type in its ip address",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  padding: EdgeInsets.all(4.0),
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20.0)),
                  width: MediaQuery.of(context).size.width - 150,
                  child: Center(
                    child: Text(
                      _ipController.text,
                      style: TextStyle(fontSize: 18),
                    ),
                  ), // Use the controller's text value
                ),
                const SizedBox(height: 32),
                InkWell(
                  onTap: _updateIPAddress, // Trigger the update function
                  child: Container(
                    width: 220,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: Text(
                        "Enter Ip Address",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 64),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 4),
                  child: Text(
                    "when you have finished typing the ip address, press connect",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 32),
                Center(
                  child: Container(
                    width: 140,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12.0)),
                    child: TextButton(
                      onPressed: () async {
                        // Possibly another action
                        await connectToDevice();
                      },
                      child: const Text(
                        "Connect",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
                top: MediaQuery.of(context).size.height / 2,
                right: MediaQuery.of(context).size.width / 2,
                child: Visibility(
                  visible: _isLoading,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  replacement: Container(),
                )),
          ],
        ));
  }

  Widget backButton() {
    return IconButton(
      icon: Icon(
        Icons.keyboard_return_outlined,
        size: 40,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
