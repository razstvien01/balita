import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_flight/constant.dart';
import 'package:news_flight/model/article.dart';
import 'package:news_flight/pages/signup/components/default_button.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final currUser = FirebaseAuth.instance.currentUser;
  Map<String, dynamic> data = {};
  String userName = 'reign';
  int age = 22;
  String email = 'email@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kDarkColor,
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileUI()),
                );
              },
              icon: Icon(
                Icons.mode_edit_outline_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: kDarkColor,

        body: FutureBuilder<DocumentSnapshot?>(
          future: FirebaseFirestore.instance
              .collection('users')
              .doc('${currUser?.uid}')
              .get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              data = snapshot.data!.data() as Map<String, dynamic>;

              userGlbData = data;
              bmArticles = userGlbData['bookmark'];
              bm = [];

              bmArticles.forEach((key, value) {
                ArticleModel article = ArticleModel(
                  title: key,
                  author: value['author'],
                  bookmark: value['bookmark'],
                  content: value['content'],
                  description: value['description'],
                  url: value['url'],
                  urlToImage: value['urlToImage'],
                );

                bm.add(article);
              });

              print(bm);

              return Container(
                padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
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
                      ],
                    )),
                    Divider(
                      height: 20.0,
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
                    SizedBox(
                      width: double.infinity,
                      height: 40.0,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          data['username'],
                          style: TextStyle(
                            letterSpacing: 1.0,
                            color: Colors.grey,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Email:',
                      style: TextStyle(
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    SizedBox(
                      width: double.infinity,
                      height: 40.0,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${currUser?.email}',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            color: Colors.grey,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    // Text(
                    //   'Age:',
                    //   style: TextStyle(
                    //     letterSpacing: 2.0,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    // SizedBox(height: 10.0),
                    // Card(
                    //   elevation: 0,
                    //   child: SizedBox(
                    //     width: double.infinity,
                    //     height: 40.0,
                    //     child: Align(
                    //       alignment: Alignment.centerLeft,
                    //       child: Text(
                    //         ' $age',
                    //         style: TextStyle(
                    //           letterSpacing: 1.0,
                    //           color: Colors.grey,
                    //           fontSize: 20.0,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    DefaultButton(
                      btnText: 'Sign Out',
                      onPressed: FirebaseAuth.instance.signOut,
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )

        // body: Container(
        //   padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        //   child: ListView(
        //     children: [
        //       Center(
        //           child: Stack(
        //         children: [
        //           Container(
        //             width: 130,
        //             height: 130,
        //             decoration: BoxDecoration(
        //               border: Border.all(
        //                 color: Colors.white,
        //                 width: 5.0,
        //               ),
        //               boxShadow: [
        //                 BoxShadow(
        //                   spreadRadius: 2,
        //                   blurRadius: 10,
        //                   color: Colors.black.withOpacity(0.1),
        //                   offset: Offset(0, 10),
        //                 )
        //               ],
        //               shape: BoxShape.circle,
        //               image: DecorationImage(
        //                 fit: BoxFit.cover,
        //                 image: NetworkImage(
        //                     'https://pfpmaker.com/_nuxt/img/profile-3-1.3e702c5.png'),
        //               ),
        //             ),
        //           ),
        //         ],
        //       )),
        //       Divider(
        //         height: 20.0,
        //       ),
        //       Text(
        //         'Username:',
        //         style: TextStyle(
        //           letterSpacing: 2.0,
        //           color: Colors.white,
        //         ),
        //       ),
        //       SizedBox(
        //         height: 10.0,
        //       ),
        //       SizedBox(
        //         width: double.infinity,
        //         height: 40.0,
        //         child: Align(
        //           alignment: Alignment.centerLeft,
        //           child: Text(
        //             '${user?.uid}',
        //             style: TextStyle(
        //               letterSpacing: 1.0,
        //               color: Colors.grey,
        //               fontSize: 20.0,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         height: 10.0,
        //       ),
        //       Text(
        //         'Email:',
        //         style: TextStyle(
        //           letterSpacing: 2.0,
        //           color: Colors.white,
        //         ),
        //       ),
        //       SizedBox(height: 10.0),
        //       SizedBox(
        //         width: double.infinity,
        //         height: 40.0,
        //         child: Align(
        //           alignment: Alignment.centerLeft,
        //           child: Text(
        //             '${user?.email}',
        //             style: TextStyle(
        //               letterSpacing: 1.0,
        //               color: Colors.grey,
        //               fontSize: 20.0,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //         ),
        //       ),
        //       SizedBox(height: 10.0),
        //       Text(
        //         'Age:',
        //         style: TextStyle(
        //           letterSpacing: 2.0,
        //           color: Colors.white,
        //         ),
        //       ),
        //       SizedBox(height: 10.0),
        //       Card(
        //         elevation: 0,
        //         child: SizedBox(
        //           width: double.infinity,
        //           height: 40.0,
        //           child: Align(
        //             alignment: Alignment.centerLeft,
        //             child: Text(
        //               ' $age',
        //               style: TextStyle(
        //                 letterSpacing: 1.0,
        //                 color: Colors.grey,
        //                 fontSize: 20.0,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //       DefaultButton(
        //         btnText: 'Sign Out',
        //         onPressed: FirebaseAuth.instance.signOut,
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}

class EditProfileUI extends StatefulWidget {
  //final String userName;
  //final String age;
  //final String email;
  const EditProfileUI({
    Key? key,
  }) : super(
            key:
                key); //required this.userName, required this.age, required this.email}) : super(key: key);
  @override
  State<EditProfileUI> createState() => _EditProfileUIState();
}

class _EditProfileUIState extends State<EditProfileUI> {
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
        // ignore: prefer_const_literals_to_create_immutables
        actions: <Widget>[
          const IconButton(
            icon: Icon(
              Icons.check_box_outlined,
              color: Colors.white,
            ),
            tooltip: 'Save',
            onPressed: null,
          )
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
                    child: buildTextField('', 'Enter username'),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Email:',
                style: TextStyle(
                  letterSpacing: 2.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Card(
                elevation: 0,
                child: SizedBox(
                  width: double.infinity,
                  height: 40.0,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: buildTextField('', 'Enter Email'),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Age:',
                style: TextStyle(
                  letterSpacing: 2.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Card(
                elevation: 0,
                child: SizedBox(
                  width: double.infinity,
                  height: 40.0,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ' 21',
                      style: TextStyle(
                        letterSpacing: 1.0,
                        color: Colors.grey,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String hints) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 3),
        border: OutlineInputBorder(),
        labelText: labelText,
        hintText: hints,
      ),
    );
  }
}
