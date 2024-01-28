import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI CALCULATOR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();

  var result = "";

  var bgColor = Color.fromARGB(255, 224, 216, 216);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your BMI Calculator', style:TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        centerTitle: true,
        
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: wtcontroller,
                  decoration: InputDecoration(
                      labelText: 'Enter your weight in kgs',
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11),
                TextField(
                  controller: ftcontroller,
                  decoration: InputDecoration(
                      labelText: 'Enter your height in fts',
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtcontroller.text.toString();
                    var ft = ftcontroller.text.toString();

                    if (wt != "" && ft != "") {
                      var iwt = double.parse(wt);
                      var ift = double.parse(ft);

                      var tInch = ift * 12;
                      var tcm = tInch * 2.54;
                      var tM = tcm / 100;

                      var bmi = iwt / (tM * tM);

                      var msg = "";

                      if (bmi > 25) {
                        msg = "You are overweight";
                        bgColor = Colors.orange.shade200;
                      } else if (bmi < 18) {
                        msg = "You are underweight";
                        bgColor = Colors.red.shade200;
                      } else {
                        msg = "You are healthy";
                        bgColor = Colors.green.shade200;
                      }

                      setState(() {
                        result = "$msg \n Your bmi is : ${bmi.toStringAsFixed(4)}";
                      });
                    } else {
                      setState(() {
                        result = "Please fill all the blanks!";
                      });
                    }
                  },
                  child: Text('Calculate'),
                ),
                Text(
                  result,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
