import 'package:acc_hacks/screen/form_screen.dart';
import 'package:flutter/material.dart';

List<String> diseases = [
  "HEART ATTACK",
  "COVID-19",
  "DENGUE",
  "BMI",
  "BODY FAT",
  "FEVER",
  "MATERNITTY",
  "BREST CANCER"
];
Map<String, List> map = {
  "HEART ATTACK": [
    "age",
    "sex",
    "cp",
    "trtbps",
    "chol",
    "bfs",
    "restcg",
    "thalachh",
    "exng",
    "oldpeak",
    "slp",
    "caa",
    "thall",
  ],
  "COVID-19": [
    "age",
    "sex",
    "cp",
    "trtbps",
    "chol",
    "bfs",
    "restcg",
    "thalachh",
    "exng",
    "oldpeak",
    "slp",
    "caa",
    "thall",
  ],
  "DENGUE": [
    "age",
    "sex",
    "cp",
    "trtbps",
    "chol",
    "bfs",
    "restcg",
    "thalachh",
    "exng",
    "oldpeak",
    "slp",
    "caa",
    "thall",
  ],
  "BMI": [
    "age",
    "sex",
    "cp",
    "trtbps",
    "chol",
    "bfs",
    "restcg",
    "thalachh",
    "exng",
    "oldpeak",
    "slp",
    "caa",
    "thall",
  ],
  "MATERNITTY": [
    "age",
    "sex",
    "cp",
    "trtbps",
    "chol",
    "bfs",
    "restcg",
    "thalachh",
    "exng",
    "oldpeak",
    "slp",
    "caa",
    "thall",
  ],
  "BREST CANCER": [
    "age",
    "sex",
    "cp",
    "trtbps",
    "chol",
    "bfs",
    "restcg",
    "thalachh",
    "exng",
    "oldpeak",
    "slp",
    "caa",
    "thall",
  ],
  "BODY FAT": [
    "age",
    "sex",
    "cp",
    "trtbps",
    "chol",
    "bfs",
    "restcg",
    "thalachh",
    "exng",
    "oldpeak",
    "slp",
    "caa",
    "thall",
  ],
  "FEVER": [
    "age",
    "sex",
    "cp",
    "trtbps",
    "chol",
    "bfs",
    "restcg",
    "thalachh",
    "exng",
    "oldpeak",
    "slp",
    "caa",
    "thall",
  ]
};

class DiseaseScreen extends StatefulWidget {
  const DiseaseScreen({super.key});

  @override
  State<DiseaseScreen> createState() => _DiseaseScreenState();
}

class _DiseaseScreenState extends State<DiseaseScreen> {
  @override
  Widget build(BuildContext context) {
    return GridDisease(
      items: const [
        "HEART ATTACK",
        "COVID-19",
        "DENGUE",
        "BMI",
        "BODY FAT",
        "FEVER",
        "MATERNITTY",
        "BREST CANCER"
      ],
    );
  }
}

class GridDisease extends StatelessWidget {
  final List<String> items;

  GridDisease({required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Diseases'),
        ),
      ),
      body: GridView.builder(
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormScreen(
                    items: map[items[index]]!.cast<String>(),
                    disease: diseases[index],
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Color.fromARGB(255, 44, 60, 106),
                child: Center(
                  child: Text(
                    items[index],
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
