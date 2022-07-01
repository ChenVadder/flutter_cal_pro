import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  const HYHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("上导航栏"),
      ),
      body: const ScaffoldRoute(),
    );
  }
}

class ScaffoldRoute extends StatefulWidget {
  const ScaffoldRoute({Key? key}) : super(key: key);

  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const AnimatedSwitcherCounterRoute(),
        ],
      ),
      appBar: AppBar(
        title: const Text("Flutter_calculator_Pro"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HYHomePage(),
                  //点击后弹出新的页面
                ),
              );
            },
          ),
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
        ],
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '下导航栏选项1'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: '下导航栏选项2'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: '下导航栏选项3'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton:
          FloatingActionButton(child: const Icon(Icons.add), onPressed: _onAdd),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(),
                  ),
                  const Text(
                    "菜单",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Oh!I am so sorry.'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('There is nothing to eat.'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedSwitcherCounterRoute extends StatefulWidget {
  const AnimatedSwitcherCounterRoute({Key? key}) : super(key: key);

  @override
  _AnimatedSwitcherCounterRouteState createState() =>
      _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState
    extends State<AnimatedSwitcherCounterRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(child: child, scale: animation);
            },
            child: Text(
              '$_count',
              //不同的key才能执行动画
              key: ValueKey<int>(_count),
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          ElevatedButton(
            child: const Text(
              '+1',
            ),
            onPressed: () {
              setState(() {
                _count += 1;
              });
            },
          ),
          ElevatedButton(
            child: const Text(
              '-1',
            ),
            onPressed: () {
              setState(() {
                _count -= 1;
              });
            },
          ),
        ],
      ),
    );
  }
}
