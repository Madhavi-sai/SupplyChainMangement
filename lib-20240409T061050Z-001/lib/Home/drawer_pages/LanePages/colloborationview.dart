import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ColloborativeCreation extends StatefulWidget {
  const ColloborativeCreation({super.key});

  @override
  State<ColloborativeCreation> createState() => _ColloborativeCreationState();
}

class _ColloborativeCreationState extends State<ColloborativeCreation> {
  List<String> domainList = ['Farmer', 'Manufacture', 'Retailer', 'Supplier'];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double listViewWidth = (screenWidth / 5);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: screenWidth,
        child: ListView.separated(
          itemCount: domainList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: listViewWidth,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: listViewWidth,
                    color: Colors.green,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(domainList[index]),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.more_horiz),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  domainList.insert(
                                      index + 1, 'New Designation');
                                });
                              },
                              child: Text('Add'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Container(
                  //   // color: Colors.black,
                  //   height: 570,
                  Expanded(
                    child: ListView.separated(
                        itemCount: 10,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          if (index < 9)
                            return Container(
                              height: 100,
                              color: Color.fromARGB(255, 220, 218, 218),
                            );
                          else {
                            return Container(
                              height: 100,
                              color: Color.fromARGB(255, 220, 218, 218),
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {}, icon: Icon(Icons.add)),
                                ],
                              ),
                            );
                          }
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10);
                        },
                      ),
                  ),
                  // ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: 10);
          },
        ),
      ),
    );
  }
}
