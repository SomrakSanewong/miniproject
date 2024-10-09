import 'package:flutter/material.dart';
import 'MenuScreen.dart';
import 'FavoriteScreen.dart';
import 'RecommendedMenuScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('หน้าแรก'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAnimatedButton(
                  context,
                  'เมนูแนะนำ',
                  Colors.orange,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecommendedMenuScreen()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                _buildAnimatedButton(
                  context,
                  'เมนู',
                  Colors.blue,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MenuScreen()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                _buildAnimatedButton(
                  context,
                  'เมนูโปรด',
                  Colors.green,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FavoriteScreen(favoriteItem:'')),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedButton(BuildContext context, String text, Color color, VoidCallback onPressed) {
    return Expanded(
      child: GestureDetector(
        onTapDown: (_) {},
        onTapUp: (_) {
          onPressed();
        },
        onTapCancel: () {},
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15), 
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 6),
                blurRadius: 8,
              ),
            ],
          ),
          margin: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.bold, 
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}