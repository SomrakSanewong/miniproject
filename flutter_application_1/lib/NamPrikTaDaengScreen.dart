import 'package:flutter/material.dart';
import 'FavoriteScreen.dart';
import 'package:url_launcher/url_launcher.dart'; 


class NamPrikTaDaengScreen extends StatefulWidget {
  const NamPrikTaDaengScreen({Key? key}) : super(key: key);

  @override
  _NamPrikTaDaengScreenState createState() => _NamPrikTaDaengScreenState();
}

class _NamPrikTaDaengScreenState extends State<NamPrikTaDaengScreen> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FavoriteScreen(favoriteItem:'น้ำพริกตาแดง')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ลบ น้ำพริกตาแดง ออกจากรายการโปรดแล้ว!'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context);
    }
  }
  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://www.wongnai.com/recipes/northern-thai-chili-paste'); 
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
      'พริกแห้ง 15 เม็ด - สำหรับเพิ่มความเผ็ดและสีสัน',
      'หอมแดง 4 หัว - ช่วยเพิ่มรสชาติหวาน',
      'กระเทียม 10 กลีบ - เสริมรสชาติ',
      'น้ำปลา 2 ช้อนโต๊ะ - สำหรับปรุงรส',
      'น้ำตาลทราย 1 ช้อนชา - เพื่อลดความเผ็ด',
      'มะนาว 1 ลูก - สำหรับเพิ่มความเปรี้ยว',
    ];

    final List<String> steps = [
      'STEP 1: เตรียมพริก\n- แช่พริกแห้งในน้ำอุ่นจนเนื้อนิ่ม',
      'STEP 2: ปั่นเครื่อง\n- นำพริก, หอมแดง, กระเทียม และน้ำปลา ปั่นให้ละเอียด',
      'STEP 3: ปรุงรส\n- เติมน้ำตาลและน้ำมะนาว คนให้เข้ากัน',
      'STEP 4: เสิร์ฟ\n- เสิร์ฟน้ำพริกตาแดงพร้อมกับผักสด',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('น้ำพริกตาแดง'),
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
                  image: AssetImage('assets/14.jpg'), 
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
