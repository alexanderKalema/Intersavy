import 'package:android_app_development/models/generic_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:android_app_development/models/my_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:android_app_development/services/bloc/home/home_bloc.dart';
import 'package:android_app_development/services/bloc/home/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> topics = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          title: "Welcome to my app",
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is FinishedOnBoardingState) {
              topics = state.topics;
            }
          },
          builder: (context, state){
            if(state is FinishedOnBoardingState){
              return   Column(
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
                        itemCount: topics.length,
                        itemBuilder: (context, index) => GenericCard(
                          description: topics[index] ['description'],
                          title: topics[index] ['title'],
                          icon: topics[index] ['icon'],
                          onTap: () {
                            context.router.pushNamed(topics[index] ['path']);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            else{
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
