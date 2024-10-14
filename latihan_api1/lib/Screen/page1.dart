import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<dynamic> grid = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: grid.length,
          itemBuilder: (context, index) {
            final user = grid[index];
            final name = user['first_name'] + " " + user['last_name'];
            final email = user['email'];
            final imageURL = user['avatar'];
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100), 
                    child: SizedBox(
                      height: 80, 
                      width: 80, 

                      child: Image.network(
                        imageURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Text(
                    email,
                    style: TextStyle(color: Colors.grey[600]),
                  ),

                ],
              ),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          griddata();
        },
        child: Icon(
          Icons.download,
          color: Colors.white,
        ),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }

  void griddata() async {
    const url = 'https://random-data-api.com/api/v2/users?size=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      grid = json;
    });
  }
}
