import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
//class SingleChildScrollViewTestRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
//    return new Scaffold(body:Scrollbar(
//      child: SingleChildScrollView(
//        padding: EdgeInsets.all(16.0),
//        child: Center(
//          child: Column(
//            //动态创建一个List<Widget>
//            children: str
//                .split("")
//            //每一个字母都用一个Text显示,字体为原来的两倍
//                .map((c) =>
//                Text(
//                  c,
//                  textScaleFactor: 2,
//                ))
//                .toList(),
//          ),
//        ),
//      ),
//    ));
//  }
//}

//class SingleChildScrollViewTestRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    //下划线widget预定义以供复用。
//    Widget divider1=Divider(color: Colors.blue,);
//    Widget divider2=Divider(color: Colors.green);
//    return new Scaffold(body: ListView.separated(
//      itemCount: 100,
//      //列表项构造器
//      itemBuilder: (BuildContext context, int index) {
//        return ListTile(title: Text("$index"));
//      },
//      //分割器构造器
//      separatorBuilder: (BuildContext context, int index) {
//        return index%2==0?divider1:divider2;
//      },
//    ));
//  }
//}

class  SingleChildScrollViewTestRoute extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<SingleChildScrollViewTestRoute> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body:ListView.separated(
          itemCount: _words.length,
          itemBuilder: (context, index) {
            //如果到了表尾
            if (_words[index] == loadingTag) {
              //不足100条，继续获取数据
              if (_words.length - 1 < 100) {
                //获取数据
                _retrieveData();
                //加载时显示loading
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: CircularProgressIndicator(strokeWidth: 2.0)
                  ),
                );
              } else {
                //已经加载了100条数据，不再获取数据。
                return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                    child: Text("没有更多了", style: TextStyle(color: Colors.grey),)
                );
              }
            }
            //显示单词列表项
            return ListTile(title: Text(_words[index]));
          },
          separatorBuilder: (context, index) => Divider(height: .0),
        ),

    );

  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        //重新构建列表
      });
    });
  }

}