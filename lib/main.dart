import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  bool selected = true;
  int weight = 10;
  int height = 0;
  String bmi = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
          backgroundColor: Colors.black87,
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = true;
                        });
                      },
                      child: Gender(
                        gender: "Male",
                        icon: Icon(Icons.male),
                        selected: this.selected,
                        margin: EdgeInsets.fromLTRB(10, 10, 5, 10),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = false;
                        });
                      },
                      child: Gender(
                        gender: "Female",
                        icon: Icon(Icons.female),
                        selected: !this.selected,
                        margin: EdgeInsets.fromLTRB(5, 10, 10, 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MeasureCard(
                      title: "Weight",
                      measurement: weight.toString() + "kg",
                      increment: () {
                        setState(() {
                          weight++;
                        });
                      },
                      decrement: () {
                        setState(() {
                          weight--;
                        });
                      },
                      margin: EdgeInsets.fromLTRB(10, 20, 5, 50),
                    ),
                  ),
                  Expanded(
                    child: MeasureCard(
                      title: "Height",
                      measurement: height.toString() + "ft",
                      increment: () {
                        setState(() {
                          height++;
                        });
                      },
                      decrement: () {
                        setState(() {
                          height--;
                        });
                      },
                      margin: EdgeInsets.fromLTRB(5, 20, 10, 50),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: Center(
                child: Text(
                  bmi,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black87),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        bmi = "BMI is " +
                            (weight / (height * 0.3048 * height * 0.3048))
                                .toStringAsFixed(2);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: const Center(
                        child: Text(
                          "Calculate",
                          style: TextStyle(
                            color: (Colors.white),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black87),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.tealAccent[100]);
  }
}

class Gender extends StatelessWidget {
  const Gender(
      {Key? key,
      required this.icon,
      required this.gender,
      required this.selected,
      required this.margin})
      : super(key: key);

  final Icon icon;
  final String gender;
  final bool selected;
  final EdgeInsets margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      margin: this.margin,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            gender == "Male" ? Icons.male : Icons.female,
            size: 40,
            color: selected ? Colors.teal[100] : Colors.teal[900],
          ),
          Text(
            gender,
            style: TextStyle(
                color: selected ? Colors.teal[100] : Colors.teal[900]),
          ),
        ],
      ),
    );
  }
}

// RoundButton(
//   child: Icon(Icons.plus_one, color: Colors.black87),
//   backgroundColor: Colors.teal.shade100,
// ),
// RoundButton(
//   child: Icon(Icons.exposure_minus_1, color: Colors.black87),
//   backgroundColor: Colors.teal.shade100,
// ),
class RoundButton extends StatelessWidget {
  const RoundButton(
      {Key? key,
      required this.child,
      required this.backgroundColor,
      required this.func})
      : super(key: key);
  final Widget child;
  final Color backgroundColor;
  final void Function() func;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: backgroundColor),
        child: this.child,
      ),
      onTap: func,
    );
  }
}

class MeasureCard extends StatelessWidget {
  const MeasureCard(
      {Key? key,
      required this.title,
      required this.measurement,
      required this.increment,
      required this.decrement,
      required this.margin})
      : super(key: key);
  final String title;
  final String measurement;
  final void Function() increment;
  final void Function() decrement;
  final EdgeInsets margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(50),
      margin: this.margin,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.teal[100],
            ),
          ),
          Text(
            measurement.toString(),
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.teal[100],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundButton(
                child: Icon(Icons.exposure_minus_1, color: Colors.black87),
                backgroundColor: Colors.teal.shade100,
                func: decrement,
              ),
              RoundButton(
                child: Icon(Icons.plus_one, color: Colors.black87),
                backgroundColor: Colors.teal.shade100,
                func: increment,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
