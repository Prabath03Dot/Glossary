import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary/models/word.dart';
import 'package:glossary/pages/searchResult.dart';
import 'package:glossary/services/WordService.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'sidebar.dart';
import 'dart:async';
import '../pages/searchResult.dart';

class SideBarLayout extends StatelessWidget {

  TextEditingController _controller = TextEditingController();

  Timer _debounce;

  Seacrh search = new Seacrh();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0,top: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 45.0,),
                          decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: TextFormField(
                          onChanged: (String text) {
                          if (_debounce?.isActive ?? false) _debounce.cancel();
                          _debounce = Timer(const Duration(milliseconds: 1000), () {});
//                          search.searchWord(text);
                          },
                          controller: _controller,
                          decoration: InputDecoration(
                          hintText: "Search for a word",
                          contentPadding: const EdgeInsets.only(left: 24.0),
                          border: InputBorder.none,
                          ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                        Icons.search,
                        color: Colors.blue[500],
                        ),
                      onPressed: () {},
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.0,),
                BlocBuilder<NavigationBloc, NavigationStates>(
                  builder: (context, navigationState) {
                    return navigationState as Widget;
                  },
                ),
              ],
            ),
            SideBar(),
          ],
        ),
      ),
    );
  }
}
