import 'dart:developer';

import 'package:chat_websocket/package/websocket_service.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

List<Map<String, String>> messages = [];
TextEditingController msgcontroller = TextEditingController();


  @override
  void dispose() {
  WebsocketService().channel.sink.close();
    // TODO: implement dispose
    
    
  }

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 45,
          backgroundColor: const Color.fromARGB(255, 35, 46, 109),
        ),
        backgroundColor: Colors.indigo,
        body: Column(children: [
          Expanded(
            child: Row(
              children: [
                StreamBuilder(
             
                  stream: WebsocketService.instance.channel.stream,
                  builder: (context, snapShot) {
                    if (snapShot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 200),
                        child: Center(
                            child: SizedBox(
                                width: 50, child: CircularProgressIndicator())),
                      );
                    }
                    if (snapShot.hasError) {
                      return Center(child: Text("Somenthing went wrong"));
                    }
                    // log('${snapShot.data}',name: "data");
                    if (snapShot.hasData) {
                      messages.add(
                          {"user": snapShot.data, "server": snapShot.data});
                    }

                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Column(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 15, right: 5),
                                  child: Container(
                                    constraints: BoxConstraints(maxHeight: 400),
                                    decoration: BoxDecoration(
                                        color:
                                            Colors.indigo.shade100,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                            bottomLeft: Radius.circular(12))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(messages[index]["user"]!,
                                          overflow: TextOverflow.visible),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 15, left: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Colors.indigo.shade900,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                            bottomRight: Radius.circular(12))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(messages[index]["server"]!,
                                          style: TextStyle(color: Colors.white),
                                          overflow: TextOverflow.visible),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          );
                        },
                        itemCount: messages.length,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 2, right: 2),
            child: TextField(
              controller: msgcontroller,
              decoration: InputDecoration(
                  hintText: " Message",
                  suffixIcon: IconButton(
                      onPressed: () {
                        if (msgcontroller.text.isNotEmpty) {
                          final message = msgcontroller.text.trim();

                          // sending message
                          WebsocketService.instance.channel.sink.add(message);
                          msgcontroller.clear();
                        }
                      },
                      icon: Icon(Icons.send)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.indigo.shade100),
            ),
          ),
        ]));
  }
}
