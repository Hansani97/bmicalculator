import 'package:bmicalculator/Const.dart';
import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  int weight = 50;
  int height = 150;

  late double bmi;
  late String bmiDisplay;
  String gender = '';

  @override
  void initState() {
    super.initState();
    bmi = CalculatedBMI(weight, height);
    bmiDisplay = GetResult(bmi);
  }

  void updateBMI() {
    setState(() {
      bmi = CalculatedBMI(weight, height);
      bmiDisplay = GetResult(bmi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  color: kSecondColor,
                  height: 80,
                  width: double.infinity,
                  child: const Text(
                    "BMI CALCULATOR",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = 'M';
                        });
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: gender == 'M' ? kThirdColor : kSecondColor,
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 60,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "MALE",
                              style: kboxStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = 'F';
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: gender == 'F' ? kThirdColor : kSecondColor,
                        ),
                        width: 150,
                        height: 150,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 60,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text("FEMALE", style: kboxStyle),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kSecondColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("WEIGHT", style: kboxStyle),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("$weight", style: kboxStyle),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              FloatingActionButton.small(
                                onPressed: () {
                                  setState(() {
                                    if (weight > 25) weight--;
                                    updateBMI();
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 40,
                                ),
                              ),
                              const Spacer(),
                              FloatingActionButton.small(
                                onPressed: () {
                                  setState(() {
                                    if (weight < 300) weight++;
                                    updateBMI();
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                  size: 40,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kSecondColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("HEIGHT", style: kboxStyle),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("$height", style: kboxStyle),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              FloatingActionButton.small(
                                onPressed: () {
                                  setState(() {
                                    if (height > 60) height--;
                                    updateBMI();
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 40,
                                ),
                              ),
                              const Spacer(),
                              FloatingActionButton.small(
                                onPressed: () {
                                  setState(() {
                                    if (height < 210) height++;
                                    updateBMI();
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                  size: 40,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  color: bmiDisplay == "Over Weight"
                      ? const Color(0xFFFfab1a0)
                      : bmiDisplay == "Normal"
                          ? Color(0xFF8BECB0)
                          : Color(0xFFFffeaa7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Calculated BMI Value",
                        style: TextStyle(
                          fontSize: 25,
                          color: kMainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        bmi.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 35,
                          color: kMainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        bmiDisplay,
                        style: const TextStyle(
                            fontSize: 25,
                            color: kMainColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  double CalculatedBMI(int weight, int height) {
    return (weight / ((height * height) / 10000));
  }

  String GetResult(bmiValue) {
    if (bmiValue >= 25) {
      return 'Over Weight';
    } else if (bmiValue > 18.5) {
      return "Normal";
    } else {
      return "Under Weight";
    }
  }
}
