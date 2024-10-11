import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz_app/components/option_comp.dart';
import 'package:http/http.dart' as http;

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List responsedata = [];
  int number = 0;
  Future? getsapi() async {
    final response =
        await http.get(Uri.parse("https://opentdb.com/api.php?amount=10"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)["results"];
      setState(() {
        responsedata = data;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    getsapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 421,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      height: 240,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Positioned(
                        bottom: 60,
                        left: 22,
                        child: Container(
                          height: 170,
                          width: 440,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 1),
                                    blurRadius: 5,
                                    spreadRadius: 3,
                                    color: Colors.blue),
                              ]),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Column(
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "05",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.green),
                                    ),
                                    Text("06",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.red)),
                                  ],
                                ),
                                const Center(
                                  child: Text("Question: 9/10",
                                      style: TextStyle(color: Colors.blue)),
                                ),
                                SizedBox(
                                    height: 25,
                                    child: Text(responsedata.isEmpty
                                        ? responsedata[number]["question"]
                                        : ''))
                              ],
                            ),
                          ),
                        )),
                    const Positioned(
                      bottom: 210,
                      left: 190,
                      child: CircleAvatar(
                          radius: 42,
                          backgroundColor: Colors.orange,
                          child: Text(
                            "!5",
                            style: TextStyle(fontSize: 16),
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Option(responsedata.isEmpty
                  ? responsedata[number]['correct_answer']
                  : ""),
              Option(responsedata.isEmpty
                  ? responsedata[number]['incorrect_answer'][0]
                  : ''),
              Option(responsedata.isEmpty
                  ? responsedata[number]['incorrect_answer'][1]
                  : ""),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text("Next",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void nextquestion() {}
