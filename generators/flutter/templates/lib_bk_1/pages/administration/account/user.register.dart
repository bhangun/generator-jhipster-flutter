import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(

        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.account_balance,
                      color: Colors.red[500],
                      size: 40.0,
                    ),
                    onPressed: ()=> print('bismillah'),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.motorcycle,
                      color: Colors.red[200],
                      size: 40.0,
                    ),
                    onPressed: ()=> print('bismillah'),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.access_alarm,
                      color: Colors.red[200],
                      size: 40.0,
                    ),
                    onPressed: ()=> print('bismillah'),
                  ),
                  OutlineButton(
                      color: Colors.amber,
                      child: new Text("Button"),textColor: Colors.blue,
                      onPressed: ()=> print('tombol'),
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)
                      )
                  ),
                  Container(
                    /*decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(25.0),
              border: new Border.all(
                width: 5.0,
                color: Colors.red,
              )
            ),*/
                    margin: const EdgeInsets.all(0.0),
                    color: const Color(0xFF00FF00),
                    width: 48.0,
                    height: 48.0,
                  ),
                ]
            ),
            new Container(
              margin: const EdgeInsets.all(10.0),
              color: const Color(0xFF00FF00),
              width: 48.0,
              height: 48.0,
            ),
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Add',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/*
Username
Email
New password
Password strength:
New password confirmation


{
  "activated": true,
  "authorities": [
    "string"
  ],
  "createdBy": "string",
  "createdDate": "2018-08-16T04:52:29.820Z",
  "email": "string",
  "firstName": "string",
  "id": 0,
  "imageUrl": "string",
  "langKey": "string",
  "lastModifiedBy": "string",
  "lastModifiedDate": "2018-08-16T04:52:29.820Z",
  "lastName": "string",
  "login": "string",
  "password": "string"
}


Exit: com.mycompany.myapp.web.rest.UserResource.getUser() with result =
<200 OK,UserDTO{

login='bhangun',
firstName='ganteng',
lastName='sekali',
email='bhangunh@gmail.com',
imageUrl='null',
activated=true,
langKey='en',
createdBy=admin,
createdDate=2018-08-16T04:51:46.706Z,
lastModifiedBy='admin',
lastModifiedDate=2018-08-16T04:51:46.706Z,
authorities=[]}

,
UserDTO{login='admin', firstName='Administrator', lastName='Administrator',
email='admin@localhost', imageUrl='', activated=true, langKey='en',
createdBy=system, createdDate=2018-08-14T03:04:33.071Z,
lastModifiedBy='system', lastModifiedDate=null,
authorities=[ROLE_USER, ROLE_ADMIN]},

UserDTO{login='user', firstName='User', lastName='User',
email='user@localhost', imageUrl='', activated=true, langKey='en',
createdBy=system, createdDate=2018-08-14T03:04:33.071Z,
lastModifiedBy='system', lastModifiedDate=null,
authorities=[ROLE_USER]},

UserDTO{login='bhangun', firstName='ganteng',
lastName='sekali',
email='bhangunh@gmail.com', imageUrl='null', activated=true, langKey='en', createdBy=admin, createdDate=2018-08-16T04:51:46.706Z, lastModifiedBy='admin', lastModifiedDate=2018-08-16T04:51:46.706Z, authorities=[]}],{X-Total-Count=[4], Link=[</api/users?page=0&size=20>; rel="last",</api/users?page=0&size=20>;
*/