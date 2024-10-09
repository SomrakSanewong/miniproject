import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 

class KaiPamScreen extends StatefulWidget {
  const KaiPamScreen({Key? key}) : super(key: key);

  @override
  _KaiPamScreenState createState() => _KaiPamScreenState();
}

class _KaiPamScreenState extends State<KaiPamScreen> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isFavorite 
          ? 'เพิ่มไข่ป่ามในรายการโปรดแล้ว!' 
          : 'ลบไข่ป่ามออกจากรายการโปรดแล้ว!'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://www.wongnai.com/recipes/grilled-eggs-in-banana-leaves'); 
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
      'ไข่ไก่ 4 ฟอง',
      'น้ำปลา 1 ช้อนโต๊ะ',
      'ต้นหอมซอย 2 ช้อนโต๊ะ',
      'ใบตองสำหรับห่อ',
      'ไม้กลัดสำหรับกลัดใบตอง',
    ];

    final List<String> steps = [
      'STEP 1: ตีไข่ใส่น้ำปลาและต้นหอมซอยให้เข้ากัน',
      'STEP 2: ตัดใบตองเป็นแผ่นพอประมาณ นำมาทำกระทงด้วยไม้กลัด',
      'STEP 3: เทส่วนผสมไข่ลงในกระทงใบตอง',
      'STEP 4: ย่างบนเตาถ่านไฟอ่อนจนไข่สุก',
      'STEP 5: เสิร์ฟไข่ป่ามร้อนๆ กับข้าวเหนียว',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('วัตถุดิบไข่ป่าม'),
        backgroundColor: Colors.greenAccent,
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
                  image: AssetImage('assets/2.jpg'),
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
                color: Colors.greenAccent,
              ),
            ),
            const SizedBox(height: 16),
            _buildIngredientList(ingredients),
            const SizedBox(height: 20),
            const Text(
              'วิธีทำ:',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent,
              ),
            ),
            const SizedBox(height: 10),
            _buildStepList(steps),
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

  Widget _buildIngredientList(List<String> ingredients) {
    return Container(
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
                const Icon(Icons.local_dining, color: Colors.greenAccent),
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
    );
  }

  Widget _buildStepList(List<String> steps) {
    return Container(
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
              leading: const Icon(Icons.check_circle, color: Colors.greenAccent),
              title: Text(
                steps[index],
                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
