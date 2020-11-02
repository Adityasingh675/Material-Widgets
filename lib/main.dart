import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _controller;
  TabController _controller2;
  // int current_step = 0;
  // List<Step> _steps = [
  //   Step(title: Text("First Step"), content: Text("First content"),),
  //   Step(title: Text("Second Step"), content: Text("Second content"),),
  //   Step(title: Text("Third Step"), content: Text("Third content"),),
  // ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _controller2 = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget Showcase"),
        bottom: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.title),
            ),
            Tab(
              icon: Icon(Icons.style),
            ),
            Tab(
              icon: Icon(Icons.account_balance_outlined),
            )
          ],
          controller: _controller2,
        ),
      ),
      body: TabBarView(
        children: [
          NewPage(title: "First"),
          NewPage(title: "Second"),
          NewPage(title: "Third"),
        ],
        controller: _controller2,
      ),
      // bottomNavigationBar: Material(
      //   color: Colors.pinkAccent,
      //   child: TabBar(
      //     tabs: [
      //       Tab(
      //         icon: Icon(Icons.accessibility),
      //       ),
      //       Tab(
      //         icon: Icon(Icons.accessible_rounded),
      //       ),
      //     ],
      //     controller: _controller,
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle),
          backgroundColor: Colors.deepPurple,
          onPressed: () {
          print("This button was pressed");
          }),
      // body: Container(
      //   child: Stepper(steps: _steps,
      //   currentStep: this.current_step,
      //     type: StepperType.vertical,
      //   ),
      // ),
    );
  }
}

// class Content extends StatefulWidget {
//   @override
//   _ContentState createState() => _ContentState();
// }
//
// class _ContentState extends State<Content> {
//   // AlertDialog dialog =
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         child: RaisedButton(
//           child: Text(
//             "Click Here",
//             style: TextStyle(color: Colors.white),
//           ),
//           color: Colors.deepPurple,
//           // onPressed: () => Scaffold.of(context).showSnackBar(
//           //   SnackBar(
//           //     content: Text("Hi There!"),
//           //     duration: Duration(seconds: 3),
//           //   ),
//           onPressed: () => showDialog(context: context, child: AlertDialog(
//             content: Text(
//               "Attention",
//               style: TextStyle(fontSize: 20.0),
//             ),
//             title: Text("Hi"),
//           ),),
//         ),
//       ),
//     );
//   }
// }

class NewPage extends StatelessWidget {
  final String title;
  NewPage({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(title),
      ),
    );
  }
}
