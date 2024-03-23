import 'package:contact_app/model/new_contact.dart';
import 'package:contact_app/screens/add_contact_page.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List <NewContact> contacts = [];
  int selectIndex= -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Mes contacts" , style: TextStyle(fontWeight: FontWeight.w600),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddContact(onContactAdd: (newContact){
            setState(() {
             contacts.add(newContact);
            });
          },),));
        },
        child: Icon(Icons.add),
      ),
      body:ListView.builder(
        padding: EdgeInsets.all(5),
        itemCount: contacts.length,
        itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.all(5),
            child: ListTile(
              leading: CircleAvatar(),
              title: Text(contacts[index].nom.toString()+" "+contacts[index].prenom.toString()),
              subtitle: Text("E-mail: "+contacts[index].mail.toString()+" | Téléphone: " +contacts[index].tel.toString(), style: TextStyle(fontWeight: FontWeight.w700),),
              tileColor: Color(0xA3E1F5FC),
              selected: index== selectIndex,
              trailing: Icon(
                Icons.delete_forever, color: Colors.red,
              ),
              onTap: (){
                setState(() {
                  selectIndex = index;
                  contacts.removeAt(index);
                });
              },
            ),
          );
        },

      ),


    );

  }

  }

