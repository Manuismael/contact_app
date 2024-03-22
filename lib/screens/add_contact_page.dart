import 'package:contact_app/components/input.dart';
import 'package:contact_app/model/new_contact.dart';
import 'package:flutter/material.dart';
class AddContact extends StatelessWidget {
  final Function(NewContact) onContactAdd;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController pseudoController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  AddContact({required this.onContactAdd});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enregistrer un contact", style: TextStyle(fontWeight: FontWeight.w700),),
      ),
      body: Container(
        child: ListView(
          children: [
            CircleAvatar(radius: 95,),
            Input(controller: nameController, name: "Nom",),
            Input(controller: surnameController, name: "Prénom",),
            Input(controller: pseudoController, name: "Pseudo",),
            Input(controller: telController, name: "Téléphone",),
            Input(controller: mailController, name: "E-mail",),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    String nom = nameController.text;
                    String prenom = surnameController.text;
                    String pseudo = pseudoController.text;
                    String tel = telController.text;
                    String mail = mailController.text;

                    NewContact newContact = NewContact(nom: nom, prenom: prenom, pseudo: pseudo, tel:tel, mail:mail);
                    onContactAdd(newContact);
                    Navigator.pop(context, newContact);
                  },
                  child: Text("Enregistrer")
              ),
            )

          ],
        ),
      ),

    );
  }
}
