import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {

  TabController _tabController;
  ScrollController _scrollController;
  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    _scrollController= new ScrollController();

  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext,bool innerBoxisScrolled){
            return <Widget>[
              SliverAppBar(
                actions: <Widget>[
                  Icon(Icons.search),
                  SizedBox(width: 25.0,),
                  Icon(Icons.more_vert),
                  SizedBox(width: 15.0,),
                ],
                pinned: true,
                floating: true,
                centerTitle: false,
                backgroundColor: Color(0xFF075e54),
                title: Text('WhatsApp'),
                bottom: TabBar(
                  indicatorWeight: 5.0,
                  indicatorColor: Colors.white,
                  controller: _tabController,
                  tabs: <Widget>[
                    Tab(
                      child: Icon(Icons.photo_camera),
                    ),
                    Tab(
                      text: 'Chats',
                    ),
                    Tab(
                      text: 'Status',
                    ),
                    Tab(
                      text: 'Calls',
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Text('camera'),
              Chats(),
              Status(),
              Calls(),
            ],
          ),
        ),
      ),
    );
  }
}

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {

  List<String>name=[
    'Rahul',
    'Shyam',
    'Bhavya'
  ];
  List<String>text = [
    'Hiiiiii',
    'How r u',
    'How u doin'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){},
      child:Center(child: Icon(Icons.message),),
        backgroundColor: Color(0xFF25d366),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: name.length,
            itemBuilder:(context,index){
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://www.hindustantimes.com/rf/image_size_1200x900/HT/p2/2019/11/08/Pictures/_857e2dac-023e-11ea-bb04-d92b2c522640.jpeg'),
                ),
                title: Text(name[index]),
                subtitle: Text(text[index]),
                trailing: Text('10:00 am'),

              );

        }),

      ),

    );
  }
}

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {

  List<String>name =[
    'rahul','bhavya','Sam'
  ];
  List<String>time = ['just now','10:00 am','12:00 pm'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Center(child: Icon(Icons.photo_camera),),
        backgroundColor: Color(0xFF25d366),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading:CircleAvatar(

              backgroundImage: NetworkImage('https://www.hindustantimes.com/rf/image_size_1200x900/HT/p2/2019/11/08/Pictures/_857e2dac-023e-11ea-bb04-d92b2c522640.jpeg'),

            ),
              title: Text('My Status'),
              subtitle: Text('Tap to Add Status'),
            trailing: Icon(Icons.add),
          ),
          Container(
            color: Color(0xFFece5dd),
            width: MediaQuery.of(context).size.width,
            height:20.0,
            child: Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Text('Recent Updates',style: TextStyle(color: Color(0xFF128c7e),),),
            ),


          ),






        ],

      ),




    );
  }
}

class Calls extends StatefulWidget {
  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  List<String>name =[
    'rahul','bhavya','Sam'
  ];
  List<String>time = ['just now','10:00 am','12:00 pm'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){},
        child:Center(child: Icon(Icons.add_call),),
        backgroundColor: Color(0xFF25d366),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: name.length,
            itemBuilder:(context,index){
              return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('data:image/jpeg;base64,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'),
                  ),
                  title: Text(name[index]),
                  subtitle: Text(time[index]),
                  trailing: Icon(Icons.call,color: Color(0xFF128c7e),),
              );
              Divider();
            }),
      ),
    );
  }
}


