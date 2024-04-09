import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:supplink/Home/drawer_pages/LanePages/contractViews.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:supplink/Home/drawer_pages/LanePages/createcontract.dart';

class LaneWorks extends StatefulWidget {
  const LaneWorks({super.key});

  @override
  State<LaneWorks> createState() => _LaneWorksState();
}

class _LaneWorksState extends State<LaneWorks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LaneWorks'),
          automaticallyImplyLeading: false,
          // leadingWidth: 45,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [LaneListView(), LaneListView()],
        )));
  }
}

class LaneSerachBox extends StatefulWidget {
  const LaneSerachBox({super.key});

  @override
  State<LaneSerachBox> createState() => _LaneSerachBoxState();
}

class _LaneSerachBoxState extends State<LaneSerachBox> {
  List<String> countriesList = [
    'Pakistan',
    'Afghanistan',
    'America',
    'China',
    'Indonesia'
  ];
  String itemSelected = '';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 700,
      child: DropdownSearch<String>(
        items: countriesList,
        popupProps: PopupProps.menu(
          showSearchBox: true,
        ),
        dropdownButtonProps: DropdownButtonProps(
          color: Colors.blue,
        ),
        dropdownDecoratorProps: DropDownDecoratorProps(
          textAlignVertical: TextAlignVertical.center,
          dropdownSearchDecoration: InputDecoration(
              labelText: "Search",
              hintText: "country in menu mode",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              )),
        ),
        onChanged: (value) {
          setState(() {
            itemSelected = value.toString();
          });
        },
        selectedItem: itemSelected,
      ),
    );
  }
}

class LaneListView extends StatefulWidget {
  const LaneListView({super.key});

  @override
  State<LaneListView> createState() => _LaneListViewState();
}

class _LaneListViewState extends State<LaneListView> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Divider(),
        Container(
          height: 50,
          child: Row(
            children: [
              LaneSerachBox(),
              Spacer(),
              Container(
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   CupertinoPageRoute(
                    //       builder: (context) => CreateColloboration(),
                          
                    //     ),
                    // );


                                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateColloboration()),
              );
                  },
                  child: Text('Create Contract'),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 300,
          child: Container(
            color: Color.fromARGB(221, 223, 225, 242),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) => SizedBox(
                width: 400,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ContractView(),
                      ),
                    );
                  },
                  child: Card(
                    child: MemberCompanyDetails(),
                  ),
                ),
              ),
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}

class MemberCompanyDetails extends StatelessWidget {
  MemberCompanyDetails({super.key});

  final Map<String, double> sampleData = {
    "Flutter": 30,
    "React": 30,
    "Xamarin": 45,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: FlutterLogo(),
          title: Text('One-line with leading widget'),
        ),
        Divider(),
        Container(
          height: 155,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 155,
                      child: ListView(
                        children: [
                          ListTile(
                            title: Text('On-Going Contracts : ${9}'),
                          ),
                          ListTile(
                            title: Text('Completed Contracts : ${9}'),
                          ),
                          ListTile(
                            title: Text('Total Contracts : ${9}'),
                          ),
                        ],
                      ),
                      // color: Colors.amber,
                    ),
                  ],
                ),
              ),

              Container(
                height: 150,
                child: AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      animationDuration: Duration(milliseconds: 6000),
                      dataMap: sampleData,
                      legendOptions: LegendOptions(showLegends: false),
                      chartValuesOptions: ChartValuesOptions(
                        showChartValuesOutside: false,
                      ),
                      // other properties...
                    )),
              ), //TODO Correct the alignment of pie chart
            ],
          ),
        ),
        Expanded(
            child: Container(
                // color:Colors.orange.shade50,
                child: Column(children: [
          Card(
            child: LinearPercentIndicator(
              animation: true,
              lineHeight: 20.0,
              animationDuration: 6000,
              percent: 0.9,
              center: Text("Lane Success Rate - 90.0%"),
              // linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.purple.shade300,
            ),
          ),
          SizedBox(height: 10),
          LinearPercentIndicator(
            animation: true,
            lineHeight: 20.0,
            animationDuration: 6000,
            percent: 0.9,
            center: Text("Your Contribution - 90.0%"),
            // linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.red.shade300,
          ),
        ])))
      ],
    );
  }
}



// class ContractView extends StatefulWidget {
//   const ContractView({super.key});

//   @override
//   State<ContractView> createState() => _ContractViewState();
// }

// class _ContractViewState extends State<ContractView> {
//   @override
//   Widget build(BuildContext context) {
//     return Column();
//   }
// }
