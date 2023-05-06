import 'package:android_app_development/models/generic_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:android_app_development/models/my_appbar.dart';


class HomeScreen extends StatefulWidget {
 final List<Map<String, dynamic>> topics;
  const HomeScreen({Key? key,required this.topics}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  MyAppBar(
          title: AppLocalizations.of(context)!.welcomeToMyApp,
        ),
        body:    Column(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: GridView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 35,
                          crossAxisCount: 1,
                          childAspectRatio: 1.2 ,
                        ),
                        itemCount: widget.topics.length,
                        itemBuilder: (context, index) => GenericCard(
                          description: widget.topics[index] ['description'],
                          title: widget.topics[index] ['title'],
                          icon: widget.topics[index] ['icon'],
                          onTap: () {
                            context.router.pushNamed(widget.topics[index] ['path']);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
        )   );


  }
}
