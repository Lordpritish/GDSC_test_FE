import 'package:flutter/material.dart';
import 'timeline.dart';

class PatientHome extends StatefulWidget {
  @override
  State<PatientHome> createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFFDB84B1),
            Color(0xFF3A3E88),
          ],
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFFDB84B1).withOpacity(0.2)),
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
            appBar: _buildAppBar(context),
            body: EventTimeline(),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Text(
        'Good day',
        style: TextStyle(
          color: Color(0xFF9E3773),
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Color(0xFF9E3773),
          ),
          onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          },
        )
      ],
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  List doctorsList = []; // connect with the doctor's id API

  @override
  List<Widget> buildActions(BuildContext context) {
    // action for search bar
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon for search bar
    return IconButton(
        onPressed: () {
          close(context, '/home');
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on selection
    // return doctor's personal page
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for anything
    final suggestionList = doctorsList.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context); // call buildResults
        },
        leading: const Icon(Icons.medical_services),
        title: RichText(
            text: TextSpan(text: suggestionList[index].substring(0, query.length), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold), children: [
          TextSpan(text: suggestionList[index].substring(query.length), style: const TextStyle(color: Colors.grey))
        ])),
      ),
      itemCount: suggestionList.length,
    );
  }
}
