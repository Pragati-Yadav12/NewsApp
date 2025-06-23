//
// import 'dart:convert';
// import 'dart:ui';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:project_is_it/NewsView.dart';
// import 'package:project_is_it/model.dart';
// import 'package:project_is_it/category.dart' as custom_category;
//
// class Home extends StatefulWidget {
//   const Home({super.key});
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   var isloading = true;
//   TextEditingController searchController=new TextEditingController();
//   List<NewsQueryModel> newsModellist =<NewsQueryModel>[];
//   List<String> navBarItem=[
//     "Sports",
//     "Nation",
//     "World",
//     "Business",
//     "Health",
//     "Technology",
//     "Science",
//     "Entertainment"
//   ];
//   // final List items=[Colors.deepPurple,Colors.orange,Colors.pink,Colors.yellow];
//   // bool isloading=true;
//   // getNewsQuery(String query) async{
//   //   // String url="https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f1f7ef19de8a430fa92f195b66bb0bf0";
//   //   String url="https://gnews.io/api/v4/top-headlines?country=in&category=general&apikey=4083d745343724d22a06f387a84c3745";
//   //   print(newsModellist);
//   //   // Response naam ki class bnayenge jha data get krenge
//   //   Response response=await get(Uri.parse(url));
//   //   Map data =jsonDecode(response.body);
//   //   print(response.body);
//   //   setState(() {
//   //     data["totalArticles"].forEach((element){
//   //       NewsQueryModel newsQueryModel=new NewsQueryModel();
//   //       // yha elemnet ko fromMap mai pass krdenge or model mai return krdega
//   //       newsQueryModel =NewsQueryModel.fromMap(element);
//   //       // jo upar create kiya tha usme add krdiya
//   //       newsModellist.add(newsQueryModel);
//   //       setState(() {
//   //         isloading = false;
//   //       });
//   //     });
//   //   });
//   // }
//   getNewsQuery(String query) async {
//     String url = "https://gnews.io/api/v4/top-headlines?country=in&category=World&apikey=4083d745343724d22a06f387a84c3745";
//     try {
//       Response response = await get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         Map data = jsonDecode(response.body);
//         print(response.body);
//         setState(() {
//           // Clear previous news
//           newsModellist.clear();
//
//           // Check if the data["articles"] exists and is a list
//           if (data.containsKey("articles") && data["articles"] is List) {
//             // Iterate over "articles" which is a list of maps
//             data["articles"].forEach((element) {
//               // Create a NewsQueryModel from each element (which is a map)
//               NewsQueryModel newsQueryModel = NewsQueryModel.fromMap(element);
//               // Add it to the list
//               newsModellist.add(newsQueryModel);
//             });
//           }
//
//           // Set loading to false after data is fetched
//          var isloading = true;
//         });
//       } else {
//         throw Exception('Failed to load news');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//   @override
//   void initState() {
//     getNewsQuery("india");
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: SafeArea(
//                 child: SizedBox(
//                   height: 50,
//                   child: TextField(
//                     keyboardType: TextInputType.text,
//                     decoration: InputDecoration(
//                       suffixIcon: Icon(Icons.search,color: Colors.black,),
//                       hintText: "Search News...",
//                       hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(60)),
//                       )
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             ListView.builder(
//               itemCount: navBarItem.length,
//               physics: NeverScrollableScrollPhysics(),
//               scrollDirection: Axis.horizontal,
//               shrinkWrap: true,
//               itemBuilder: (context, index) {
//               return SizedBox(
//                 height: 50,
//                 child: Container(
//                   width:double.infinity,
//                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),  // Added padding for better spacing
//                   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),  // Added margin to gi
//                   child: Center(child: Text(navBarItem[index],style: TextStyle(color: Colors.white),)),
//                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.red, ),
//                 ),
//               );
//             },
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 15),
//               child:Column(
//                 children: [
//                    isloading ? CircularProgressIndicator(color: Colors.red,): CarouselSlider(
//                       options:CarouselOptions(
//                           height: 200,
//                         autoPlay: true,
//                         enableInfiniteScroll: false,
//                         enlargeCenterPage: true
//                       ),
//                       items: newsModellist.map((instance){
//                     return Builder(builder: (BuildContext context){
//                       return Container(
//                          width: MediaQuery.of(context).size.width,
//                         // margin: EdgeInsets.symmetric(horizontal: 5,vertical: 7),
//                         child:ClipRRect(
//                           borderRadius: BorderRadius.circular(15),
//                           child: SizedBox(
//                             height: 200,
//                             width: double.infinity,
//                             child: Image.network(
//                               instance.newsImg,
//                               // newsModellist[index].newsImg,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         // ClipRRect(
//                         //   borderRadius: BorderRadius.all(Radius.circular(15)),
//                         //     child: Image.network(
//                         //       instance.newsImg,fit: BoxFit.cover,)),
//                       );
//                     }
//                     );
//                   }).toList()
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10.0),
//                   child: Text("Latest News...",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize:28)),
//                 ),
//               ],
//             ),
//             isloading ? CircularProgressIndicator() :
//             InkWell(
//               onTap: (){
//                 // Navigator.push(context,MaterialPageRoute(builder: (context) =>,));
//               },
//               child: Container(
//                 child: ListView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: newsModellist.length,
//                   itemBuilder: (context, index) {
//                   return Container(
//                     margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
//                     child: Card(
//                       elevation: 1.0,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: Stack(
//                         children: [
//                           ClipRRect(
//                                borderRadius :BorderRadius.circular(15),
//                               child: Image.network(newsModellist[index].newsImg,fit: BoxFit.cover,)),
//                           Positioned(
//                             left: 0,
//                               right: 0,
//                               bottom: 0,
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15),
//                                   gradient: LinearGradient(
//                                     colors: [
//                                       Colors.black12.withOpacity(0),
//                                        Colors.black
//                                     ],
//                                     begin: Alignment.topCenter,
//                                     end: Alignment.bottomCenter
//                                   ),
//                                 ),
//                                 padding: EdgeInsets.fromLTRB(10, 15, 10, 8),
//                                   child: Column(
//                                     children: [
//                                       Text(newsModellist[index].newsHead,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//                                       Text(newsModellist[index].newsDes.length<10?"${newsModellist[index].newsDes.substring(0,15)}...":newsModellist[index].newsDes,style: TextStyle(color: Color(0xffE4080A),fontWeight: FontWeight.w500),),
//
//                                     ],
//                                   ),
//                               ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },),
//               ),
//             ),
//             SizedBox(
//               width: 300,
//               child: ElevatedButton(onPressed: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => custom_category.Category(Query:"World",),));
//               },style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
//                   child:Text("More",style: TextStyle(color: Colors.white,fontSize: 18),)),
//             ),
//       ],
//     ),
//       ),
//     );
//
//   }
// }
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project_is_it/NewsView.dart';
import 'package:project_is_it/model.dart';
import 'package:project_is_it/category.dart' as custom_category;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var isloading = true;
  TextEditingController searchController = TextEditingController();
  List<NewsQueryModel> newsModellist = <NewsQueryModel>[];
  List<String> navBarItem = [
    "Sports",
    "Nation",
    "World",
    "Business",
    "Health",
    "Technology",
    "Science",
    "Entertainment"
  ];

  getNewsQuery(String query) async {
    String url =
        "https://gnews.io/api/v4/top-headlines?country=in&category=World&apikey=4083d745343724d22a06f387a84c3745";
    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        setState(() {
          newsModellist.clear();
          if (data.containsKey("articles") && data["articles"] is List) {
            data["articles"].forEach((element) {
              NewsQueryModel newsQueryModel = NewsQueryModel.fromMap(element);
              newsModellist.add(newsQueryModel);
            });
          }
          isloading = false; // ✅ Fix here
        });
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    getNewsQuery("india");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🔍 Search bar
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search, color: Colors.black),
                        hintText: "Search News...",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(60)),
                        )),
                  ),
                ),
              ),

              // 🔻 Horizontal nav bar
              Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: navBarItem.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      padding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Text(
                            navBarItem[index],
                            style: TextStyle(color: Colors.white),
                          )),
                    );
                  },
                ),
              ),

              // 📰 Carousel Slider
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: isloading
                    ? CircularProgressIndicator(color: Colors.red)
                    : CarouselSlider(
                  options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true),
                  items: newsModellist.map((instance) {
                    return Builder(builder: (context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          child: Image.network(
                            instance.newsImg,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    });
                  }).toList(),
                ),
              ),

              // 📌 Latest News Label
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text("Latest News...",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 28)),
                  ),
                ],
              ),

              // 📰 News List
              isloading
                  ? CircularProgressIndicator()
                  : Column(
                children: newsModellist.map((news) {
                  return Container(
                    margin:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Card(
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              news.newsImg,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.black12.withOpacity(0),
                                      Colors.black
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                              ),
                              padding: EdgeInsets.fromLTRB(10, 15, 10, 8),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(news.newsHead,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    news.newsDes.length < 10
                                        ? "${news.newsDes.substring(0, 15)}..."
                                        : news.newsDes,
                                    style: TextStyle(
                                        color: Color(0xffE4080A),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),

              // 🔘 More button
              SizedBox(height: 15),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => custom_category.Category(
                              Query: "World",
                            )));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: Text("More",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
