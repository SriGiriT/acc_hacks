// import 'dart:convert';
// import 'dart:math';

// import 'package:acc_hacks/components/constants.dart';
// import 'package:acc_hacks/screen/report_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class FormScreen extends StatefulWidget {
//   List<String> items;
//   FormScreen({required this.items});

//   @override
//   State<FormScreen> createState() => _FormScreenState();
// }

// class _FormScreenState extends State<FormScreen> {
//   List<int> selectedItems = List.filled(13, 0);

//   @override
//   Widget build(BuildContext context) {
//     return GridDisease(
//       items: widget.items,
//       selectedItems: selectedItems,
//       onItemSelected: (int index) {
//         setState(() {
//           selectedItems[index] = selectedItems[index] == 1 ? 0 : 1;
//         });
//       },
//     );
//   }
// }

// class GridDisease extends StatelessWidget {
//   final List<String> items;
//   final List<int> selectedItems;
//   final Function(int) onItemSelected;

//   GridDisease({
//     required this.items,
//     required this.selectedItems,
//     required this.onItemSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('Form')),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GridView.builder(
//               itemCount: items.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//               ),
//               itemBuilder: (BuildContext context, int index) {
//                 return GestureDetector(
//                   onTap: () {
//                     onItemSelected(index);
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Card(
//                       color: selectedItems[index] == 1
//                           ? Colors.green
//                           : Color.fromARGB(255, 44, 60, 106),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             items[index],
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: Color.fromARGB(255, 44, 60, 106)),
//               onPressed: () async {
//                 Map<String, int> map = {};
//                 String ans = "";
//                 ans += "{";
//                 int i = 0;
//                 for (i = 0; i < items.length; i++) {
//                   map.putIfAbsent(items[i], () => selectedItems[i]);
//                 }
//                 print(map);
//                 var dict = Map<String, int>.from(map);
//                 print(jsonEncode(map));
//                 var ran = new Random();
//                 int par = ran.nextInt(3);
//                 Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ReportScreen(parameter: par,),
//                 ),
//               );
//                 final response = await http.post(
//                     Uri.parse('http://0.0.0.0:8083/predict'),
//                     body: jsonEncode(map));
//                 print(await response.body);
//                 print(await response.statusCode);
//                 if (response.statusCode == 200) {
//                   print(response.body);
//                 } else {
//                   throw Exception("Failed to load post");
//                 }
//                 print(selectedItems);
//               },
//               child: Text('Submit'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:acc_hacks/components/constants.dart';
import 'package:acc_hacks/screen/disease_screen.dart';
import 'package:acc_hacks/screen/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
String dis = "";
class FormScreen extends StatefulWidget {
  List<String> items;
  String disease;
  FormScreen({required this.items, required this.disease});
  
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  Map<String, String> data = {};

  @override
  Widget build(BuildContext context) {
    dis = widget.disease;
    return GridDisease(
      items: widget.items,
      data: data,
      onDataChanged: (String key, String value) {
        setState(() {
          data[key] = value;
        });
      },
    );
  }
}

class GridDisease extends StatelessWidget {
  final List<String> items;
  final Map<String, String> data;
  final Function(String, String) onDataChanged;

  GridDisease({
    required this.items,
    required this.data,
    required this.onDataChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Form')),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Color.fromARGB(255, 44, 60, 106),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          items[index],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.white),
                                labelText: "Enter value",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                fillColor: Color.fromARGB(255, 44, 60, 106),
                                filled: true,
                              ),
                              onChanged: (value) {
                                onDataChanged(items[index], value);
                              },
                            )),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 44, 60, 106)),
              onPressed: () async {
                Map<String, dynamic> map = {};
                for (int i = 0; i < items.length; i++) {
                  map[items[i]] = data[i];
                }
                print(map);
                                var ran = new Random();
                int par = ran.nextInt(3);
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReportScreen(parameter: par, disease:dis ,),
                ),
              );
                var response = await http.post(
                    Uri.parse('http://0.0.0.0:8083/predict'),
                    body: jsonEncode(map));
                if (response.statusCode == 200) {
                  print(response.body);
                } else {
                  throw Exception("Failed to load post");
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
