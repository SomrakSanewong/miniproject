import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 
import 'FavoriteScreen.dart';

class NamPrikKhaHedThobScreen extends StatefulWidget {
  const NamPrikKhaHedThobScreen({Key? key}) : super(key: key);

  @override
  _NamPrikKhaHedThobScreenState createState() => _NamPrikKhaHedThobScreenState();
}

class _NamPrikKhaHedThobScreenState extends State<NamPrikKhaHedThobScreen> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FavoriteScreen(favoriteItem:'น้ำพริกข่าเห็ดถอบ')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ลบ น้ำพริกข่าเห็ดถอบ ออกจากรายการโปรดแล้ว!'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context);
    }
  }
  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://www.wongnai.com/recipes/galangal-curry-paste-with-steamed-barometer-earthstar'); 
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
      'เห็ดถอบ 300 กรัม - ล้างสะอาดและต้มสุก',
      'ข่า 2 แง่ง - ซอยบาง ๆ',
      'พริกแห้ง 5 เม็ด - คั่ว',
      'กระเทียม 5 กลีบ - คั่ว',
      'หอมแดง 3 หัว - คั่ว',
      'น้ำปลา 2 ช้อนโต๊ะ',
      'น้ำมะนาว 1 ช้อนโต๊ะ',
      'น้ำตาลปี๊บ 1 ช้อนชา',
    ];

    final List<String> steps = [
      'STEP 1: เตรียมวัตถุดิบ\n- คั่วพริกแห้ง กระเทียม และหอมแดงให้มีกลิ่นหอม',
      'STEP 2: ตำพริกแกง\n- นำพริกแห้ง ข่า กระเทียม หอมแดงมาตำจนละเอียด',
      'STEP 3: ผสม\n- ใส่เห็ดถอบที่ต้มแล้วลงไปตำคลุกเคล้า',
      'STEP 4: ปรุงรส\n- ปรุงรสด้วยน้ำปลา น้ำมะนาว และน้ำตาลปี๊บตามชอบ',
      'STEP 5: เสิร์ฟ\n- เสิร์ฟน้ำพริกข่าเห็ดถอบพร้อมผักสดและข้าวเหนียว',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('น้ำพริกข่าเห็ดถอบ'),
        backgroundColor: Colors.green,
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
                  image: AssetImage('assets/5.jpg'), 
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
                color: Colors.green,
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
                        const Icon(Icons.local_dining, color: Colors.green),
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
                color: Colors.green,
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
                      leading: const Icon(Icons.check_circle, color: Colors.green),
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
