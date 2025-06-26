import 'package:flutter/material.dart';


class RecentSearches extends StatefulWidget {

  final List<RecentSearchesItem> items;

  const RecentSearches({super.key, required this.items});

  @override
  State<RecentSearches> createState() => _RecentSearchesState();
}

class _RecentSearchesState extends State<RecentSearches> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          Row(
            children: [
              Text("")
            ],
          )
        ],
      ),
    );
  }
}

class RecentSearchesItem{
  final String title;
  final Container container1;

  RecentSearchesItem({required this.title, required this.container1});

}
