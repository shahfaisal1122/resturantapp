import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class servicedetailpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Salon Services', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchBar(),
            _serviceCategories(),
            _serviceList(),
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search For services",
          prefixIcon: Icon(Icons.search, color: Colors.black),
          suffixIcon: Icon(Icons.filter_list, color: Colors.black),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _serviceCategories() {
    List<Map<String, dynamic>> categories = [
      {'icon': FontAwesomeIcons.cut, 'label': 'Haircut'},
      {'icon': FontAwesomeIcons.spa, 'label': 'Facial'},
      {'icon': FontAwesomeIcons.handSparkles, 'label': 'Nails'},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: categories.map((category) {
          return Column(
            children: [
              Icon(category['icon'], size: 30, color: Colors.black),
              SizedBox(height: 5),
              Text(category['label'], style: TextStyle(fontSize: 16)),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _serviceList() {
    List<Map<String, dynamic>> services = [
      {'image': 'https://example.com/haircut1.jpg', 'title': 'Woman Medium..', 'price': '\$50', 'time': '2 hour', 'discount': '-20%', 'desc': 'A blunt cut bob is a shorter hairstyle...'},
      {'image': 'https://example.com/haircut2.jpg', 'title': 'Bob/ Lob Cut', 'price': '\$55', 'time': '1.5 hour', 'discount': '-20%', 'desc': 'Lob haircut is a women\'s hairstyle...'},
      {'image': 'https://example.com/haircut3.jpg', 'title': 'Medium Length Layer Cut', 'price': '\$80', 'time': '1 hour', 'discount': '', 'desc': 'Layered hair gives the illusion of...'},
      {'image': 'https://example.com/haircut4.jpg', 'title': 'V-Shaped Cut', 'price': '\$90', 'time': '2.5 hour', 'discount': '-5%', 'desc': 'There are a lot of variations between v-sh...'},
    ];

    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: services.map((service) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 3,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(service['image'], width: 70, height: 70, fit: BoxFit.cover),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(service['title'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text(service['price'] + ' - ' + service['time'], style: TextStyle(color: Colors.red)),
                        Text(service['desc'], overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (service['discount'].isNotEmpty)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(service['discount'], style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                        ),
                      SizedBox(height: 5),
                      Icon(service['discount'] == '' ? Icons.add_circle : Icons.remove_circle, color: service['discount'] == '' ? Colors.green : Colors.red),
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

