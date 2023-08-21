import 'package:flutter/material.dart';
import 'package:news_app_ui/models/article_model.dart';
import 'package:news_app_ui/widgets/custom_tag.dart';
import 'package:news_app_ui/widgets/image_container.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  static const routeName = '/article';

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Article;
    return ImageContainer(
        width: double.infinity,
        imageUrl: article.imageUrl,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.white),
            ),
            body: ListView(children: [
              _NewsHeadline(
                article: article,
              ),
              _NewsBody(article: article)
            ])));
  }
}

class _NewsBody extends StatelessWidget {
  const _NewsBody({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                CustomTag(backgroundColor: Colors.black, children: [
                  CircleAvatar(
                      radius: 10,
                      backgroundImage:
                          NetworkImage(article.authorImageUrl)),
                  SizedBox(width: 10),
                  Text(
                    article.author,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  )
                ]),
                SizedBox(
                  width: 10,
                ),
                CustomTag(
                    backgroundColor: Colors.grey.shade200,
                    children: [
                      Icon(
                        Icons.timer,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 10),
                      Text(
                        '${DateTime.now().difference(article.createdAt).inHours}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ]),
                SizedBox(
                  width: 10,
                ),
                CustomTag(
                    backgroundColor: Colors.grey.shade200,
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 10),
                      Text(
                        '${article.views}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ]),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              article.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              article.body,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(height: 1.5),
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
                shrinkWrap: true,
                itemCount: 2,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1.25),
                itemBuilder: (context, index) {
                  return ImageContainer(
                      width: MediaQuery.of(context).size.width * 0.42,
                      imageUrl: article.imageUrl,
                      margin: EdgeInsets.only(right: 5.0,bottom: 5.0),
                    );
                })
          ],
        ));
  }
}

class _NewsHeadline extends StatelessWidget {
  const _NewsHeadline({
    required this.article,
    super.key,
  });
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          CustomTag(backgroundColor: Colors.grey.withAlpha(150), children: [
            Text(
              article.category,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            )
          ]),
          Text(
            article.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold, height: 1.25, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            article.subtitle,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
