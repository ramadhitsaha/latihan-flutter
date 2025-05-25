import 'package:flutter/material.dart';
import 'package:remidii/data_source%20(1).dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("keranjang belanja")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: daftarBelanjaList.length,
              itemBuilder:
                  (context, index) => Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              daftarBelanjaList[index]['gambar'],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(daftarBelanjaList[index]['namamenu']),
                            Text(daftarBelanjaList[index]['harga'].toString()),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            daftarBelanjaList[index]['jmlitem']--;
                          });
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Text(daftarBelanjaList[index]['jmlitem'].toString()),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            daftarBelanjaList[index]['jmlitem']++;
                          });
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.red.shade400,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Bayar ${totalHarga()}",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  totalHarga() {
    double total = 0;
    for (var i = 0; i < daftarBelanjaList.length; i++) {
      total += daftarBelanjaList[i]['harga'] * daftarBelanjaList[i]['jmlitem'];
    }
    return total;
  }
}
