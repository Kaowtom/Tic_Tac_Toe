// import 'package:flutter/material.dart';
// import 'package:ticing_and_toeing/databasehandle.dart';

// class LeaderboardPage extends StatefulWidget {
//   @override
//   _LeaderboardPageState createState() => _LeaderboardPageState();
// }

// class _LeaderboardPageState extends State<LeaderboardPage> {
//   late Future<List<Map<String, dynamic>>> _leaderboardData;

//   @override
//   void initState() {
//     super.initState();
//     _leaderboardData = DatabaseProvider().getTopScores();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Leaderboard'),
//       ),
//       body: Center(
//         child: FutureBuilder<List<Map<String, dynamic>>>(
//           future: _leaderboardData,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               final data = snapshot.data!;
//               return ListView.builder(
//                 itemCount: data.length,
//                 itemBuilder: (context, index) {
//                   final name = data[index]['player_name'] as String;
//                   final score = data[index]['score'] as int;
//                   return ListTile(
//                     title: Text(name),
//                     trailing: Text(score.toString()),
//                   );
//                 },
//               );
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else {
//               return CircularProgressIndicator();
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
