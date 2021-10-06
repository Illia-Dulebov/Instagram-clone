import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.white),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Hero(
            tag: "profile-image",
            child: Container(
              width: double.infinity,
              height: 600.0,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/illia.png"),
                ),
              ),
            )));
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  Widget getCenter() {
    return Center(
        child: Hero(tag: '1', child: Image.asset("images/illia.png")));
  }

  Widget getFloatingButton() {
    List<Widget> buttons = [
      FloatingActionButton(
        child: Icon(Icons.navigation),
        backgroundColor: Colors.red,
        onPressed: () {},
      ),
      FloatingActionButton(
        child: Icon(Icons.navigation),
        backgroundColor: Colors.blue,
        onPressed: () {},
      ),
      FloatingActionButton(
        child: Icon(Icons.navigation),
        backgroundColor: Colors.indigo,
        onPressed: () {},
      ),
      FloatingActionButton(
        child: Icon(Icons.navigation),
        backgroundColor: Colors.amber,
        onPressed: () {},
      ),
      FloatingActionButton(
        child: Icon(Icons.navigation),
        backgroundColor: Colors.green,
        onPressed: () {},
      ),
    ];

    return IndexedStack(
      index: currentIndex,
      children: buttons,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Instagram',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {},
              )
            ]),
        floatingActionButton: getFloatingButton(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.black87),
                padding: EdgeInsets.all(65),
                child: Text(
                  "Some menu",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text('Choose 1', style: TextStyle(fontSize: 25)),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Choose 2', style: TextStyle(fontSize: 25)),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      8,
                      (index) => Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ]),
                            padding: EdgeInsets.all(13),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 32,
                                  backgroundImage:
                                      AssetImage("images/story.jfif"),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage("images/illia.png"),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Illia Duliebov",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                )
                              ],
                            ),
                          )),
                ),
              ),
              Divider(),
              Column(
                children: List.generate(
                    8,
                    (index) => Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(12),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage("images/illia.png"),
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                  child: Text("Illia Duliebov",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                )),
                                IconButton(
                                  icon: Icon(Icons.more_horiz),
                                  onPressed: () {},
                                  alignment: Alignment.centerRight,
                                ),
                              ],
                            ),
                            Container(
                                alignment: Alignment.bottomCenter,
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Page2()),
                                      );
                                    },
                                    child: Hero(
                                        tag: "profile-image",
                                        child: Container(
                                          child:
                                              Image.asset("images/illia.png"),
                                        )))),
                            //Image.asset('images/illia.png'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.favorite_border),
                                  onPressed: () {},
                                  alignment: Alignment.centerRight,
                                ),
                                IconButton(
                                  icon: Icon(Icons.chat_bubble),
                                  onPressed: () {},
                                  alignment: Alignment.centerRight,
                                ),
                                IconButton(
                                  icon: Icon(Icons.send),
                                  onPressed: () {},
                                  alignment: Alignment.centerRight,
                                ),
                                Spacer(),
                                IconButton(
                                  icon: Icon(Icons.flag_outlined),
                                  onPressed: () {},
                                  alignment: Alignment.centerRight,
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.all(5))
                          ],
                        )),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: currentIndex,
          onItemSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(color: Colors.black),
                )),
            BottomNavyBarItem(
                icon: Icon(Icons.search, color: Colors.black),
                title: Text(
                  "Search",
                  style: TextStyle(color: Colors.black),
                )),
            BottomNavyBarItem(
                icon: Icon(Icons.add_outlined, color: Colors.black),
                title: Text(
                  "Add",
                  style: TextStyle(color: Colors.black),
                )),
            BottomNavyBarItem(
                icon: Icon(Icons.favorite_border, color: Colors.black),
                title: Text(
                  "Likes",
                  style: TextStyle(color: Colors.black),
                )),
            BottomNavyBarItem(
                icon: Icon(Icons.person, color: Colors.black),
                title: Text(
                  "Profile",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ));
  }
}
