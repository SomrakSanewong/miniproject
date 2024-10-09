import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 
import 'FavoriteScreen.dart';

class EggSteamedNhamScreen extends StatefulWidget {
  const EggSteamedNhamScreen({Key? key}) : super(key: key);

  @override
  _EggSteamedNhamScreenState createState() => _EggSteamedNhamScreenState();
}

class _EggSteamedNhamScreenState extends State<EggSteamedNhamScreen> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FavoriteScreen(favoriteItem: 'แหนมหมกไข่')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ลบแหนมหมกไข่ออกจากรายการโปรดแล้ว!'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context);
    }
  }

  // ฟังก์ชันเปิดลิงก์ภายนอก
  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://www.wongnai.com/recipes/jin-som-mok-khai'); 
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
      'แหนม 200 กรัม',
      'ไข่ไก่ 2 ฟอง',
      'น้ำมันพืช 2 ช้อนโต๊ะ',
      'หอมแดงซอย 2 ช้อนโต๊ะ',
      'พริกไทยป่น 1 ช้อนชา',
      'น้ำปลา 1 ช้อนโต๊ะ',
      'ใบโหระพา (สำหรับตกแต่ง)',
    ];

    final List<String> steps = [
      'STEP 1: เตรียมแหนม\n- นำแหนมมาหั่นเป็นชิ้นเล็กๆ',
      'STEP 2: ผสมส่วนผสม\n- ในชามผสม ใส่ไข่ไก่ น้ำปลา พริกไทยป่น หอมแดง และแหนมที่เตรียมไว้ ผสมให้เข้ากัน',
      'STEP 3: นึ่ง\n- เทส่วนผสมลงในถาดนึ่งที่ทาน้ำมันไว้แล้ว และนำไปนึ่งในน้ำเดือดประมาณ 20-25 นาที',
      'STEP 4: เสิร์ฟ\n- เมื่อสุกแล้วให้นำออกจากถาด ตกแต่งด้วยใบโหระพาและเสิร์ฟพร้อมข้าวสวย',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('แหนมหมกไข่'),
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
                  image: AssetImage('assets/8.jpg'), 
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
            _buildIngredientsList(ingredients),
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
            _buildStepsList(steps),
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

  // ฟังก์ชันสร้างรายการวัตถุดิบ
  Widget _buildIngredientsList(List<String> ingredients) {
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
    );
  }

  // ฟังก์ชันสร้างรายการวิธีทำ
  Widget _buildStepsList(List<String> steps) {
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
              leading: const Icon(Icons.check_circle, color: Colors.green),
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
