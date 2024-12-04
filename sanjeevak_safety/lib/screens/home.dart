import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanjeevak_safety/utils/app_textstyles.dart';
import '../widgets/home_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<Home> {
  List<Map<String, dynamic>> items = [
    {
      'text': 'Police 100',
      'icon' : Icons.local_police_outlined,
    },
    {
      'text': 'Women Helpline',
      'icon' : Icons.woman,
    },
    {
      'text': 'Nearby help',
      'icon' : Icons.people_outline_sharp,
    },
    {
      'text': 'Alert contacts',
      'icon' : Icons.person,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Color(0xFFfce2e1), Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: SafeArea(
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Hi, Avadhut",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.location_on_outlined),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 5),
                          Text(
                            "Emergency Help Needed?",
                            style: AppTextStyles.heading2,
                          ),

                          InkWell(
                            onTap: (){
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("SOS ALERT SENT", style: AppTextStyles.bodyText,),backgroundColor: Colors.green,duration: const Duration(seconds: 1), )
                              );
                            },
                            child: ClipOval(
                              child: SizedBox(
                                width: 300, // Set the desired size
                                height: 300, // Set the desired size
                                child: Image.asset(
                                  "assets/images/alert_logo.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            "Tap the button to send SOS alert",
                            style: AppTextStyles.bodyTextSubdued,
                          ),
                          SizedBox(height: 20,),

                          Expanded(
                            child: GridView.builder(
                              padding:
                              const EdgeInsets.only(top: 10, bottom: 20),
                              gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 1 / 0.8,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                              ),
                              itemCount:items.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return HomeCard(
                                  icon: items[index]['icon'],
                                  text: items[index]['text'],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
