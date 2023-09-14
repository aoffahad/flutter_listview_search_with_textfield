import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Map<String, dynamic>> _allUsers = [
    {"id":1 , "name" : "Andy", "age" : 29}, 
    {"id":2 , "name" : "Candy", "age" : 34}, 
    {"id":3 , "name" : "Sandy", "age" : 23}, 
    {"id":4 , "name" : "Vendi", "age" : 43}, 
    {"id":5 , "name" : "Andy", "age" : 65}, 
    {"id":6 , "name" : "Chandi", "age" : 34}, 
    {"id":7 , "name" : "Andy", "age" : 12}, 
    {"id":8 , "name" : "Abir", "age" : 16}, 
  ];

  List<Map<String,dynamic>> _foundUsers = [];
  @override
  void initState() {
    _foundUsers = _allUsers;
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String,dynamic>> results = [];
    if (enteredKeyword.isEmpty){
      results = _allUsers;

    } else {
      results = _allUsers
      .where((user) => user["name"].toString().toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flutter List View with Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20,), 
             TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                labelText: 'Search', suffixIcon: Icon(Icons.search)
              ),
            ), 
            const SizedBox(height: 20,), 
            Expanded(
              child: ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context,index) => Card(
                  key: ValueKey(_foundUsers[index]["id"]),
                  color: Colors.blue, 
                  elevation: 4, 
                  margin: const EdgeInsets.symmetric(vertical: 10), 
                  child: ListTile(
                    leading: Text(_foundUsers[index]["id"].toString(),style: const TextStyle(
                      fontSize: 24, color: Colors.white
                    ),),
                    title: Text(_foundUsers[index]['name'], 
                    style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text('${_foundUsers[index]["age"].toString()} years old', style: TextStyle(color: Colors.white),),
                  ),
                ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}