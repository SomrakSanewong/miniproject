import 'package:flutter/material.dart';
import 'FavoriteScreen.dart';
import 'package:url_launcher/url_launcher.dart'; 


class NamPrikOngScreen extends StatefulWidget {
  const NamPrikOngScreen({Key? key}) : super(key: key);

  @override
  _NamPrikOngScreenState createState() => _NamPrikOngScreenState();
}

class _NamPrikOngScreenState extends State<NamPrikOngScreen> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FavoriteScreen(favoriteItem:'น้ำพริกอ่อง')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ลบ น้ำพริกอ่องออกจากรายการโปรดแล้ว!'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context);
    }
  }
  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://www.wongnai.com/recipes/thai-northen-style-chilli-relish'); 
    if (!await launchUrl(url)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ไม่สามารถเปิด URL ได้'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> ingredients = [
      'เนื้อหมูสับ 200 กรัม',
      'พริกแห้ง 10 เม็ด',
      'กระเทียม 5 กลีบ',
      'หอมแดง 2 หัว',
      'น้ำมะนาว 2 ช้อนโต๊ะ',
      'น้ำปลา 1 ช้อนโต๊ะ',
      'ผักสด (สำหรับเสิร์ฟ)',
      'น้ำซุป (ถ้าจำเป็น)',
    ];

    final List<String> steps = [
      'STEP 1: เตรียมพริก\n- แช่พริกแห้งในน้ำร้อนประมาณ 10 นาที จากนั้นนำมาบดละเอียดกับกระเทียมและหอมแดง',
      'STEP 2: ผัดเนื้อ\n- ใส่เนื้อหมูสับลงในกระทะที่มีน้ำมันร้อน ผัดให้สุก',
      'STEP 3: ผสมส่วนผสม\n- ใส่พริกที่บดแล้วลงไป ผสมให้เข้ากัน และปรุงรสด้วยน้ำมะนาวและน้ำปลา',
      'STEP 4: เสิร์ฟ\n- เสิร์ฟน้ำพริกอ่องพร้อมผักสดตามชอบ',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('น้ำพริกอ่อง'),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: toggleFavorite,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage('assets/12.jpg'), 
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'วัตถุดิบ:',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ListView.builder(
                itemCount: ingredients.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.local_dining, color: Colors.redAccent),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            ingredients[index],
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'วิธีทำ:',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ListView.builder(
                itemCount: steps.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: const Icon(Icons.check_circle, color: Colors.redAccent),
                      title: Text(
                        steps[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton.icon(
                onPressed: _launchURL, // เรียกฟังก์ชันเปิดลิงก์
                icon: const Icon(Icons.link),
                label: const Text('อ่านต่อที่ Wongnai'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
