import 'package:flutter/material.dart';

class HomePage {
  static String powerSelected(
    bool isKVA,
    bool isKW,
    bool isHP,
    bool isEnglish,
    bool cond,
  ) {
    if (!cond) {
      if (isKVA) {
        return isEnglish ? "POWER (KVA)" : "POTÊNCIA (KVA)";
      } else if (isKW) {
        return isEnglish ? "POWER (KW)" : "POTÊNCIA (KW)";
      } else if (isHP) {
        return isEnglish ? "POWER (HP)" : "POTÊNCIA (CV)";
      } else {
        return isEnglish
            ? 'Stop being "baitola" and put a power there, "viadin"'
            : "Deixa de viadagem e coloca uma potencia ai viadokkkk";
      }
    } else {
      if (isKVA) {
        return isEnglish ? "KVA" : "kVA";
      } else if (isKW) {
        return isEnglish ? "KW" : "kW";
      } else if (isHP) {
        return isEnglish ? "HP" : "CV";
      } else {
        return "null";
      }
    }
  }

  static Widget home(
    bool isEnglish,
    TextEditingController _powerController,
    double result,
    VoidCallback calcularCorrent,
    bool isKVA,
    bool isKW,
    bool isHP,
    List<double> values,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/back.png'),
              fit: BoxFit.cover,
            ),
          ),

          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 80),
                  Text(
                    isEnglish
                        ? "Max Current calculator"
                        : "Calculadora Corrente Máxima",
                    style: TextStyle(
                      fontSize: constraints.maxWidth * 0.07,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  Card(
                    color: Colors.black.withOpacity(0.6),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          Text(
                            HomePage.powerSelected(
                              isKVA,
                              isKW,
                              isHP,
                              isEnglish,
                              false,
                            ),
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: 250,
                            height: 60,
                            child: TextField(
                              controller: _powerController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),

                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: !isEnglish
                                    ? 'Digite a potência em ' +
                                          HomePage.powerSelected(
                                            isKVA,
                                            isKW,
                                            isHP,
                                            isEnglish,
                                            false,
                                          )
                                    : 'Enter the power in ' +
                                          HomePage.powerSelected(
                                            isKVA,
                                            isKW,
                                            isHP,
                                            isEnglish,
                                            false,
                                          ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          SizedBox(
                            width: 250,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: calcularCorrent,
                              child: Text(
                                isEnglish ? "Calculate" : "calcular",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                          ),

                          SizedBox(height: 50),

                          Card(
                            elevation: 10,

                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: constraints.maxHeight / 10,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    isEnglish
                                        ? "Max Current"
                                        : "Corrente Máxima",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "F",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "-",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "F ",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      Text(
                                        " 380V: ",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                            255,
                                            71,
                                            24,
                                            201,
                                          ),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      Text(
                                        (values.isEmpty
                                                ? "0"
                                                : values[0].toString()) +
                                            " A",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "F",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "-",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "F ",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      Text(
                                        " 220V: ",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                            255,
                                            71,
                                            24,
                                            201,
                                          ),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      Text(
                                        (values.isEmpty
                                                ? "0"
                                                : values[1].toString()) +
                                            " A",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "F",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "-",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "N ",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "220V: ",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                            255,
                                            71,
                                            24,
                                            201,
                                          ),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        (values.isEmpty
                                                ? "0"
                                                : values[2].toString()) +
                                            " A",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight / 15),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
