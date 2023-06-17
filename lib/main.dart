import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgcolor = Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style: (TextStyle(fontSize: 34, fontWeight: FontWeight.w800)
                ),
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,

                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your height(in feet)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,

                ),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter your height(in inches)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,

                ),
                SizedBox(height: 16,),

                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt!="" && ft!= "" && inch!= ""){
                    var iwt = int.parse(wt);
                    var ift = int.parse(ft);
                    var iinch = int.parse(inch);

                    var tinch = (ift*12) + iinch;
                    var tcm = tinch*2.54;
                    var tm = tcm/100;
                    var bmi = iwt/(tm*tm);
                    var msg = "";
                    if(bmi>25){
                      msg = "You are Overweight";
                      bgcolor = Colors.orange.shade200;
                    }
                    else if(bmi<18){
                      msg = "You are underweight";
                      bgcolor = Colors.red.shade200;
                    }
                    else{
                      msg = "You are healthy";
                      bgcolor = Colors.green.shade200;
                    }
                    setState(() {
                      result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                    });
                  }
                  else{
                    setState(() {
                      result = "Please fill all the required blanks!!";
                    });

                  }
                }, child: Text('Calculate')),
                Text(result, style: TextStyle(fontSize: 20),)

              ],


            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
