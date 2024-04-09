import 'package:flutter/material.dart';
import 'package:supplink/Authentication/authRoutes/AppRoutes.dart';
import 'package:supplink/Home/desktop_Body.dart';
import 'package:supplink/Home/drawer_pages/LanePages/laneview.dart';

class ContractView extends StatefulWidget {
  const ContractView({super.key});
  @override
  State<ContractView> createState() => _ContractViewState();
}

class _ContractViewState extends State<ContractView> {
  // DesktopBodyState desk = DesktopBodyState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contracts'),
        automaticallyImplyLeading: false,
      ),
      drawer: Drawer(),
      body: LaneAndContractAndDashView(),
    );
  }
}

class LaneAndContractAndDashView extends StatelessWidget {
  const LaneAndContractAndDashView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 500,
            // color: Colors.green,
            child: Row(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: 300,
                        color: Colors.white,
                        child: Card(
                          // elevation: 5,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 30),
                                height: 300,
                                width: 250,
                                // color: Colors.amberAccent,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    // color: Colors.blue,
                                    border: Border.all(
                                        color: Colors.black, width: 3)),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                height: 35,
                                width: 150,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Create Lane',
                                      style: TextStyle(fontSize: 20),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            String companyName = 'Company_Name: ${index + 1}';
                            String LaneID = 'Lane ID:${index + 1}';
                            String members = 'No.Of.Chain Members:4';
                            String onGoing = 'OnGoing Chain:';
                            return Container(
                                height: 170,
                                child: Card(
                                  // color: Colors.green,
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          padding:
                                              EdgeInsets.symmetric(vertical: 8),
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          child: Center(
                                            child: Text(
                                              companyName,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Column(
                                            //   crossAxisAlignment:
                                            //       CrossAxisAlignment.start,
                                            //   children: [
                                            //     Text(
                                            //       LaneID,
                                            //       style: TextStyle(
                                            //         fontSize: 16,
                                            //       ),
                                            //     ),
                                            //     Text(
                                            //       members,
                                            //       style:
                                            //           TextStyle(fontSize: 16),
                                            //     ),
                                            //     Text(
                                            //       onGoing,
                                            //       style: TextStyle(
                                            //         fontSize: 16,
                                            //       ),
                                            //     ),
                                            //   ],
                                            // ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 100,
                                                    // width: 200,
                                                    child: ListView(
                                                      children: [
                                                        ListTile(
                                                          title: Text(LaneID),
                                                        ),
                                                        ListTile(
                                                          title: Text(members),
                                                        ),
                                                        ListTile(
                                                          title: Text(onGoing),
                                                        ),
                                                      ],
                                                    ),
                                                    // color: Colors.amber,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 100,
                                                    // width: 200,
                                                    child: ListView(
                                                      children: [
                                                        ListTile(
                                                          title: Text(
                                                              'On-Going Contracts : ${9}'),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              'Completed Contracts : ${9}'),
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                              'Total Contracts : ${9}'),
                                                        ),
                                                      ],
                                                    ),
                                                    // color: Colors.amber,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 35, right: 90),
                                              height: 40,
                                              width: 120,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushNamed(AppRoutes
                                                            .LaneViewRoute);
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 10,
                                                    shadowColor: Colors.blue,
                                                  ),
                                                  child: Text(
                                                    "view lane",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                  )),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              // color: Colors.blueGrey,
              width: double.infinity,
              height: 400,
              child: Card(
                elevation: 10,
              ))
        ],
      ),
    );
  }
}
