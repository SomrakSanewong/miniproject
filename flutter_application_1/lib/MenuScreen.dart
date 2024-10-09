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

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<String> menuItems = [
    'ข้าวซอย',
    'น้ำเงี้ยว',
    'แกงฮังเล',
    'น้ำพริกหนุ่ม',
    'ไข่ป่าม',
    'อ่องปูนา',
    'น้ำพริกข่าเห็ดถอบ',
    'แกงเห็ดเผาะ',
    'คอหมูทอดน้ำปลา',
    'พริกหยวกยัดไส้',
    'แหนมหมกไข่',
    'น้ำพริกอ่อง',
    'ไส้อั่วอกไก่',
    'น้ำพริกตาแดง',
    'ยำไก่',
    'ลาบหมูคั่ว',
    'ข้าวกั้นจิ้น',
    'น้ำพริกน้ำปู',
    'แกงแคไก่',
    'ส้าจิ้น'
  ];

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

  String searchQuery = '';
  String selectedDifficulty = 'ทั้งหมด';

  @override
  Widget build(BuildContext context) {
    final filteredMenuItems = menuItems.where((item) {
      final matchesSearchQuery = item.contains(searchQuery);
      final matchesDifficulty = selectedDifficulty == 'ทั้งหมด' ||
          difficultyLevels[item] == selectedDifficulty;
      return matchesSearchQuery && matchesDifficulty;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('เมนู')),
      body: Container(
        color: Colors.lightBlue[50],
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'ค้นหารายการอาหาร...',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedDifficulty,
              items: <String>['ทั้งหมด', 'ง่าย', 'ปานกลาง', 'ยาก']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedDifficulty = newValue!;
                });
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: filteredMenuItems.length,
                itemBuilder: (context, index) {
                  String selectedItem = filteredMenuItems[index];

                  return GestureDetector(
                    onTap: () {
                      if (selectedItem == 'ข้าวซอย') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const KhaoSoiScreen(),
                          ),
                        );
                      } else if (selectedItem == 'น้ำเงี้ยว') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NamNgiawScreen(),
                          ),
                        );
                      } else if (selectedItem == 'แกงฮังเล') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HangLayScreen(),
                          ),
                        );
                      } else if (selectedItem == 'น้ำพริกหนุ่ม') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NamPrikNoomScreen(),
                          ),
                        );
                      } else if (selectedItem == 'ไข่ป่าม') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const KaiPamScreen(),
                          ),
                        );
                      } else if (selectedItem == 'อ่องปูนา') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OngPooNaScreen(),
                          ),
                        );
                      } else if (selectedItem == 'น้ำพริกข่าเห็ดถอบ') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const NamPrikKhaHedThobScreen(),
                          ),
                        );
                      } else if (selectedItem == 'แกงเห็ดเผาะ') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const KaengHedPhorScreen(),
                          ),
                        );
                      } else if (selectedItem == 'คอหมูทอดน้ำปลา') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const FriedPorkNeckScreen(),
                          ),
                        );
                      } else if (selectedItem == 'พริกหยวกยัดไส้') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const StuffedBellPeppersScreen(),
                          ),
                        );
                      } else if (selectedItem == 'แหนมหมกไข่') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EggSteamedNhamScreen(),
                          ),
                        );
                      } else if (selectedItem == 'น้ำพริกอ่อง') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NamPrikOngScreen(),
                          ),
                        );
                      } else if (selectedItem == 'ไส้อั่วอกไก่') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SaiAuaOkGaiScreen(),
                          ),
                        );
                      } else if (selectedItem == 'น้ำพริกตาแดง') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const NamPrikTaDaengScreen(),
                          ),
                        );
                      } else if (selectedItem == 'ยำไก่') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const YumGaiScreen(),
                          ),
                        );
                      } else if (selectedItem == 'ลาบหมูคั่ว') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LabMooKuaScreen(),
                          ),
                        );
                      } else if (selectedItem == 'ข้าวกั้นจิ้น') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const KhaoKanJinScreen(),
                          ),
                        );
                      } else if (selectedItem == 'น้ำพริกน้ำปู') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NamPrikNamPooScreen(),
                          ),
                        );
                      } else if (selectedItem == 'แกงแคไก่') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const KaengKaeKaiScreen(),
                          ),
                        );
                      } else if (selectedItem == 'ส้าจิ้น') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SaJinScreen(),
                          ),
                        );
                      }
                    },
                    child: Card(
                      elevation: 4,
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              menuImages[selectedItem]!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  selectedItem,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8), 
                                Text(
                                  'ระดับ: ${difficultyLevels[selectedItem]}',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 247, 6, 6),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
