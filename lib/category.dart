// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:project_is_it/model.dart';
// class Category extends StatefulWidget {
//   var Query;
//
//    // const Category({super.key});
//    Category({required this.Query});
//
//   @override
//   State<Category> createState() => _CategoryState();
//
// }
//
// class _CategoryState extends State<Category> {
//   List<NewsQueryModel> newsModellist =<NewsQueryModel>[];
//   bool isloading =true;
//   var url="";
//   getNewsQuery( query) async{
//     if(query=="World"||query=="India"){
//       url="https://gnews.io/api/v4/top-headlines?country=in&category=world&apikey=4083d745343724d22a06f387a84c3745";
//     }else if(query=="Business"||query=="India"){
//       url="https://gnews.io/api/v4/top-headlines?country=in&category=business&apikey=4083d745343724d22a06f387a84c3745";
//     }else if(query=="Sports"||query=="India"){
//       url="https://gnews.io/api/v4/top-headlines?country=in&category=sports&apikey=4083d745343724d22a06f387a84c3745";
//     } else if(query=="Nation"||query=="India"){
//       url="https://gnews.io/api/v4/top-headlines?country=in&category=nation&apikey=4083d745343724d22a06f387a84c3745";
//     } else if(query=="Health"||query=="India"){
//       url="https://gnews.io/api/v4/top-headlines?country=in&category=health&apikey=4083d745343724d22a06f387a84c3745";
//     }else if(query=="Technology"||query=="India"){
//       url="https://gnews.io/api/v4/top-headlines?country=in&category=technology&apikey=4083d745343724d22a06f387a84c3745";
//     }else if(query=="Science"||query=="India"){
//       url="https://gnews.io/api/v4/top-headlines?country=in&category=science&apikey=4083d745343724d22a06f387a84c3745";
//     }else if(query=="Entertainment"||query=="India"){
//       url="https://gnews.io/api/v4/top-headlines?country=in&category=entertainment&apikey=4083d745343724d22a06f387a84c3745";
//     }
//     print(newsModellist);
//     // Response naam ki class bnayenge jha data get krenge
//     Response response=await get(Uri.parse(url));
//     Map data =jsonDecode(response.body);
//     print(response.body);
//     setState(() {
//       data["articles"].forEach((element){
//         NewsQueryModel newsQueryModel=new NewsQueryModel(newsHead: '');
//         // yha elemnet ko fromMap mai pass krdenge or model mai return krdega
//         newsQueryModel =NewsQueryModel.fromMap(element);
//         // jo upar create kiya tha usme add krdiya
//         newsModellist.add(newsQueryModel);
//         setState(() {
//           isloading = false;
//         });
//       });
//     });
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     getNewsQuery(widget.Query);
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:Text("ARNE NEWS"),
//         centerTitle: true,
//       ),
//       body:Center(
//         child: isloading?CircularProgressIndicator(color: Colors.red,):
//         SingleChildScrollView(
//           child: Container(
//             child: ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: newsModellist.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                   margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
//                   child: Card(
//                     elevation: 1.0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: Stack(
//                       children: [
//                         ClipRRect(
//                             borderRadius :BorderRadius.circular(15),
//                             child: Image.network(newsModellist[index].newsImg,height:100,width:100)),
//                         Positioned(
//                           left: 0,
//                           right: 0,
//                           bottom: 0,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               gradient: LinearGradient(
//                                   colors: [
//                                     Colors.black12.withOpacity(0),
//                                     Colors.black
//                                   ],
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter
//                               ),
//                             ),
//                             padding: EdgeInsets.fromLTRB(10, 15, 10, 8),
//                             child: Column(
//                               children: [
//                                 Text(newsModellist[index].newsHead,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//                                 Text(newsModellist[index].newsDes.length<20?"${newsModellist[index].newsDes.substring(0,5)}...":newsModellist[index].newsDes,style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500),)
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },),
//           ),
//         ),
//       ),
//     );
//
//
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project_is_it/model.dart'; // Make sure your NewsQueryModel is properly defined

class Category extends StatefulWidget {
  final String Query;
  Category({required this.Query});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<NewsQueryModel> newsModellist = [];
  bool isloading = true;
  var url = "";

  getNewsQuery(String query) async {
    if (query == "World") {
      url =
      "https://gnews.io/api/v4/top-headlines?country=in&category=world&apikey=4083d745343724d22a06f387a84c3745";
    } else if (query == "Business") {
      url =
      "https://gnews.io/api/v4/top-headlines?country=in&category=business&apikey=4083d745343724d22a06f387a84c3745";
    } else if (query == "Sports") {
      url =
      "https://gnews.io/api/v4/top-headlines?country=in&category=sports&apikey=4083d745343724d22a06f387a84c3745";
    } else if (query == "Nation") {
      url =
      "https://gnews.io/api/v4/top-headlines?country=in&category=nation&apikey=4083d745343724d22a06f387a84c3745";
    } else if (query == "Health") {
      url =
      "https://gnews.io/api/v4/top-headlines?country=in&category=health&apikey=4083d745343724d22a06f387a84c3745";
    } else if (query == "Technology") {
      url =
      "https://gnews.io/api/v4/top-headlines?country=in&category=technology&apikey=4083d745343724d22a06f387a84c3745";
    } else if (query == "Science") {
      url =
      "https://gnews.io/api/v4/top-headlines?country=in&category=science&apikey=4083d745343724d22a06f387a84c3745";
    } else if (query == "Entertainment") {
      url =
      "https://gnews.io/api/v4/top-headlines?country=in&category=entertainment&apikey=4083d745343724d22a06f387a84c3745";
    }

    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);

    List<NewsQueryModel> tempList = [];
    data["articles"].forEach((element) {
      NewsQueryModel newsQueryModel = NewsQueryModel.fromMap(element);
      tempList.add(newsQueryModel);
    });

    setState(() {
      newsModellist = tempList;
      isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getNewsQuery(widget.Query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ARNE NEWS"),
        centerTitle: true,
      ),
      body: isloading
          ? Center(child: CircularProgressIndicator(color: Colors.red))
          : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: newsModellist.length,
            itemBuilder: (context, index) {
              return Container(
                margin:
                EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Card(
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        // ✅ Image with fixed height and full width
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Image.network(
                            newsModellist[index].newsImg,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                  color: Colors.grey,
                                  alignment: Alignment.center,
                                  child: Icon(Icons.broken_image,
                                      size: 40, color: Colors.white),
                                ),
                          ),
                        ),

                        // ✅ Gradient and Text Overlay
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            padding:
                            EdgeInsets.fromLTRB(10, 15, 10, 8),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  newsModellist[index].newsHead,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  newsModellist[index]
                                      .newsDes
                                      .length <
                                      20
                                      ? "${newsModellist[index].newsDes.substring(0, 5)}..."
                                      : newsModellist[index].newsDes,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
