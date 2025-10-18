import 'package:flutter/material.dart';
import 'forms_class.dart';

class Settings {
  static final double tamX = 400, tamY = 220;

  static Widget settings(
    bool isEnglish,
    bool isKVA,
    bool isKW,
    bool isHP,
    int containerHeight,
    ValueChanged<bool> setSettingsLanguage,
    ValueChanged<bool> setSettingsLanguagePT,
    ValueChanged<bool> setSettingsPowerKVA,
    ValueChanged<bool> setSettingsPowerKW,
    ValueChanged<bool> setSettingsPowerHP,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double tamanho = constraints.maxWidth / 12;
        return Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  isEnglish
                      ? "Power unit selected"
                      : "Unidade de potência selecionada",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  height: containerHeight.toDouble(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(isEnglish ? "POWER IN KVA" : "POTÊNCIA EM KVA"),
                      SizedBox(width: tamanho),
                      Switch(value: isKVA, onChanged: setSettingsPowerKVA),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  height: containerHeight.toDouble(),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(isEnglish ? "POWER IN KW" : "POTÊNCIA EM KW"),
                      SizedBox(width: tamanho),
                      Switch(value: isKW, onChanged: setSettingsPowerKW),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  height: containerHeight.toDouble(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(isEnglish ? "POWER IN HP" : "POTÊNCIA EM CV"),
                      SizedBox(width: tamanho),
                      Switch(value: isHP, onChanged: setSettingsPowerHP),
                    ],
                  ),
                ),
                SizedBox(height: 30),

                Text(
                  isEnglish ? "Language selected" : "Idioma selecionado",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  height: containerHeight.toDouble(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(isEnglish ? "English" : "inglês"),
                      SizedBox(width: tamanho),
                      Switch(value: isEnglish, onChanged: setSettingsLanguage),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  height: containerHeight.toDouble(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(isEnglish ? "Portuguese" : "Português"),
                      SizedBox(width: tamanho),
                      Switch(
                        value: !isEnglish,
                        onChanged: setSettingsLanguagePT,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                Text(
                  isEnglish ? "Formula" : "Fórmula",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: tamX,
                  height: tamY,
                  child: LayoutBuilder(
                    builder: (context, contrains) {
                      return ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Forms(
                            height: tamY - 70,
                            width: tamX,
                            image: AssetImage("assets/images/formulaKVA.jpg"),
                            text: isEnglish ? "Formula KVA" : "Fórmula KVA",
                          ),
                          Forms(
                            height: tamY - 70,
                            width: tamX,
                            image: AssetImage("assets/images/formulaKW.jpg"),
                            text: isEnglish ? "Formula KW" : "Fórmula KW",
                          ),
                          Forms(
                            height: tamY - 70,
                            width: tamX,
                            image: AssetImage("assets/images/formulaHP.jpg"),
                            text: isEnglish ? "Formula HP" : "Fórmula CV",
                          ),
                          Forms(
                            height: tamY - 70,
                            width: tamX,
                            image: AssetImage("assets/images/GeradorAnim.gif"),
                            text: isEnglish
                                ? "AC current creation"
                                : "Criação de corrente CA",
                          ),
                          Forms(
                            height: tamY - 70,
                            width: tamX,
                            image: AssetImage("assets/images/Fechamento1.gif"),
                            text: isEnglish ? "STAR" : "ESTRELA",
                          ),
                          Forms(
                            height: tamY - 70,
                            width: tamX,
                            image: AssetImage("assets/images/Fechamento2.gif"),
                            text: isEnglish ? "DELTA" : "TRIANGULO",
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
