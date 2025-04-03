import 'package:flutter/material.dart';

void main() {
  runApp(PizzaHutApp());
}

class PizzaHutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: PizzaHutHomePage(),
    );
  }
}

class PizzaHutHomePage extends StatefulWidget {
  @override
  _PizzaHutHomePageState createState() => _PizzaHutHomePageState();
}

class _PizzaHutHomePageState extends State<PizzaHutHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pizza Hunt", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: AssetImage('assets/pizza.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  pizzaCard("Pepperoni Pizza", "Cheesy & delicious pepperoni pizza!", "assets/pepporoni pizza.jpeg"),
                  pizzaCard("Veggie Pizza", "Loaded with fresh vegetables.", "assets/veggie.jpeg"),
                  pizzaCard("BBQ Chicken Pizza", "Grilled chicken with BBQ sauce", "assets/bbq pizza.jpeg"),
                  pizzaCard("BBQ Vegan Pizza", "Smoked Mushroom with Vegan BBQ sauce", "assets/vegan.jpeg"),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget pizzaCard(String title, String description, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 5,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              bottomLeft: Radius.circular(15.0),
            ),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
