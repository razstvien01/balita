import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfileUI extends StatefulWidget {
  final User? user;
  final VoidCallback refresh;
  const EditProfileUI({
    Key? key,
    required this.user,
    required this.refresh
  }) : super(
          key: key,
        ); 
  @override
  State<EditProfileUI> createState() => _EditProfileUIState();
}

class _EditProfileUIState extends State<EditProfileUI> {
  final _userController = TextEditingController();

  @override
  void dispose() {
    _userController.dispose();
    super.dispose();
  }
  
  //*1  save button function
  IconButton checkSaveButton(BuildContext context) {
    return IconButton(
          icon: Icon(
            Icons.check_box_outlined,
            color: Colors.white,
          ),
          tooltip: 'Save',
          onPressed: () {
            
            //* if text is empty
            if(_userController.text == '')
              return;
              
            //* update
            FirebaseFirestore.instance.collection('users').doc('${widget.user?.uid}').update({
              'username': _userController.text,
            });
            setState(() {
              
            });
            
            
            widget.refresh();
            
            //* pop
            Navigator.pop(context);
          },
        );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Edit Profile'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
        actions: <Widget>[
          checkSaveButton(context)
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 5.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10),
                          )
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://pfpmaker.com/_nuxt/img/profile-3-1.3e702c5.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Colors.white,
                          ),
                          color: Colors.green,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 60.0,
              ),
              Text(
                'Username:',
                style: TextStyle(
                  letterSpacing: 2.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Card(
                child: SizedBox(
                  width: double.infinity,
                  height: 40.0,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 3),
                        border: OutlineInputBorder(),
                      ),
                      controller: _userController,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
