import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gift Picker',
      home: HomeScreen(),
    );
  }
}


class Gift {
  final String name;
  final String description;
  final double price;

  Gift({
    required this.name,
    required this.description,
    required this.price,
  });
}


List<Gift> gifts = [
  Gift(
    name: 'بوكس هدية لصديقتي',
    description: 'بوكس يحتوي على عطر وشوكولاتة ورسالة جميلة',
    price: 25,
  ),
  Gift(
    name: 'هدية للأم',
    description: 'عطر فاخر مع ورد تعبيرًا عن الحب',
    price: 40,
  ),
  Gift(
    name: 'هدية لأختي',
    description: 'إكسسوارات أنيقة مع بطاقة لطيفة',
    price: 20,
  ),
  Gift(
    name: 'هدية لطفلة',
    description: 'دبدوب لطيف مع حلوى',
    price: 15,
  ),
];


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],   
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 66, 104, 192),
        title: Text('اختاري هديتك 🎁'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: gifts.length,
          itemBuilder: (context, index) {
            final gift = gifts[index];

            return Card(
              color: Colors.green[300],
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListTile(
                leading: Icon(Icons.card_giftcard, color: Colors.black),
                title: Text(
                  gift.name,
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: Text(
                  '${gift.price} \$',
                  style: TextStyle(color: Colors.black54),
                ),
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(gift: gift),
                    ),
                  );

                  if (result != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.black,
                        content: Text(result),
                      ),
                    );
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}


class DetailsScreen extends StatelessWidget {
  final Gift gift;

  DetailsScreen({required this.gift});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 94, 116, 228),
        title: Text(gift.name),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.card_giftcard, size: 80, color: Colors.pink), 

              Text(
                gift.name,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Text(
                gift.description,
                style: TextStyle(color: Colors.black87),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 10),

              Text(
                '${gift.price} \$',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),

              SizedBox(height: 30),

              ElevatedButton.icon(
                icon: Icon(Icons.check, color: Colors.white),
                label: Text(
                  'تم اختيار الهدية',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                onPressed: () {
                  Navigator.pop(context, 'تم اختيار الهدية بنجاح 🎁');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}