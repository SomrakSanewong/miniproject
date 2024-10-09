import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 
import 'FavoriteScreen.dart';


class KaengHedPhorScreen extends StatefulWidget {
  const KaengHedPhorScreen({Key? key}) : super(key: key);

  @override
  _KaengHedPhorScreenState createState() => _KaengHedPhorScreenState();
}

class _KaengHedPhorScreenState extends State<KaengHedPhorScreen> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FavoriteScreen(favoriteItem: 'แกงเห็ดเผาะ')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ลบ แกงเห็ดเผาะ ออกจากรายการโปรดแล้ว!'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context);
    }
  }
  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://www.wongnai.com/recipes/earthstar-mushroom-soup'); 
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
      'เห็ดเผาะ 300 กรัม - ล้างสะอาด',
      'ใบมะกรูด 3 ใบ',
      'พริกแกงเผ็ด 3 ช้อนโต๊ะ',
      'น้ำปลา 2 ช้อนโต๊ะ',
      'กะทิ 400 มิลลิลิตร',
      'พริกสด 2-3 เม็ด - หั่นแฉลบ',
      'เนื้อหมู หรือ เนื้อไก่ 200 กรัม',
      'น้ำตาลปี๊บ 1 ช้อนชา',
      'ใบโหระพา 1 กำมือ',
    ];

    final List<String> steps = [
      'STEP 1: ผัดพริกแกง\n- ตั้งหม้อใส่หัวกะทิลงไปต้มให้แตกมัน จากนั้นใส่พริกแกงลงไปผัดจนหอม',
      'STEP 2: ต้มเห็ด\n- ใส่เนื้อหมูหรือเนื้อไก่ลงไปผัดให้เข้ากัน ตามด้วยเห็ดเผาะ และเติมน้ำกะทิที่เหลือลงไป',
      'STEP 3: ปรุงรส\n- ปรุงรสด้วยน้ำปลา น้ำตาลปี๊บ และใบมะกรูดฉีก',
      'STEP 4: เติมใบโหระพา\n- ใส่ใบโหระพาและพริกสดลงไป คนให้เข้ากันแล้วปิดไฟ เสิร์ฟพร้อมข้าวสวย',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('แกงเห็ดเผาะ'),
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
                  image: AssetImage('assets/6.jpg'), 
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
