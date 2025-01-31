import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobasheet/src/features/authentification/screens/welcomescreen/welcome_screen.dart';
import 'package:jobasheet/src/features/core/screens/dashboard/documents.dart';
import 'package:jobasheet/src/features/core/screens/dashboard/financials.dart';
import 'package:jobasheet/src/features/core/screens/dashboard/inspections.dart';
import 'package:jobasheet/src/features/core/screens/dashboard/materials.dart';
import 'package:jobasheet/src/features/core/screens/dashboard/projects.dart';
import 'package:jobasheet/src/features/core/screens/dashboard/report.dart';
import 'package:jobasheet/src/features/core/screens/drawer_pages/settingsandsupport.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key, required this.username, required this.email});
  final String username;
  final String email;
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List imgData = [
    "assets/images/documents.png",
    "assets/images/project.png",
    "assets/images/materials.png",
    "assets/images/Finance.png",
    "assets/images/project-manager.png",
    "assets/images/goals.png",
  ];

  List titles = [
    "Notes",
    "Projects",
    "Materials",
    "Financials",
    "Inspections",
    "Reports",
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome ${widget.username}",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                accountName: Text(widget.username),
                accountEmail: Text(widget.email),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.person_2_outlined),
                ),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MaterialUsageTracker()));
              },
              leading: Icon(Icons.document_scanner),
              title: Text(
                "Materials",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CurrentProjects()));
              },
              leading: Icon(Icons.manage_accounts),
              title: Text(
                "Projects",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReportScreen()));
              },
              leading: Icon(Icons.email),
              title: Text(
                "Reports",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsSupportPage(),
                  ),
                );
              },
              leading: Icon(Icons.settings),
              title: Text(
                "Settings and Support",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            ListTile(
              title: GestureDetector(
                child: Text(
                  "Log Out",
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomeScreen(),
                    ),
                  );
                },
              ),
              leading: Icon(Icons.logout_outlined, color: Colors.red),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.1,
                            mainAxisSpacing: 20),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: imgData.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              switch (index) {
                                case 0:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ),
                                  );
                                  break;
                                case 1:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CurrentProjects(),
                                    ),
                                  );
                                  break;
                                case 2:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MaterialUsageTracker(),
                                    ),
                                  );
                                  break;
                                case 3:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                                  break;
                                case 4:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => InspectionForm(),
                                    ),
                                  );
                                  break;
                                case 5:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ReportScreen(),
                                    ),
                                  );
                                  break;
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 6,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(imgData[index], width: 100),
                                  Text(
                                    titles[index],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InspectionForm(),
                ),
              );
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Financials',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: 'Inspections',
          ),
        ],
      ),
    );
  }
}
