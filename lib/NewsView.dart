// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
//
// import 'model.dart';
// class Newsview extends StatefulWidget {
//   const Newsview({super.key});
//
//   @override
//   State<Newsview> createState() => _NewsviewState();
// }
//
// List<NewsQueryModel> newsModellist =<NewsQueryModel>[];
// bool isloading =true;
//
// class _NewsviewState extends State<Newsview> {
//   getNewsQuery(String query) async {
//     String url = "https://gnews.io/api/v4/top-headlines?country=in&category=general&apikey=API_KEY";
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
//           if (data.containsKey("content") && data["content"] is List) {
//             // Iterate over "articles" which is a list of maps
//             data["content"].forEach((element) {
//               // Create a NewsQueryModel from each element (which is a map)
//               NewsQueryModel newsQueryModel = NewsQueryModel.fromMap(element);
//               // Add it to the list
//               newsModellist.add(newsQueryModel);
//             });
//           }
//
//           // Set loading to false after data is fetched
//           isloading = false;
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
//     getNewsQuery("content");
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//           children: [
//             ListView.builder(
//               itemCount: newsModellist.length,
//               shrinkWrap: true,
//               physics: AlwaysScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//               return SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: 200,
//                 child: Card(
//                   child: Column(
//                     children: [
//                       Text(newsModellist[index].content,style: TextStyle(fontSize: 20),)
//                     ],
//                   ),
//                 ),
//               );
//             },)
//           ],
//         ),
//     );
//   }
// }
