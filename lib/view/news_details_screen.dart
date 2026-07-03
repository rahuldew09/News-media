import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsDetailsScreen extends StatefulWidget {

  final String newImage, newTitle, newDate, author, description, content, source;
  const NewsDetailsScreen({super.key,
    required this.newImage,
    required this.newTitle,
    required this.newDate,
    required this.author,
    required this.description,
    required this.content,
    required this.source,
  });

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {

  final format = DateFormat("MMMM dd, yyyy");

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    DateTime dateTime = DateTime.parse(widget.newDate);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: height * 0.45,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: CachedNetworkImage(imageUrl: widget.newImage,
              fit: BoxFit.cover,
                placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
              ),
            ),
          ),
          Container(
            height: height * 0.6,
            margin: EdgeInsets.only(top: height * 0.4),
            padding: EdgeInsets.only(top: 20, right: 20, left: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              )
            ),
            child: ListView(
              children: [
                Text(widget.newTitle, style: TextStyle(fontSize: 20, color: Colors.black87),),
                SizedBox(height: height * 0.02,),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(widget.source,
                        style: TextStyle(fontSize: 13, color: Colors.black87),
                      ),
                    ),
                    Text(format.format(dateTime),
                      style: TextStyle(fontSize: 12, color: Colors.black87),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.03,),
                Text(widget.description,
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
