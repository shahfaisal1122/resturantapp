import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RestaurantMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Restaurant Menu', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.filter_list, color: Colors.white),
              onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchBar(),
            _sectionTitle('Food Category'),
            _horizontalScrollList(),
            _sectionTitle('Menu'),
            _gridMenuItems(),
            _sectionTitle('Sweet Dishes'),
            _gridMenuItems(),
            _sectionTitle('Special Offers'),
            _verticalMenuItems(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: ''),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Food Here',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _horizontalScrollList() {
    return Container(
      height: 100,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        _categoryItem(),
        _categoryItem(),
        _categoryItem(),
      ]),
    );
  }

  Widget _categoryItem() {
    return Container(
      width: 80,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _gridMenuItems() {
    List<Map<String, String>> menuItems = [
      {
        'image': 'assets/images/noodles.jpg',
        'name': 'Noodles',
        'price': '₹140.00'
      },
      {
        'image': 'assets/images/pasta.jpg',
        'name': 'Pasta Brunch',
        'price': '₹170.00'
      },
      {'image': 'assets/images/pizza.jpg', 'name': 'Pizza', 'price': '₹250.00'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        return _menuItem(
          menuItems[index]['image']!,
          menuItems[index]['name']!,
          menuItems[index]['price']!,
        );
      },
    );
  }

  Widget _menuItem(String imagePath, String name, String price) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(price, style: TextStyle(color: Colors.red)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {},
                  child:
                      Text('Add Cart', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _verticalMenuItems() {
    List<Map<String, String>> specialOffers = [
      {
        'image': 'assets/images/logo.jpg',
        'name': 'Pav Bhaji',
        'price': '₹150.00'
      },
      {
        'image': 'assets/images/gajar_halwa.jpg',
        'name': 'Gajar Halwa',
        'price': '₹120.00'
      },
      {'image': 'assets/images/idli.jpg', 'name': 'Idli', 'price': '₹120.00'},
      {
        'image': 'assets/images/butter_chicken.jpg',
        'name': 'Butter Chicken',
        'price': '₹350.00'
      },
    ];

    return Column(
      children: specialOffers.map((item) {
        return _specialOfferItem(item['image']!, item['name']!, item['price']!);
      }).toList(),
    );
  }

  Widget _specialOfferItem(String imagePath, String name, String price) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(price, style: TextStyle(color: Colors.red)),
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {},
                      child: Text('Add Cart',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}
