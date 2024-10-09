import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 
import 'FavoriteScreen.dart';

class OngPooNaScreen extends StatefulWidget {
  const OngPooNaScreen({Key? key}) : super(key: key);

  @override
  _OngPooNaScreenState createState() => _OngPooNaScreenState();
}

class _OngPooNaScreenState extends State<OngPooNaScreen> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FavoriteScreen(favoriteItem:'อ่องปูนา')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ลบ อ่องปูนา ออกจากรายการโปรดแล้ว!'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context);
    }
  }
  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://www.wongnai.com/recipes/ong-poona');
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
      'ปูนาตัวเล็ก 500 กรัม - ล้างสะอาดและบดละเอียด',
      'ไข่ไก่ 2 ฟอง',
      'ต้นหอม 2 ต้น - ซอย',
      'เกลือ 1 ช้อนชา',
      'น้ำปลา 1 ช้อนโต๊ะ',
      'พริกป่น 1 ช้อนชา (ตามชอบ)',
      'หอมแดงซอย 2 หัว',
      'ใบมะกรูด 5 ใบ - ซอย',
    ];

    final List<String> steps = [
      'STEP 1: เตรียมวัตถุดิบ\n- บดปูนาให้ละเอียด ผสมกับไข่ไก่และเครื่องปรุงรสทั้งหมด',
      'STEP 2: ผสม\n- ผสมให้เข้ากันจนมีความเนียน',
      'STEP 3: นึ่ง\n- ตักใส่ถ้วยแล้วนึ่งในน้ำเดือดจนสุก ประมาณ 15-20 นาที',
      'STEP 4: เสิร์ฟ\n- เสิร์ฟพร้อมกับข้าวเหนียวหรือผักสด',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('อ่องปูนา'),
        backgroundColor: Colors.orangeAccent,
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
                  image: AssetImage('assets/4.jpg'), 
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
                color: Colors.orangeAccent,
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
                        const Icon(Icons.local_dining, color: Colors.orangeAccent),
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
                color: Colors.orangeAccent,
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
                      leading: const Icon(Icons.check_circle, color: Colors.orangeAccent),
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
                onPressed: _launchURL, 
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
