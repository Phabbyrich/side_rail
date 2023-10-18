import 'package:flutter/material.dart';

import 'package:side_rail/side_rail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Side Rail',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TestPage(),
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int _selectedIndex = 0;
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideRail(
            isExpanded: !isExpanded,
            selectedIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            expandedWidth: 300,
            backgroundColor: Colors.white,
            unselectedColor: Colors.black,
            tileActiveColor: Colors.cyan.shade900,
            logoPadding: 20,
            margin: const EdgeInsets.all(10),
            logo: Image.asset(
              "assets/images/yarisanewlogo.png",
              height: 30,
            ),
            footer: Visibility(
              visible: !isExpanded,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(.2),
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Text("Upgrade to Pro")),
                    const SizedBox(height: 15),
                    Text(
                      "Upgrade to PRO version for more features.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.grey, fontSize: 11),
                    )
                  ],
                ),
              ),
            ),
            navItems: const [
              NavDestinationItem(
                  isSectionHeader: false,
                  radius: 20,
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                  ),
                  icon: Icon(Icons.home),
                  title: Text("Dashboard")),
              NavDestinationItem(
                  isSectionHeader: false,
                  radius: 20,
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                  ),
                  icon: Icon(Icons.payment),
                  title: Text("Transaction")),
              NavDestinationItem(
                  isSectionHeader: false,
                  radius: 20,
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                  ),
                  icon: Icon(Icons.credit_card),
                  title: Text("Card Payments")),
              NavDestinationItem(
                  isSectionHeader: false,
                  radius: 20,
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                  ),
                  icon: Icon(Icons.folder),
                  title: Text("Documents")),
              NavDestinationItem(
                  isSectionHeader: true,
                  icon: Icon(Icons.report),
                  title: Text("Reports")),
              NavDestinationItem(
                  isSectionHeader: false,
                  radius: 20,
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                  ),
                  icon: Icon(Icons.stacked_line_chart),
                  title: Text("Management Reports")),
              NavDestinationItem(
                  isSectionHeader: false,
                  radius: 20,
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                  ),
                  icon: Icon(Icons.stacked_bar_chart),
                  title: Text("Financial Reports")),
              NavDestinationItem(
                  isSectionHeader: true,
                  icon: Icon(Icons.settings),
                  title: Text("Settings")),
              NavDestinationItem(
                  isSectionHeader: false,
                  radius: 20,
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                  ),
                  icon: Icon(Icons.brush),
                  title: Text("Clear Cache")),
              NavDestinationItem(
                  isSectionHeader: false,
                  radius: 20,
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                  ),
                  icon: Icon(Icons.settings),
                  title: Text("Preferences")),
              NavDestinationItem(
                  isSectionHeader: false,
                  radius: 20,
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                  ),
                  icon: Icon(Icons.admin_panel_settings),
                  title: Text("Admin Settings")),
            ],
          ),
          Expanded(
              child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.grey.shade100,
                    child: Center(
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            child: const Icon(Icons.ac_unit))),
                  ),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}
