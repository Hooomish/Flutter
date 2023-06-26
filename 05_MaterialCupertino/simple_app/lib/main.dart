import 'package:flutter/material.dart';

class TabItem {
  String title;
  Icon icon;
  TabItem({required this.title, required this.icon});
}

final List<TabItem> _tabBar = [
  TabItem(title: "Home", icon: Icon(Icons.home)),
  TabItem(title: "Chat", icon: Icon(Icons.chat)),
  TabItem(title: "Albums", icon: Icon(Icons.album))
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);
    _tabController.addListener(() {
      print('Listener: ${_tabController.index}');
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          Builder(builder: (context) =>
              IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: Icon(Icons.person_pin)
              )
          )
        ],
      ),

      drawer: Drawer(
        child: Container(
          child: Column(
            children: [
              DrawerHeader(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.green,
                    backgroundImage: NetworkImage("https://loremflickr.com/320/240" ),
                  )
              ),
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Text("Profile"),
                leading: Icon(Icons.perm_contact_cal_outlined),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Text("Images"),
                leading: Icon(Icons.image),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            child: Text("Выход", style: TextStyle(color: Colors.black)),
                            onPressed:(){},
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.white54),
                          ),
                          ElevatedButton(
                            child: Text("Регистрация", style: TextStyle(color: Colors.black)),
                            onPressed:(){},
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.white54)
                          )
                        ]
                    ),
                  )
              )
            ],
          ),
        )
      ),

      endDrawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.green,
              backgroundImage: NetworkImage("https://loremflickr.com/320/240" ),
            ),
            Text('Username')
          ]
        )
      ),

      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text('Home')),
          Center(child: Text('Chat')),
          Center(child: Text('Albums'))
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _tabController.index = index;
              _currentTabIndex = index;
            });
          },
          currentIndex: _currentTabIndex,
          items: [
            for (final item in _tabBar)
              BottomNavigationBarItem(icon: item.icon, label: item.title)
          ],
        )
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        child: Row(
                          children: [
                            Expanded(child: Icon(Icons.credit_card), flex: 1),
                            Expanded(child: Text('Сумма'), flex: 5),
                            Expanded(child: Text('200 руб'), flex: 1)
                          ],
                        ),
                      ),
                      ElevatedButton(
                          onPressed: (){},
                          child: Text('Оплатить', style: TextStyle(color: Colors.black)),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.white54)
                      )
                    ],
                  ),
                );
              },
            );
          }
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
