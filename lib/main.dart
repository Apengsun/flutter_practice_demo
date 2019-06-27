import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';

import 'BothDirectionTestRoute.dart';
import 'ConstrainedBoxTest.dart';
import 'CustomPaintRoute.dart';
import 'FileOperationRoute.dart';
import 'FocusTestRoute.dart';
import 'GradientCircularProgressRoute.dart';
import 'HttpTestRoute.dart';
import 'ScaffoldRoute.dart';
import 'ScaleAnimationRoute.dart';
import 'SingleChildScrollViewTestRoute.dart';
import 'CustomScrollViewTestRoute.dart';
import 'StaggerDemo.dart';
import 'ThemeTestRoute.dart';
import 'TurnBoxRoute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      //注册路由表
      routes: {
        "new_page": (context) => NewRoute(),
        "new_page_2": (context) => EchoRoute(),
        "new_page_3": (context) => CounterWidget(),
        "new_page_4": (context) => TapboxA(),
        "FocusTestRoute": (context) => FocusTestRoute(),
        "ConstrainedBoxTest": (context) => ConstrainedBoxTest(),
        "ScaffoldRoute": (context) => ScaffoldRoute(),
        "SingleChildScrollViewTestRoute": (context) =>
            SingleChildScrollViewTestRoute(),
        "CustomScrollViewTestRoute": (context) => CustomScrollViewTestRoute(),
        "WillPopScopeTestRoute": (context) => WillPopScopeTestRoute(),
        "ThemeTestRoute": (context) => ThemeTestRoute(),
        "BothDirectionTestRoute": (context) => BothDirectionTestRoute(),
        "ScaleAnimationRoute": (context) => ScaleAnimationRoute(),
        "StaggerDemo": (context) => StaggerDemo(),
        "TurnBoxRoute": (context) => TurnBoxRoute(),
        "CustomPaintRoute": (context) => CustomPaintRoute(),
        "GradientCircularProgressRoute": (context) =>  GradientCircularProgressRoute(),
        "FileOperationRoute": (context) =>  FileOperationRoute(),
        "HttpTestRoute": (context) =>  HttpTestRoute(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _switchSelected=true; //维护单选开关状态
  bool _checkboxSelected=true;//维护复选框状态

  //定义一个controller
  TextEditingController _unameController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    //监听输入改变
    _unameController.addListener(() {
      print(_unameController.text);
      if (_unameController.text.length > 2)
        _unameController.selection = TextSelection(
            baseOffset: 2, extentOffset: _unameController.text.length);
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
//        child: Column(
            child: Column(
              // Column is also layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                            labelText: "用户名",
                            hintText: "用户名或邮箱",
                            prefixIcon: Icon(Icons.person)),
                        controller: _unameController, //设置controller
                        onChanged: (v) {
                          print("onChange: $v");
                        }),
                    TextField(
                        decoration: InputDecoration(
                            labelText: "密码",
                            hintText: "您的登录密码",
                            prefixIcon: Icon(Icons.lock)),
                        obscureText: true,
                        onChanged: (v) {
                          print("onChange: $v");
                        }),
                  ],
                ),
                RaisedButton(
                  child: Text("FocusTestRoute"),
                  textColor: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pushNamed("FocusTestRoute");
                  },
                ),
                RaisedButton(
                  child: Text("ConstrainedBoxTest"),
                  textColor: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pushNamed("ConstrainedBoxTest");
                  },
                ),
                RaisedButton(
                  child: Text("ScaffoldRoute"),
                  textColor: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pushNamed("ScaffoldRoute");
                  },
                ),
                RaisedButton(
                  child: Text("SingleChildScrollViewTestRoute"),
                  textColor: Colors.blue,
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("SingleChildScrollViewTestRoute");
                  },
                ),
                RaisedButton(
                  child: Text("CustomScrollViewTestRoute"),
                  textColor: Colors.blue,
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("CustomScrollViewTestRoute");
                  },
                ),
                RaisedButton(
                  child: Text("WillPopScopeTestRoute"),
                  textColor: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pushNamed("WillPopScopeTestRoute");
                  },
                ),
                RaisedButton(
                  child: Text("ThemeTestRoute"),
                  textColor: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pushNamed("ThemeTestRoute");
                  },
                ),
                RaisedButton(
                  child: Text("BothDirectionTestRoute"),
                  textColor: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pushNamed("BothDirectionTestRoute");
                  },
                ),
                RaisedButton(
                  child: Text("ScaleAnimationRoute"),
                  textColor: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pushNamed("ScaleAnimationRoute");
                  },
                ),
                RaisedButton(
                  child: Text("ScaleAnimationRoute"),
                  textColor: Colors.blue,
                  onPressed: () {
//                    Navigator.push(context,
//                        CupertinoPageRoute(builder: (context) {
//                      return ScaleAnimationRoute(); //路由B
//                    }));

                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 500),
                            //动画时间为500毫秒
                            pageBuilder: (BuildContext context,
                                Animation animation,
                                Animation secondaryAnimation) {
                              return new FadeTransition(
                                //使用渐隐渐入过渡,
                                opacity: animation,
                                child: CustomScrollViewTestRoute(), //路由B
                              );
                            }));
                  },
                ),
                RaisedButton(
                  child: Text("StaggerDemo"),
                  textColor: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pushNamed("StaggerDemo");
                  },
                ),
                RaisedButton(
                  child: Text("CustomPaintRoute"),
                  textColor: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pushNamed("CustomPaintRoute");
                  },
                ),
                RaisedButton(
                  child: Text("TurnBoxRoute"),
                  textColor: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pushNamed("TurnBoxRoute");
                  },
                ),
                RaisedButton(
                  child: Text("GradientCircularProgressRoute"),
                  textColor: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pushNamed("GradientCircularProgressRoute");
                  },
                ),
                RaisedButton(
                  child: Text("FileOperationRoute"),
                  textColor: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pushNamed("FileOperationRoute");
                  },
                ),
                RaisedButton(
                  child: Text("HttpTestRoute "),
                  textColor: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pushNamed("HttpTestRoute");
                  },
                ),
                WillPopScopeTestRoute(),
