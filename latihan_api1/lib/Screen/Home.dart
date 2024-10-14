import 'package:flutter/material.dart';
import 'package:latihan_api1/Screen/page1.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('helllo'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Page1();
              }));
            },
             child: Text('Page1'),
             ),
          ],
        ),
      ),
    );
  }
}