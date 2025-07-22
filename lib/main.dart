import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double availableScreenWidth = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    availableScreenWidth = MediaQuery.of(context).size.width - 50;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              alignment: Alignment.bottomCenter,
              height: 170,
              decoration: BoxDecoration(color: Colors.blue.shade700),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'File Storage',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'by fege',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.notifications_outlined,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Storage ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: "9.1/10GB",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Upgrade",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  buildFileSizeChart('SOURCES', Colors.blue, .3),
                  buildFileSizeChart('DOCS', Colors.red, .25),
                  buildFileSizeChart('IMAGES', Colors.orangeAccent, .20),
                  buildFileSizeChart('', Colors.grey, .23),
                ],
              ),
            ),
            SizedBox(height: 15),
            Divider(height: 20),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(25),
                children: [
                  Text(
                    'Recently updated',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildFileColumn('desktop', 'main', '.py'),
                      buildFileColumn('desktop', 'pubspec', '.yaml'),
                      buildFileColumn('photo', 'image001', '.jpeg'),
                    ],
                  ),
                  Divider(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Projects',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Create new',
                        style: TextStyle(
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  buildProjectsRow('Chatbox'),
                  buildProjectsRow('TimeNote'),
                  buildProjectsRow('Notion'),
                  buildProjectsRow('Developer'),
                  buildProjectsRow('Documents'),
                  buildProjectsRow('Photos'),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: Container(
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: Colors.blue.shade700,
            onPressed: () {},
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          selectedItemColor: Colors.blueAccent,
          currentIndex: selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              label: 'Time',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Folder'),
          ],
        ),
      ),
    );
  }

  Container buildProjectsRow(String foldername) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.folder, color: Colors.lightBlueAccent),
              SizedBox(width: 12),
              Text(foldername, style: TextStyle(fontSize: 16)),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert_rounded, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Column buildFileColumn(String image, String filename, String extension) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(30),
          height: 110,
          child: Image.asset('assets/images/$image.png'),
        ),
        SizedBox(height: 15),
        RichText(
          text: TextSpan(
            text: filename,
            style: TextStyle(color: Colors.black, fontSize: 14),
            children: [
              TextSpan(
                text: extension,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column buildFileSizeChart(String title, Color color, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: availableScreenWidth * width, height: 4, color: color),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
