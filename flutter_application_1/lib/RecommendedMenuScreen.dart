import 'dart:math';
import 'package:flutter/material.dart';
import 'KhaoSoiScreen.dart';
import 'NamNgiawScreen.dart';
import 'HangLayScreen.dart'; 
import 'NamPrikNoomScreen.dart'; 
import 'KaiPamScreen.dart'; 
import 'OngPooNaScreen.dart';
import 'NamPrikKhaHedThobScreen.dart';
import 'KaengHedPhorScreen.dart';
import 'FriedPorkNeckScreen.dart';
import 'StuffedBellPeppersScreen.dart';
import 'EggSteamedNhamScreen.dart';
import 'NamPrikOngScreen.dart';
import 'SaiAuaOkGaiScreen.dart';
import 'NamPrikTaDaengScreen.dart';
import 'YumGaiScreen.dart';
import 'LabMooKuaScreen.dart';
import 'KhaoKanJinScreen .dart';
import 'NamPrikNamPooScreen .dart';
import 'KaengKaeKaiScreen.dart';
import 'SaJinScreen.dart';

class RecommendedMenuScreen extends StatefulWidget {
  RecommendedMenuScreen({Key? key}) : super(key: key); 

  @override
  _RecommendedMenuScreenState createState() => _RecommendedMenuScreenState();
}

class _RecommendedMenuScreenState extends State<RecommendedMenuScreen> {
  final Map<String, String> difficultyLevels = {
    'ข้าวซอย': 'ยาก',
    'น้ำเงี้ยว': 'ยาก',
    'แกงฮังเล': 'ยาก',
    'น้ำพริกหนุ่ม': 'ง่าย',
    'ไข่ป่าม': 'ง่าย',
    'อ่องปูนา': 'ปานกลาง',
    'น้ำพริกข่าเห็ดถอบ': 'ปานกลาง',
    'แกงเห็ดเผาะ': 'ยาก',
    'คอหมูทอดน้ำปลา': 'ง่าย',
    'พริกหยวกยัดไส้': 'ง่าย',
    'แหนมหมกไข่': 'ปานกลาง',
    'น้ำพริกอ่อง': 'ง่าย',
    'ไส้อั่วอกไก่': 'ปานกลาง',
    'น้ำพริกตาแดง': 'ง่าย',
    'ยำไก่': 'ปานกลาง',
    'ลาบหมูคั่ว': 'ปานกลาง',
    'ข้าวกั้นจิ้น': 'ปานกลาง',
    'น้ำพริกน้ำปู': 'ยาก',
    'แกงแคไก่': 'ยาก',
    'ส้าจิ้น': 'ปานกลาง'
  };

  final Map<String, String> menuImages = {
    'ข้าวซอย': 'assets/1.jpg',
    'น้ำเงี้ยว': 'assets/9.jpg',
    'แกงฮังเล': 'assets/3.jpg',
    'น้ำพริกหนุ่ม': 'assets/10.jpg',
    'ไข่ป่าม': 'assets/2.jpg',
    'อ่องปูนา': 'assets/4.jpg',
    'น้ำพริกข่าเห็ดถอบ': 'assets/5.jpg',
    'แกงเห็ดเผาะ': 'assets/6.jpg',
    'คอหมูทอดน้ำปลา': 'assets/7.jpg',
    'พริกหยวกยัดไส้': 'assets/11.jpg',
    'แหนมหมกไข่': 'assets/8.jpg',
    'น้ำพริกอ่อง': 'assets/12.jpg',
    'ไส้อั่วอกไก่': 'assets/13.jpg',
    'น้ำพริกตาแดง': 'assets/14.jpg',
    'ยำไก่': 'assets/15.jpg',
    'ลาบหมูคั่ว': 'assets/16.jpg',
    'ข้าวกั้นจิ้น': 'assets/17.jpg',
    'น้ำพริกน้ำปู': 'assets/18.jpg',
    'แกงแคไก่': 'assets/19.jpg',
    'ส้าจิ้น': 'assets/20.jpg'
  };

