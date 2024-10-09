import 'package:flutter/material.dart';
import 'FavoriteScreen.dart';
import 'package:url_launcher/url_launcher.dart'; 


class NamNgiawScreen extends StatefulWidget {
  const NamNgiawScreen({Key? key}) : super(key: key);

  @override
  _NamNgiawScreenState createState() => _NamNgiawScreenState();
}

class _NamNgiawScreenState extends State<NamNgiawScreen> {
  bool isFavorite = false; 

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite; 
    });

    if (isFavorite) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FavoriteScreen(favoriteItem:'น้ำเงี้ยว')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ลบน้ำเงี้ยวออกจากรายการโปรดแล้ว!'),
          duration: Duration(seconds: 2),
        ),
      );

      Navigator.pop(context);
    }
  }

  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://www.wongnai.com/recipes/kanom-jeen-nam-ngeaw'); 
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
      'หมูบด 1/2 กก',
      'ซี่โครงอ่อน 1/2 กก',
      'ตรีนไก่ 1/2 กก',
      'เลือดไก่ 3 ก้อน',
      'มะเขือเทศสีดา 1 กก',
      'ดอกงิ้วตามชอบ',
      'ผักชีต้นหอม 3 กำ',
      'ผักกาดดองซอย 1/2 กก',
      'ถั่วงอก 15 บาท',
      'กะหล่ำปลีซอย 1 หัว',
      'พริกแห้งทอด 20 เม็ด',
      'พริกน้ำเงี้ยว (แม่น้อย) 500 กรัม',
      'กะปิ 2 ช้อนโต๊ะ',
      'น้ำปลาตามชอบ',
      'น้ำตาลตามชอบ',
      'กระเทียมไทยสำหรับเจียว 1-2 ขีด',
    ];

    final List<String> steps = [
      'เวลาเตรียมส่วนผสม: 25 นาที เวลาปรุงอาหาร: 1 ชั่วโมง 30 นาที '
      'STEP 1: เริ่มเคี่ยวกระดูกอ่อนและตีนไก่รอไว้ก่อนกว่าจะเปื่อยหั่นของเสร็จพอดี'
      'STEP 2: หั่นเลือดไก่เตรียมหมูบด',
      'STEP 3: แช่ดอกงิ้วรอไว้ นานๆหน่อยสักชั่วโมงนึงเวลาต้มจะได้เปื่อยง่ายๆ',
      'STEP 4: หั่นมะเขือเทศทั้งหมด ก่อนหั่นล้างให้สะอาด',
      'STEP 5: เจียวกระเทียมเตรียมไว้',
      'STEP 6: มาลงมือทำกันเลย น้ำพริกยี่ห้อนี้อร่อยดีครับ',
      'STEP 7: นำพริกแกงมาผัดกับน้ำมันที่ได้จากการเจียวกระเทียม',
      'STEP 8: ใส่มะเขือเทศลงไปผัดกับพริกแกงให้ยุบ',
      'STEP 9: เมื่อมะเขือเทศสุกแล้ว เทลงในหม้อที่เคี่ยวกระดูก ตามด้วยหมูบดและเลือดไก่',
      'STEP 10: ใส่กะปิลงไปเลย ใช้แทนถั่วเน่าไม่ชอบกลิ่นถั่วเน่า',
      'STEP 11: คนทุกอย่างให้ละลายเข้ากัน ปรุงรสตามชอบ ออกเค็มหวาน ปล่อยให้เดือด ลดไฟลงเคี่ยวไปเรื่อยๆ',
      'STEP 12: ใส่ดอกงิ้วที่แช่น้ำลงไปเคี่ยวด้วยจะได้นิ่มอร่อย  ชิมอีกครั้ง ตามชอบ เราชอบออกหวานนิดๆเปรี้ยวนิดๆ เค็มตาม',
      'STEP 13: เเค่นี้ก้อเสร็จพร้อมรัปทาน หรี่ไฟอ่อนเคี่ยวไปเรื่อยๆ  เตรียมขนมจีน ตักราด โรยด้วยเครื่องเคียงต่างๆ',

    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('วัตถุดิบน้ำเงี้ยว'),
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
                  image: AssetImage('assets/9.jpg'), 
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
