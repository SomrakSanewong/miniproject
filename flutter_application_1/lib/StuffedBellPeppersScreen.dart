import 'package:flutter/material.dart';
import 'FavoriteScreen.dart';
import 'package:url_launcher/url_launcher.dart'; 


class StuffedBellPeppersScreen extends StatefulWidget {
  const StuffedBellPeppersScreen({Key? key}) : super(key: key);

  @override
  _StuffedBellPeppersScreenState createState() => _StuffedBellPeppersScreenState();
}

class _StuffedBellPeppersScreenState extends State<StuffedBellPeppersScreen> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FavoriteScreen(favoriteItem:'พริกหยวกยัดไส้')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ลบ พริกหยวกยัดไส้ออกจากรายการโปรดแล้ว!'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context);
    }
  }
  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://www.wongnai.com/recipes/grilled-green-chili-stuffed-with-minced-pork'); // ลิงก์ Wongnai
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
      'พริกหยวก 4-5 ลูก',
      'หมูสับ 300 กรัม',
      'ข้าวสวย 1 ถ้วย',
      'น้ำปลา 2 ช้อนโต๊ะ',
      'พริกไทยป่น 1 ช้อนชา',
      'กระเทียมสับ 1 ช้อนโต๊ะ',
      'น้ำมันพืชสำหรับผัด',
      'ใบโหระพาสำหรับตกแต่ง',
    ];

    final List<String> steps = [
      'STEP 1: เตรียมพริกหยวก\n- ล้างพริกหยวกให้สะอาด แล้วตัดหัวออกเพื่อทำการยัดไส้',
      'STEP 2: ทำไส้\n- ผสมหมูสับ ข้าวสวย น้ำปลา กระเทียม และพริกไทยเข้าด้วยกัน',
      'STEP 3: ยัดไส้\n- ยัดส่วนผสมที่เตรียมไว้ลงในพริกหยวกที่เตรียมไว้',
      'STEP 4: ผัด\n- ตั้งกระทะใส่น้ำมัน ใส่พริกหยวกที่ยัดไส้ลงไปผัดให้สุก',
      'STEP 5: เสิร์ฟ\n- เมื่อพริกหยวกสุกแล้ว ให้นำออกจากกระทะ ตกแต่งด้วยใบโหระพาและเสิร์ฟ',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('พริกหยวกยัดไส้'),
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
                  image: AssetImage('assets/11.jpg'),
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