//          ListView.builder(
//              itemCount: 100,
//              itemExtent: 50.0, //强制高度为50.0
//              itemBuilder: (BuildContext context, int index) {
//                return ListTile(title: Text("$index"));
//              }
//          ),
          Column(
              children: <Widget>[
                Switch(
                  value: _switchSelected, //当前状态
                  onChanged: (value) {
                    //重新构建页面
                    setState(() {
                      _switchSelected = value;
                    });
                  },
                ),
                Checkbox(
                  value: _checkboxSelected,
                  activeColor: Colors.red, //选中时的颜色
                  onChanged: (value) {
                    setState(() {
                      _checkboxSelected = value;
                    });
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.book,
                  color: Colors.purple,
                ),
                Icon(
                  Icons.backspace,
                  color: Colors.green,
                ),
              ],
            ),
            Icon(
              Icons.accessible,
              color: Colors.amber,
            ),
            Icon(
              Icons.error,
              color: Colors.deepOrange,
            ),
            Icon(
              Icons.fingerprint,
              color: Colors.tealAccent,
            ),
            Text(
              "\uE914" + " \uE000" + " \uE90D",
              style: TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 24.0,
                  color: Colors.green),
            ),
            Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: 100.0,
            ),
            Image(
              image: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              width: 100.0,
              color: Colors.pink,
              colorBlendMode: BlendMode.difference,
            ),
            Text(
              'You have pushed the button this many times:',
//              style: Theme.of(context).textTheme.body1,
//              'You have clicked the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
                FlatButton(
                  child: Text("open new route"),
                  textColor: Colors.blue,
                  onPressed: () {
//                //导航到新路由
//                Navigator.push( context,
//                    new MaterialPageRoute(builder: (context) {
//                      return new NewRoute();
//                    },settings: RouteSettings(),maintainState: false,fullscreenDialog: true));
                    //通过路由名打开新的路由页
                    Navigator.pushNamed(context, "new_page");
//                Navigator.of(context).pushNamed("new_page_2", arguments: "hi");
//                Navigator.of(context).pushNamed("new_page_3");
//                Navigator.of(context).pushNamed("new_page_4");
//                debugDumpApp();
                  },
                ),
                RandomWordsWidget(),
                Echo(text: "hello world"),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//TODO test Route
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute.of(context).settings.arguments;
    //...省略无关代码

    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is echo route " + '$args'),
      ),
    );
  }
}

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}

class Echo extends StatelessWidget {
  const Echo({
    Key key,
    @required this.text,
    this.backgroundColor: Colors.green,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key key, this.initValue: 0});

  final int initValue;

  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    super.initState();
    //初始化状态
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('$_counter'),
          //点击后计数器自增
          onPressed: () => setState(
            () => ++_counter,
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}

// TapboxA 管理自身状态.

//------------------------- TapboxA ----------------------------------

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class MyIcons {
  // book 图标
  static const IconData book =
      const IconData(0xe614, fontFamily: 'myIcon', matchTextDirection: true);

  // 微信图标
  static const IconData wechat =
      const IconData(0xec7d, fontFamily: 'myIcon', matchTextDirection: true);
}

class ListView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(color: Colors.green);
    return ListView.separated(
      itemCount: 100,
      //列表项构造器
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
    );
  }
}

class WillPopScopeTestRoute extends StatefulWidget {
  @override
  WillPopScopeTestRouteState createState() {
    return new WillPopScopeTestRouteState();
  }
}

class WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) >
                  Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        },
        child: Container(
          alignment: Alignment.center,
          child: Text("1秒内连续按两次返回键退出"),
        ));
  }
}
