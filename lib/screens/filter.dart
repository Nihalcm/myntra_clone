import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
class page1 extends StatefulWidget {
  const page1({Key? key}) : super(key: key);

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 00.0,
          ),
          height: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                height: 100, width:
              400,margin: EdgeInsets.all(0.00), child: Image.asset('images/1cover.webp'),),
              Container(
                  height: 200, width: 600, child: Image.asset('images/2cover.jpg')),
              Container(
                  height: 200, width: 600, child: new Image(image: new AssetImage('images/3cover.jpg'),width: 100,height: 100,)),
              Container(
                  height: 200, width: 600, child: Image.asset('images/4.jpg'))
            ],
          ),
        ),
      ],
    ),);
  }
}

class page2 extends StatefulWidget {
  const page2({Key? key}) : super(key: key);

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Column(children: [
        TextButton(onPressed: (){}, child: Text("Home 1")),
        TextButton(onPressed: (){}, child: Text("Home 2")),
        TextButton(onPressed: (){}, child: Text("Home 3")),
        TextButton(onPressed: (){}, child: Text("Home 4")),



      ],),
    ),);
  }
}

class page3 extends StatefulWidget {
  const page3({Key? key}) : super(key: key);

  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(),);
  }
}

class page4 extends StatefulWidget {
  const page4({Key? key}) : super(key: key);

  @override
  State<page4> createState() => _page4State();
}

class _page4State extends State<page4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('page4'),);
  }
}



class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  PageController page = PageController();
  bool valueS=false;
  bool valueM=false;
  bool valueL=false;
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filter",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "CLEAR ALL",
                style: TextStyle(color: Colors.black),
              )),
        ],
      ),
      body: Row(
        children: [
          SizedBox(
            width: 200,
            child: SideMenu(
              controller: page,
              items: [
                SideMenuItem(
                    priority: 0,
                    title: 'Size',
                    icon: Icon(
                      Icons.price_change_outlined,
                    ),
                    onTap:(){ page.jumpToPage(0);}
                ),
                SideMenuItem(
                  priority: 1,
                  onTap: (){page.jumpToPage(1);},
                  title: 'Brand',
                  icon: Icon(Icons.branding_watermark),
                ),
                SideMenuItem(
                  priority: 2,
                  onTap: (){page.jumpToPage(2);},
                  title: 'Price Range',
                  icon: Icon(Icons.format_size_outlined),
                ),
                SideMenuItem(
                  onTap: (){page.jumpToPage(3);},
                  priority: 3,
                  title: 'Discount',
                  icon: Icon(Icons.discount),
                )
              ],
            ),
          ),
          Expanded(child: PageView(controller: page,
            children: [
              Container(color: Colors.white,
                child: Column(children: [
                  CheckboxListTile(title: Text('Select All(38)',style: TextStyle(fontSize: 10,fontWeight:FontWeight.bold ),),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: valueL,
                      checkColor: Colors.white
                      ,activeColor: Colors.red,
                      onChanged: (bool? value1){
                        setState((){
                          valueL=value1!;
                        });
                      }),
                  CheckboxListTile(title: Text('S',style: TextStyle(fontSize: 10,fontWeight:FontWeight.bold,color: Colors.black ),),
                      controlAffinity: ListTileControlAffinity.leading,

                      value: valueS,
                      selected: true,
                      side: MaterialStateBorderSide.resolveWith((states) => BorderSide(color: Colors.white)),
                      checkColor: Colors.red
                      ,activeColor: Colors.white,
                      onChanged: (bool? value1){
                        setState((){
                          valueS=value1!;
                        });
                      }),
                  CheckboxListTile(title: Text('M',style: TextStyle(fontSize: 10,fontWeight:FontWeight.bold ),),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: valueM,
                      checkColor: Colors.white
                      ,activeColor: Colors.red,
                      onChanged: (bool? value1){
                        setState((){
                          valueM=value1!;
                        });
                      }),
                  CheckboxListTile(title: Text('L',style: TextStyle(fontSize: 10,fontWeight:FontWeight.bold ),),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: valueL,
                      checkColor: Colors.white
                      ,activeColor: Colors.red,
                      onChanged: (bool? value1){
                        setState((){
                          valueL=value1!;
                        });
                      })
                ],),
              ),
              Container(color: Colors.white,
                child: Text("Brand_ok"),),
              Container(color: Colors.white,
                child: Text("Price_range"),),
              Container(color: Colors.white,
                child: Text("Discount_ok"),),
            ],)
          )
        ],
      ),
      bottomNavigationBar:  Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    page1;
                  });
                },
                icon: const Icon(Icons.home)),
            IconButton(
                onPressed: () {
                  setState(() {
                    page2();
                  });
                },
                icon: const Icon(Icons.settings)),
            IconButton(
                onPressed: () {
                  setState(() {
                    page3();
                  });
                },
                icon: const Icon(Icons.person)),
            IconButton(
                onPressed: () {
                  setState(() {
                    page4();
                  });
                },
                icon: const Icon(Icons.map))
          ],
        ),
      ),
    );
  }
}




