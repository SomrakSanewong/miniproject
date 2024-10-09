import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 
import 'FavoriteScreen.dart';

class KhaoSoiScreen extends StatefulWidget {
  const KhaoSoiScreen({Key? key}) : super(key: key);

  @override
  _KhaoSoiScreenState createState() => _KhaoSoiScreenState();
}

class _KhaoSoiScreenState extends State<KhaoSoiScreen> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;

      if (isFavorite) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FavoriteScreen(favoriteItem: 'ข้าวซอย')), // ไปยังหน้ารายการโปรด
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('ลบข้าวซอยออกจากรายการโปรดแล้ว!'),
            duration: Duration(seconds: 2),
          ),
        );
        Navigator.pop(context); 
      }
    });
  }

  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://www.wongnai.com/recipes/northern-thai-coconut-curry-noodle'); 
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
      'น่องไก่ 3 น่องใหญ่',
      'น้ำพริกข้าวซอย 100 กรัม',
      'กะทิ 500 กรัม',
      'เส้นข้าวซอยหรือเส้นหมี่ไข่อิสลาม 100 กรัม',
      'น้ำมันพืช 3 ถ้วยตวง',
      'น้ำปลา 3 ช้อนโต๊ะ',
      'เกลือ 2 ช้อนชา',
      'น้ำตาลมะพร้าว 1.5 ช้อนโต๊ะ',
      'พริกผัด 1 ช้อนโต๊ะ',
      'น้ำสะอาด 1.5 ลิตร',
      'หอมแขกซอย',
      'ผักกาดดองซอย',
      'ต้นหอมผักชี',
    ];

    final List<String> steps = [
      'STEP 1: ปรุงน้ำข้าวซอย\n- ตั้งหม้อหรือกระทะใบใหญ่ให้ร้อน ใส่กะทิลงไปเคี่ยวสักพัก ตามด้วยเครื่องแกง จากนั้นเคี่ยวจนกะทิให้แตกมัน\n\n- ใส่น่องไก่ลงไปผัดให้เข้ากับกะทิ แล้วเติมกะทิลงไปจนหมด เคี่ยวต่อให้ไก่เปื่อย สัก 30-40 นาที',
      'STEP 2: ใส่เส้นข้าวซอย\n- หลังจากที่ไก่เปื่อยแล้ว ให้เติมน้ำสะอาดลงไป ใส่เส้นข้าวซอยหรือเส้นหมี่ไข่อิสลามลงไป ต้มจนเส้นสุก\n\n- ปรุงรสด้วยน้ำปลาและน้ำตาลมะพร้าวตามชอบ',
      'STEP 3: เสิร์ฟ\n- ตักข้าวซอยใส่ชาม และตกแต่งด้วยหอมแขกซอย, ผักกาดดองซอย และต้นหอมผักชี',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('วัตถุดิบข้าวซอย'),
        backgroundColor: Colors.orange,
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
                  image: AssetImage('assets/1.jpg'), 
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
