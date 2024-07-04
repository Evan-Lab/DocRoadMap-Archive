
import 'package:app/src/component/card/profile_card.dart';
import 'package:app/src/tools/settings/settings_view.dart';
import 'package:flutter/material.dart';

class PageAccount extends StatelessWidget {
  const PageAccount ({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xfffbfbfb),
      appBar: AppBar(
        title: const Text('Ton compte'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (BuildContext context) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'BIenvenue!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              //primary: Colors.white,
                              //onPrimary: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              child: const Center(child: Text('Connexion')),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
         
        ],
      ),
       body: ListView(
        children: const [
          ProfileCard(firstName: 'test', lastName: 'test', email: 'test.test@test.test')
        ]
      ),
    );
    
  }
}