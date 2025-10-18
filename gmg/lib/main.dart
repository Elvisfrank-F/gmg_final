import 'package:flutter/material.dart';
import 'package:gmg/test_page.dart';
import 'dart:math';
import 'home_page.dart';
import 'settings_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora GMG",
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomePageMain(),
    );
  }
}

class HomePageMain extends StatefulWidget {
  const HomePageMain({super.key});

  @override
  State<HomePageMain> createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain> {
  //for controll the text field

  late TextEditingController _powerController;

  //variables to store the input value and the result
  double valor = 0, result = 0;

  //variable for controlling the home page and the settings page
  int _selectedIndex = 0;

  //variables for controlling teh Switches of power unit
  bool isKVA = true;
  bool isKW = false;
  bool isHP = false;

  //variables for controlling size of the widgets of settings page
  int containerHeight = 50;

  //variables for controlling the language of the app
  bool isEnglish = true;

  List<double> values = [];

  //adicionando o sharedprefernces idioma

  Future<void> _getInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isEnglish = prefs.getBool('isEnglish') ?? true;
    });
  }

  Future<void> _setInfo(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isEnglish', value);
    _getInfo();
  }

  //set e get do KVA

  Future<void> _setValues(bool isKVA, bool isKW, bool isHP) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isKVA', isKVA);
    await prefs.setBool('isKW', isKW);
    await prefs.setBool('isHP', isHP);

    _getValues();
  }

  //pegando os valores
  Future<void> _getValues() async {
    final prefs = await SharedPreferences.getInstance();
    isKVA = await prefs.getBool('isKVA') ?? true;
    isKW = await prefs.getBool('isKW') ?? false;
    isHP = await prefs.getBool('isHP') ?? false;
  }

  @override
  void initState() {
    super.initState();
    _getInfo();
    _getValues();
    _powerController = TextEditingController();
  }

  void setSettingsLanguage(bool value) {
    setState(() {
      isEnglish = value;
      _setInfo(isEnglish);
    });
  }

  void setSettingsLanguagePT(bool value) {
    setState(() {
      isEnglish = !value;
      _setInfo(isEnglish);
    });
  }

  void setSettingsPowerKVA(bool value) {
    setState(() {
      isKVA = value;
      isKW = false;
      isHP = false;
      _setValues(isKVA, isKW, isHP);
      values.clear();
    });
  }

  void setSettingsPowerKW(bool value) {
    setState(() {
      isKVA = false;
      isKW = value;
      isHP = false;
      _setValues(isKVA, isKW, isHP);
      values.clear();
    });
  }

  void setSettingsPowerHP(bool value) {
    setState(() {
      isKVA = false;
      isKW = false;
      isHP = value;
      _setValues(isKVA, isKW, isHP);
      values.clear();
    });
  }

  void _calcularCorrent() {
    setState(() {
      values.clear();
      try {
        if (isKVA) {
          valor = double.parse(_powerController.text);
          result = (valor * 1000) / (380 * sqrt(3));
          result = double.parse(result.toStringAsFixed(2));
          values.add(result);
          result = double.parse(
            ((valor * 1000) / (220 * sqrt(3))).toStringAsFixed(2),
          );
          values.add(result);
          result = double.parse(((valor * 1000) / (220)).toStringAsFixed(2));
          values.add(result);
        } else if (isKW) {
          valor = double.parse(_powerController.text);
          result = (valor * 1000) / (0.8 * 380 * sqrt(3));
          result = double.parse(result.toStringAsFixed(2));
          values.add(result);
          result = double.parse(
            ((valor * 1000) / (0.8 * 220 * sqrt(3))).toStringAsFixed(2),
          );
          values.add(result);
          result = double.parse(
            ((valor * 1000) / (0.8 * 220)).toStringAsFixed(2),
          );
          values.add(result);
        } else if (isHP) {
          valor = double.parse(_powerController.text);
          result = (valor * 746) / (0.8 * 380 * sqrt(3));
          result = double.parse(result.toStringAsFixed(2));
          values.add(result);
          result = double.parse(
            ((valor * 746) / (220 * 0.8 * sqrt(3))).toStringAsFixed(2),
          );
          values.add(result);
          result = double.parse(
            ((valor * 746) / (220 * 0.8)).toStringAsFixed(2),
          );
          values.add(result);
        } else {
          result = 0;
        }
      } catch (e) {
        valor = 0;
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      HomePage.home(
        isEnglish,
        _powerController,
        result,
        _calcularCorrent,
        isKVA,
        isKW,
        isHP,
        values,
      ),

      Settings.settings(
        isEnglish,
        isKVA,
        isKW,
        isHP,
        containerHeight,
        setSettingsLanguage,
        setSettingsLanguagePT,
        setSettingsPowerKVA,
        setSettingsPowerKW,
        setSettingsPowerHP,
      ),
    ];

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          body: constraints.maxWidth > 500
              ? Row(
                  children: [
                    Expanded(flex: 5, child: _pages[0]),
                    VerticalDivider(width: 10),
                    Expanded(flex: 2, child: _pages[1]),
                  ],
                )
              : _pages[_selectedIndex],

          bottomNavigationBar: constraints.maxWidth < 500
              ? BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  onTap: _onItemTapped,
                )
              : null,
        );
      },
    );
  }
}
