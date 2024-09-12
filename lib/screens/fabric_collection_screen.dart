import 'package:flutter/material.dart';

class FabricCollectionScreen extends StatefulWidget {
  const FabricCollectionScreen({super.key});

  @override
  State<FabricCollectionScreen> createState() => _FabricCollectionScreenState();
}

class _FabricCollectionScreenState extends State<FabricCollectionScreen> {
  final List<Map<String, String>> fabrics = [
    {"name": "Cambaya Fabric", "price": "\$20.00", "image": "assets/images/fabric_cambaya.jpg"},
    {"name": "Printed Fabric", "price": "\$10.17", "image": "assets/images/fabric_floral.jpg"},
    {"name": "Cotton Fabric", "price": "\$18.00", "image": "assets/images/fabric_cotton.jpg"},
    {"name": "Chiffon Fabric", "price": "\$10.17", "image": "assets/images/fabric_yarn.jpg"},
    {"name": "Viscose Fabric", "price": "\$18.00", "image": "assets/images/fabric_silk.jpg"},
    {"name": "Polyester Fabric", "price": "\$10.17", "image": "assets/images/fabric_jute.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return buildUI();
  }

  Widget buildUI() {
    return Scaffold(
      appBar: AppBar(title: Text("Fabric Collection"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: fabrics.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                      child: Image.asset(
                        fabrics[index]["image"]!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(fabrics[index]["name"]!, style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 5),
                          Text(fabrics[index]["price"]!, style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
