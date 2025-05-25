import 'package:flutter/material.dart';
import 'package:remidii/MyCart.dart';
import 'package:remidii/data_source%20(1).dart';
import 'package:remidii/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 800,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.grey, offset: Offset(5, 5)),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/201',
                      ),
                    ),
                  ),
                  Text("Welcome back, Rama ! \n How Hungry are you"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: Row(
                spacing: 9,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search.......",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red.shade300,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.camera, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Promo",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              height: 100,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: daftarMenuList.length,
                itemBuilder:
                    (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        height: 100,
                        width: 300,
                        decoration: BoxDecoration(
                          color: daftarMenuList[index]['warna'],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gratis ${daftarMenuList[index]['kategori']} !",
                              style: TextStyle(fontSize: 24),
                            ),
                            Text("Untuk pembelian diatas 200 ribu"),
                          ],
                        ),
                      ),
                    ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Kategori",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              height: 100,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: daftarMenuList.length,
                itemBuilder:
                    (context, index) => GestureDetector(
                      onTap: () {
                        tampilkanDaftarMenu(
                          kategori: daftarMenuList[index]['kategori'],
                          menulist: daftarMenuList[index]['menuList'],
                          warna: daftarMenuList[index]['warna'],
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: daftarMenuList[index]['warna'],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                daftarMenuList[index]['kategori'],
                                style: TextStyle(fontSize: 12),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      daftarMenuList[index]['gambar'],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Terlaris",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              height: 70,
              width: double.infinity,
              child: Builder(
                builder: (context) {
                  return ListView.builder(
                    itemBuilder:
                        (context, index) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.red.shade300,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  terlarisList.elementAt(index),
                                  style: TextStyle(fontSize: 21),
                                ),
                              ],
                            ),
                          ),
                        ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void tampilkanDaftarMenu({
    required kategori,
    required List<Map<String, dynamic>> menulist,
    required Color warna,
  }) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(kategori),
            content: Container(
              height: 500,
              width: 300,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: 2 / 3,
                ),
                itemBuilder:
                    (context, index) => Container(
                      decoration: BoxDecoration(
                        color: warna,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FittedBox(child: Text(menulist[index]['namamenu'])),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Detail(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      menulist[index]['gambar'],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(menulist[index]['harga'].toString()),
                            IconButton(
                              onPressed: () {
                                daftarBelanjaList.add({
                                  "namamenu": menulist[index]['namamenu'],
                                  "harga": menulist[index]['harga'],
                                  "gambar": menulist[index]['gambar'],
                                  "jmlitem": 1,
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyCart(),
                                  ),
                                );
                              },
                              icon: Icon(Icons.shopping_cart),
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ),
              ),
            ),
            actions: [
              Center(
                child: Row(
                  children: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Center(child: Text("Close")),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}
