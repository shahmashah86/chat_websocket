import 'dart:async';
import 'dart:math' as math;

import 'package:chat_websocket/presentation/screen/homescreen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  // @override
  // void initState() {
  //   super.initState();
  //   // Initialize the animation controller
  //   controller = AnimationController(
  //     duration: const Duration(seconds: 2),
  //     vsync: this,
  //   )..repeat();
  //   Timer(Duration(seconds: 3), controller.stop); // Repeat the animation indefinitely
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 24, 95),
      body: Column(children: [
        SizedBox(
          height: 100,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: RotationTransition(
              turns: AlwaysStoppedAnimation(15 / 360),
              child: Text("✉️",
                  style: TextStyle(color:  Colors.indigo.shade100,
                    fontSize: 40,
                  ))),
        ),
        SizedBox(
          height: 30,
        ),
        Transform.rotate(
            angle: -1 / 8,
            child: Stack(clipBehavior: Clip.none, children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Colors.white),
                height: 70,
                width: MediaQuery.sizeOf(context).width * 0.56,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2, top: 3),
                child: Container(
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage('C:/FLUTTER/networking/chat_websocket/assets/persondp2.jpg'),fit: BoxFit.cover),
                      color: Colors.yellow,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(20))),
                  height: 62,
                  width: 49,
                ),
              ),
              Positioned(
                left: 68,
                top: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Danial Garcia",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Text("Hi Guyzz!"),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                bottom: -10,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.blueAccent.shade100),
                    height: 27,
                    width: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "❤️",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text("4")
                      ],
                    )),
              )
            ])),
        SizedBox(
          height: 20,
        ),
        RotationTransition(
            turns: AlwaysStoppedAnimation(3 / 360),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: const Color.fromARGB(255, 255, 236, 230)),
              height: 70,
              width: MediaQuery.sizeOf(context).width * 0.65,
              child: Row(
                spacing: 15,
                children: [
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Amelia joicy",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text("Let's meet guys, have fun?")
                    ],
                  ),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    margin: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'C:/FLUTTER/networking/chat_websocket/assets/dp12.jpg'),
                            fit: BoxFit.cover),
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(20))),
                    width: 49,
                    height: 62,
                  )
                ],
              ),
            )),
        SizedBox(
          height: 20,
        ),
        Stack(clipBehavior: Clip.none, children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Colors.white,
            ),
            height: 70,
            width: MediaQuery.sizeOf(context).width * 0.54,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 2),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'C:/FLUTTER/networking/chat_websocket/assets/dp2.jpg',
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(12)),
                        color: Colors.yellow),
                    height: 62,
                    width: 50,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Eric Ison",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text("What's up ?")
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: -10,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.blueAccent.shade100),
                height: 27,
                width: 46,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "🤩",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text("1")
                  ],
                )),
          )
        ]),
        SizedBox(
          height: 30,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: RotationTransition(
              turns: AlwaysStoppedAnimation(-10 / 360),
              child: Text("💬", style: TextStyle(fontSize: 40))),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.02,
        ),
        Text(
          textAlign: TextAlign.center,
          "Chatting,\nMade Simple.",
          style: TextStyle(
              fontSize: 45, color: Colors.white, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.14),
        Align(
            alignment: Alignment.bottomRight,
            child: Container(
              child: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return Homescreen();
                  }));
                },
                icon: Icon(Icons.arrow_forward),
                color: Colors.white,
              ),
            ))
      ]),
    );
  }
}
