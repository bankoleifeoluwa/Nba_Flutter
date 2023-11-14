import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_nba/models/teams.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<Team> teams = [];
  Future getTeams() async {
    var response = await http.get(Uri.https('balldontlie.io', 'api/v1/games'));
    var jsonData = jsonDecode(response.body);
    for (var eachTeam in jsonData['data']) {
      final team =
          Team(abbreviation: eachTeam['abbreviation'], city: eachTeam['city']);
      teams.add(team);
    }
    // print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getTeams();
    return Scaffold(
      body: FutureBuilder(
        future: getTeams(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: teams.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(teams[index].abbreviation),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
