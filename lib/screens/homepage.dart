import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myntra/provider/sorting.dart';
import 'package:myntra/screens/cloths.dart';
import 'package:myntra/screens/filter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    void fire()
    {
      FirebaseFirestore.instance
          .collection('cloths')
          .snapshots().length;
      return fire();
    }
    void _botttomsheet(context) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('SORT BY'),
                  Divider(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Price-high to low',
                        style: TextStyle(color: Colors.black54),
                      )),
                  TextButton(
                      onPressed: () {
                        Provider.of<Sort>(context,listen: false).hightolow();
                      },
                      child: Text(
                        'Price-low to high',
                        style: TextStyle(color: Colors.black54),
                      )),
                  TextButton(
                      onPressed: () {
                        Provider.of<Sort>(context,listen: false).lowtohigh();
                      },
                      child: Text(
                        'Discount',
                        style: TextStyle(color: Colors.black54),
                      )),
                  TextButton(
                      onPressed: () {
                        Provider.of<Sort>(context,listen: false).discount();
                      },
                      child: Text(
                        'Rating',
                        style: TextStyle(color: Colors.black54),
                      ))
                ],
              ),
            );
          });
    }

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 150) / 2;
    final double itemWidth = size.width / 2;

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(textAlign: TextAlign.start,
                  'MEN',
                  style: TextStyle(color: Colors.black),
                ),

              Text('675678 items',textAlign: TextAlign.start,style: TextStyle(color: Colors.black45,fontSize: 11),)],
            ),
            actions: [
              TextButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
              TextButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  )),
              TextButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                  ))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: IconButton(
                      onPressed: () {
                        _botttomsheet(context);
                      },
                      icon: Icon(
                        Icons.arrow_upward,
                      ),
                    ),
                    label: 'sort'),
                BottomNavigationBarItem(
                    icon: IconButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Filter(),));},
                        icon: Icon(Icons.compare_arrows_rounded)),
                    label: 'Filter')
              ],
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.black),
          body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('cloths')
                .limit(6)
                .orderBy('price', descending: false)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: (itemWidth / itemHeight),
                            crossAxisCount: 2),
                        itemCount: snapshot.data?.docs.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 0.5, color: Colors.black12)),
                            child: Column(
                              children: [
                                Stack(children: [
                                  Container(width: itemWidth,
                                    child: Image.network(
                                      snapshot.data?.docs[index]['imageUrl'],fit: BoxFit.fill,
                                      height: 200,
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 1,
                                      child: Container(margin: EdgeInsets.all(10),

                                          decoration: BoxDecoration(
                                              color: Colors.white70,
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: Padding(padding: EdgeInsets.only(left: 5,right: 5),
                                            child: Row(children: [
                                              Container(

                                                  child: Text(
                                                    snapshot.data!.docs[index]['rating'].toString(),
                                                    style: TextStyle(fontSize: 11,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),Container(child: Icon(Icons.star,color: Colors.green,size: 8,),),
                                              Container(

                                                  child: Text(
                                                    '| ${snapshot.data!.docs[index]['popularity'].toString()}',
                                                    style: TextStyle(fontSize: 11,
                                                        color: Colors.black45),
                                                  ))
                                            ]),
                                          )))
                                ]),
                                Container(
                                  margin: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              snapshot.data?.docs[index]
                                                  ['brand'],
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Icon(
                                              Icons.favorite_border,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        snapshot.data?.docs[index]['name'],
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '₹ ${snapshot.data?.docs[index]['price']}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            '₹ ${snapshot.data?.docs[index]['discount']}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            '${snapshot.data?.docs[index]['offer']}% OFF',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromRGBO(
                                                  255, 144, 90, 1),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              ]);
            },
          )),
    );
  }
}
