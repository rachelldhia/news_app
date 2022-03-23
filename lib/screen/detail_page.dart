import 'package:flutter/material.dart';
import 'package:news_app/model/articles.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../utils/utils.dart';

class DetailPage extends StatefulWidget {
  final Article article;
  DetailPage(this.article);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
            children: [
              Image.network(widget.article.urlToImage.toString(),
                height: 350,
                fit: BoxFit.cover,
              ),
              ListView(
                children: [
                  const SizedBox(height: 330),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24,),
                          Text(widget.article.title.toString(),
                            style: titleArticle.copyWith(
                                fontSize: 18
                            ),),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.account_circle, size: 24,),
                                  const SizedBox(width: 10,),
                                  Text(widget.article.author.toString(),
                                    style: authorDateArticle.copyWith(
                                        fontSize: 14
                                    ),)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.calendar_today_outlined, size: 24,),
                                  const SizedBox(width: 10,),
                                  Text(timeUntil(DateTime.parse(widget.article.publishedAt.toString())),
                                    style: authorDateArticle.copyWith(
                                        fontSize: 14
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Text(widget.article.content.toString(),
                            textAlign: TextAlign.left,
                            style: detailArticle.copyWith(
                                fontSize: 16
                            ),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(0,10),
                                blurRadius: 50
                            )
                          ]
                      ),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back)),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(0,10),
                                blurRadius: 50
                            )
                          ]
                      ),
                      child: IconButton(
                          onPressed: () {

                          },
                          icon: const Icon(Icons.bookmark_border_rounded)),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
  String timeUntil(DateTime parse){
    return timeago.format(parse, allowFromNow: true, locale: 'id');
  }
}


