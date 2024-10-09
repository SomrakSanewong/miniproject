import 'package:flutter/material.dart';
import 'FavoriteScreen.dart';
import 'package:url_launcher/url_launcher.dart'; 


class HangLayScreen extends StatefulWidget {
  const HangLayScreen({Key? key}) : super(key: key);

  @override
  _HangLayScreenState createState() => _HangLayScreenState();
}

class _HangLayScreenState extends State<HangLayScreen> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FavoriteScreen(favoriteItem: 'คอหมูทอดน้ำปลา')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ลบแกงฮังเลออกจากรายการโปรดแล้ว!'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context);
    }
  }
  // ฟังก์ชันเปิดลิงก์ภายนอก
  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://www.wongnai.com/recipes/hunglay-curry'); 
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
      'เนื้อสันคอหมูหั่นเต๋า 300 กรัม',
      'เนื้อหมูสามชั้นหั่นเต๋า 200 กรัม',
      'น้ำตาลทราย',
      'น้ำมะขามเปียก 3 ช้อนโต๊ะ',
      'ขิงซอย 1/2 ถ้วย',
      'กระเทียม 1/2 ถ้วย',
      'ถั่วลิสงคั่ว 2 ช้อนโต๊ะ',
      'สับปะรด 2 ช้อนโต๊ะ',
    ];

    final List<String> spiceIngredients = [
      'พริกแห้ง 7 เม็ด',
      'หอมแดง 3 หัว',
      'กระเทียม 20 กลีบ',
      'ตะไคร้ซอย 2 ช้อนโต๊ะ',
      'ข่าซอย 1 ช้อนโต๊ะ',
      'เกลือ 1 ช้อนชา',
      'กะปิหยาบ ½ ช้อนโต๊ะ',
    ];

    final List<String> steps = [
      'STEP 1: ตำพริกแกง\n นำพริกแห้ง ข่าซอย กระเทียม ตะไคร้ซอย หอมแดง และเกลือ โขลกรวมกันให้ละเอียด หลังจากนั้นใส่กะปิหยาบลงไป โขลกให้ทุกอย่างเข้ากัน ตักขึ้นพักไว้',
      'STEP 2: หมักหมูนำพริกแกงที่ขโลกไว้มาผสมกับสับปะรด เนื้อสันคอหมูหั่นเต๋า และเนื้อหมูสามชั้นหั่นเต๋า คลุกเคล้าให้เข้ากัน หมักประมาณ 1 ชั่วโมง',
      'STEP 3:  ปรุงแกงฮังเลนำหมูที่หมักไว้มาตั้งไฟ ใส่น้ำเล็กน้อย ผัดต่อจนหมูเริ่มสุก คอยเติมน้ำเรื่อยๆ เคี่ยวต่อจนหมูเปื่อยได้ที่ปรุงรสด้วยน้ำมะขามเปียก หลังจากนั้นใส่กระเทียม และขิงซอย คนให้ทุกอย่างเข้ากัน เคี่ยวต่ออีกสักครู่สุดท้ายใส่ถั่วลิสงคั่ว ปล่อยให้เดือดต่ออีก 15 นาที ตักแกงฮังเลเสิร์ฟได้เลยจ้า! ',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('วัตถุดิบแกงฮังเล'),
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
                  image: AssetImage('assets/3.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'วัตถุดิบ: ',
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
              'วัตถุดิบเครื่องแกง: ',
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
                itemCount: spiceIngredients.length,
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
                            spiceIngredients[index],
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
              'วิธีทำ: ',
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
