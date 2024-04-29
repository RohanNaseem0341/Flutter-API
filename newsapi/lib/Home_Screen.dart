import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_news_app/news_channel_headline_model.dart';
import 'package:my_news_app/view_model.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  viewmodel newsViewModel = viewmodel();

  final format = DateFormat('MMMM dd, yyyy');
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.sizeOf(context).height * 1;
    final Width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: Image.asset('images/category.png')),
        title: Text(
          "News",
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: Height * 0.55,
            width: Width,
            child: FutureBuilder<newschannelheadlinemodel>(
                future: newsViewModel.fetchnewschannel(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SpinKitCircle(
                        size: 40,
                        color: Colors.blue,
                      ),
                    );
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.articles!.length,
                      itemBuilder: (context, index) {
                        DateTime dateTime = DateTime.parse(snapshot
                            .data!.articles![index].publishedAt
                            .toString());
                        return SizedBox(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: Height * 0.6,
                                width: Width * 0.9,
                                padding: EdgeInsets.symmetric(
                                    horizontal: Height * 0.02),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    imageUrl: snapshot
                                        .data!.articles![index].urlToImage
                                        .toString(),
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Container(
                                      child: spinkit2,
                                    ),
                                    errorWidget: (context, url, error) => Icon(
                                      Icons.error_outline,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                child: Container(
                                  height: Height *
                                      0.3, // Specify a fixed height for the Card
                                  width: Width *
                                      0.9, // Match the width of the parent Container
                                  child: Card(
                                    elevation: 5,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: Height * 0.22,
                                            width: Width * 0.7,
                                            child: Text(
                                              snapshot
                                                  .data!.articles![index].title
                                                  .toString(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            width: Width * 0.7,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  snapshot
                                                      .data!
                                                      .articles![index]
                                                      .source!
                                                      .name
                                                      .toString(),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  format.format(dateTime),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}

const spinkit2 = SpinKitFadingCircle(
  color: Colors.amber,
  size: 50,
);
