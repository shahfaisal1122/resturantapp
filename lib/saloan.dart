import 'package:fima/servicedetailpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SalonDetailPage(),
    );
  }
}

class SalonDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Salon Detail', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _salonInfoSection(),
            _serviceSection(context),
            _offersSection(),
            _locationSection(),
            _actionButtons(),
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

  Widget _salonInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          'https://example.com/salon_image.jpg',
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Danny\'s Salon & Spa',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.green),
                  Text('7700 Hurontario St., Brampton, ON'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.access_time, color: Colors.green),
                  Text('10:00 AM - 10:00 PM'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _serviceSection(BuildContext context) {
    List<Map<String, dynamic>> services = [
      {'icon': FontAwesomeIcons.cut, 'label': 'Haircut'},
      {'icon': FontAwesomeIcons.handSparkles, 'label': 'Nails'},
      {'icon': FontAwesomeIcons.spa, 'label': 'Facial'},
      {'icon': FontAwesomeIcons.palette, 'label': 'Coloring'},
      {'icon': FontAwesomeIcons.hotTub, 'label': 'Spa'},
      {'icon': FontAwesomeIcons.handHoldingWater, 'label': 'Waxing'},
      {'icon': FontAwesomeIcons.airFreshener, 'label': 'Makeup'},
      {'icon': FontAwesomeIcons.comments, 'label': 'Message'},
    ];

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text('Services',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: services.map((service) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => servicedetailpage(),
                    ),
                  );
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.red,
                      child: Icon(service['icon'], color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(service['label']),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward_ios,
                            size: 12, color: Colors.grey),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _offersSection() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text('Get up to 50% off! Book now.',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _locationSection() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        height: 200,
        color: Colors.grey[300],
        child: Center(child: Text('Google Map Placeholder')),
      ),
    );
  }

  Widget _actionButtons() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 15)),
            onPressed: () {},
            child: Center(
                child: Text('Reserve Booking',
                    style: TextStyle(color: Colors.white, fontSize: 18))),
          ),
          SizedBox(height: 10),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15)),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.call, color: Colors.red),
                SizedBox(width: 10),
                Text('Call', style: TextStyle(color: Colors.red, fontSize: 18)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
