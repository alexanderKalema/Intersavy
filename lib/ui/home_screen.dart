import 'package:android_app_development/models/generic_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:android_app_development/models/my_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          title: "Welcome to my app",
        ),
        body: Column(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index) => GenericCard(
                    description: "My description",
                    title: "My title",
                    icon: Icons.calculate_rounded,
                    onTap: () {
                      context.router.pushNamed('/music');
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
