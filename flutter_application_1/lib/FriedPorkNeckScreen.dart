import 'package:flutter/material.dart';
import 'FavoriteScreen.dart';
import 'package:url_launcher/url_launcher.dart';

class FriedPorkNeckScreen extends StatefulWidget {
  const FriedPorkNeckScreen({Key? key}) : super(key: key);

  @override
  _FriedPorkNeckScreenState createState() => _FriedPorkNeckScreenState();
}

class _FriedPorkNeckScreenState extends State<FriedPorkNeckScreen> {
  List<String> favoriteItems = []; 
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
          content: Text('ลบ คอหมูทอดน้ำปลา ออกจากรายการโปรดแล้ว!'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context);
    }
  }

  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://www.wongnai.com/recipes/fried-pork-with-fish-sauce');
    try {
      if (!await launchUrl(url)) {
        throw 'Could not launch $url';
      }
    } catch (e) {
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
      'คอหมู 300 กรัม',
      'น้ำปลา 2 ช้อนโต๊ะ',
      'กระเทียมสับ 1 ช้อนโต๊ะ',
      'น้ำตาลทราย 1 ช้อนชา',
      'พริกไทยป่น 1/2 ช้อนชา',
      'น้ำมันพืชสำหรับทอด',
    ];

    final List<String> steps = [
      'STEP 1: หมักคอหมู\n- ผสมคอหมูกับน้ำปลา กระเทียมสับ น้ำตาล และพริกไทยในชามใหญ่ หมักไว้ประมาณ 30 นาที',
      'STEP 2: ทอดคอหมู\n- ตั้งกระทะใส่น้ำมันให้ร้อน จากนั้นนำคอหมูที่หมักไว้ลงทอดจนสุกเหลืองทั้งสองด้าน',
      'STEP 3: หั่นและเสิร์ฟ\n- เมื่อคอหมูสุกแล้ว ให้นำขึ้นมาสะเด็ดน้ำมัน หั่นเป็นชิ้นบาง ๆ และเสิร์ฟพร้อมน้ำจิ้มแจ่วหรือข้าวเหนียว',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('คอหมูทอดน้ำปลา'),
        backgroundColor: Colors.brown,
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
                  image: AssetImage('assets/7.jpg'),
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
                color: Colors.brown,
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
              child: ListView.separated(
                itemCount: ingredients.length,
                separatorBuilder: (context, index) => const Divider(),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.local_dining, color: Colors.brown),
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
                color: Colors.brown,
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
              child: ListView.separated(
                itemCount: steps.length,
                separatorBuilder: (context, index) => const Divider(),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: const Icon(Icons.check_circle, color: Colors.brown),
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