  List<MapEntry<String, String>> recommendedItems = [];

  @override
  void initState() {
    super.initState();
    _getRandomRecommendedItems(); 
  }

  void _getRandomRecommendedItems() {
    final random = Random();
    final easyItems = difficultyLevels.entries.where((entry) => entry.value == 'ง่าย').toList();
    final mediumItems = difficultyLevels.entries.where((entry) => entry.value == 'ปานกลาง').toList();
    final hardItems = difficultyLevels.entries.where((entry) => entry.value == 'ยาก').toList();

    setState(() {
      recommendedItems = [
        easyItems[random.nextInt(easyItems.length)],
        mediumItems[random.nextInt(mediumItems.length)],
        hardItems[random.nextInt(hardItems.length)],
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เมนูแนะนำ'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _getRandomRecommendedItems, 
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15.0),
        itemCount: recommendedItems.length,
        itemBuilder: (context, index) {
          final menuItem = recommendedItems[index];
          final itemName = menuItem.key;
          final difficulty = menuItem.value;
          final imageAsset = menuImages[itemName] ?? 'assets/default.jpg';

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: GestureDetector(
              onTap: () {
                if (itemName == 'ข้าวซอย') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const KhaoSoiScreen()),
                  );
                } else if (itemName == 'น้ำเงี้ยว') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NamNgiawScreen(),
                          ),
                        );
                      } else if (itemName == 'แกงฮังเล') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HangLayScreen(),
                          ),
                        );
                      } else if (itemName == 'น้ำพริกหนุ่ม') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NamPrikNoomScreen(),
                          ),
                        );
                      } else if (itemName == 'ไข่ป่าม') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const KaiPamScreen(),
                          ),
                        );
                      } else if (itemName == 'อ่องปูนา') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OngPooNaScreen(),
                          ),
                        );
                      } else if (itemName == 'น้ำพริกข่าเห็ดถอบ') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const NamPrikKhaHedThobScreen(),
                          ),
                        );
                      } else if (itemName == 'แกงเห็ดเผาะ') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const KaengHedPhorScreen(),
                          ),
                        );
                      } else if (itemName == 'คอหมูทอดน้ำปลา') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FriedPorkNeckScreen(),
                          ),
                        );
                      } else if (itemName == 'พริกหยวกยัดไส้') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const StuffedBellPeppersScreen(),
                          ),
                        );
                      } else if (itemName == 'แหนมหมกไข่') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EggSteamedNhamScreen(),
                          ),
                        );
                      } else if (itemName == 'น้ำพริกอ่อง') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NamPrikOngScreen(),
                          ),
                        );
                      } else if (itemName == 'ไส้อั่วอกไก่') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SaiAuaOkGaiScreen(),
                          ),
                        );
                      } else if (itemName == 'น้ำพริกตาแดง') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NamPrikTaDaengScreen(),
                          ),
                        );
                      } else if (itemName == 'ยำไก่') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const YumGaiScreen(),
                          ),
                        );
                      } else if (itemName == 'ลาบหมูคั่ว') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LabMooKuaScreen(),
                          ),
                        );
                      } else if (itemName == 'ข้าวกั้นจิ้น') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const KhaoKanJinScreen(),
                          ),
                        );
                      } else if (itemName == 'น้ำพริกน้ำปู') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NamPrikNamPooScreen(),
                          ),
                        );
                      } else if (itemName == 'แกงแคไก่') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const KaengKaeKaiScreen(),
                          ),
                        );
                      } else if (itemName == 'ส้าจิ้น') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SaJinScreen(),
                          ),
                        );
                      }
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center, 
                  children: [
                    Image.asset(imageAsset, height: 150, width: double.infinity, fit: BoxFit.cover),
                    const SizedBox(height: 8.0),
                    Text(
                      itemName,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center, 
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'ระดับความยาก: $difficulty',
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
