import 'package:flutter/material.dart';
import 'MenuScreen.dart'; 
import 'HomeScreen.dart'; 

class FavoriteScreen extends StatefulWidget {
  final String favoriteItem; 

  const FavoriteScreen({Key? key, required this.favoriteItem}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<String> favoriteItems = [];

  @override
  void initState() {
    super.initState();
    favoriteItems.add(widget.favoriteItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายการโปรด'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: favoriteItems.isEmpty
                  ? const Center(
                      child: Text(
                        'ไม่มีรายการโปรด!',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView.builder(
                      itemCount: favoriteItems.length,
                      itemBuilder: (context, index) {
                        String item = favoriteItems[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.favorite,
                                size: 50,
                                color: Colors.red,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                '$item ถูกบันทึกเป็นรายการโปรดแล้ว!',
                                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('ยืนยันการลบ'),
                                        content: const Text('คุณต้องการลบรายการโปรดนี้หรือไม่?'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(); 
                                            },
                                            child: const Text('ยกเลิก'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                favoriteItems.removeAt(index);
                                              });

                                              Navigator.of(context).pop(); 
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text('$item ถูกลบออกจากรายการโปรดแล้ว!'),
                                                  duration: const Duration(seconds: 2),
                                                ),
                                              );
                                            },
                                            child: const Text('ยืนยัน'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                                ),
                                child: const Text('ลบรายการโปรด'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MenuScreen()), 
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              backgroundColor: Colors.orange, 
            ),
            child: const Text('กลับไปที่หน้าเมนู'),
          ),
          const SizedBox(height: 16), 
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()), 
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              backgroundColor: Colors.orange, 
            ),
            child: const Text('กลับไปที่หน้าแรก'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
