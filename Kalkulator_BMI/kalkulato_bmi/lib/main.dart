import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BmiCalculatorScreen(),
    );
  }
}

class BmiCalculatorScreen extends StatefulWidget {
  @override
  _BmiCalculatorScreenState createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String selectedGender = "";

  void calculateBMI() {
    String height = heightController.text;
    String weight = weightController.text;

    if (height.isEmpty || weight.isEmpty || selectedGender.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Input Tidak Lengkap"),
            content: Text("Mohon isi semua data."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      double heightValue = double.tryParse(height) ?? 0.0;
      double weightValue = double.tryParse(weight) ?? 0.0;

      double bmi = weightValue / ((heightValue / 100) * (heightValue / 100));
      String category;

      if (bmi < 18.5) {
        category = "Underweight";
      } else if (bmi >= 18.5 && bmi < 24.9) {
        category = "Normal weight";
      } else if (bmi >= 25 && bmi < 29.9) {
        category = "Overweight";
      } else {
        category = "Obese";
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BmiResultScreen(
            bmi: bmi,
            category: category,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalkulator BMI"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pilih Jenis Kelamin"),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      selectedGender = "Laki-laki";
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: selectedGender == "Laki-laki"
                        ? Colors.blue
                        : Colors.white,
                    foregroundColor: selectedGender == "Laki-laki"
                        ? Colors.white
                        : Colors.blue,
                    side: BorderSide(color: Colors.blue),
                  ),
                  child: Text("Laki-laki"),
                ),
                SizedBox(width: 16),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      selectedGender = "Perempuan";
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: selectedGender == "Perempuan"
                        ? Colors.pink
                        : Colors.white,
                    foregroundColor: selectedGender == "Perempuan"
                        ? Colors.white
                        : Colors.pink,
                    side: BorderSide(color: Colors.pink),
                  ),
                  child: Text("Perempuan"),
                ),
              ],
            ),
            SizedBox(height: 32),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Tinggi",
                suffixText: "cm",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Berat",
                suffixText: "kg",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: calculateBMI,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text("Hitung BMI"),
            ),
          ],
        ),
      ),
    );
  }
}

class BmiResultScreen extends StatelessWidget {
  final double bmi;
  final String category;

  BmiResultScreen({required this.bmi, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hasil BMI"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hasil BMI Anda",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                bmi.toStringAsFixed(1),
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                category,
                style: TextStyle(
                  fontSize: 24,
                  color: category == "Underweight"
                      ? Colors.orange
                      : category == "Normal weight"
                          ? Colors.green
                          : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Kembali"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
