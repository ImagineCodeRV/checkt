import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = const Color.fromARGB(253, 17, 32, 167);
  int currentIndex = 0;

  List<IconData> navigationIcons = [
    FontAwesomeIcons.calendarDays,
    FontAwesomeIcons.check,
    FontAwesomeIcons.user,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: 24,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < navigationIcons.length; i++) ...<Expanded>{
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  child: Container(
                    height: screenHeight,
                    width: screenWidth,
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            navigationIcons[1],
                            color: 1 == currentIndex ? primary : Colors.black54,
                            size: i == currentIndex ? 30 : 26,
                          ),
                          i == currentIndex
                              ? Container(
                                  margin: const EdgeInsets.only(top: 6),
                                  height: 3,
                                  width: 22,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(40)),
                                    color: primary,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            }
          ],
        ),
      ),
    );
  }
}
//Scaffold(
//      resizeToAvoidBottomInset: false,
//      body: Column(
//        children: [
//          isKeyboardVisible
//              ? SizedBox(
//                  height: screenHeight / 16,
//                )
//              : Container(
//                  height: screenHeight / 3,
//                  width: screenWidth,
//                  decoration: BoxDecoration(
//                      color: primary,
//                      borderRadius: const BorderRadius.only(
//                        bottomRight: Radius.circular(70),
//                      )),
//                  child: Center(
//                    child: Icon(
//                      Icons.person,
//                      color: Colors.white,
//                      size: screenWidth / 5,
//                    ),
//                 ),
//                ),
//          Container(
//            margin: EdgeInsets.only(
//                top: screenHeight / 15, bottom: screenHeight / 20),
//            child: Text(
//              'Login',
//              style: TextStyle(
//               fontSize: screenWidth / 18,
//              ),
//            ),
//          ),
//          Container(
//            alignment: Alignment.centerLeft,
//            margin: EdgeInsets.symmetric(
//              horizontal: screenWidth / 12,
//            ),
//           child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                fieldTitle('ID Funcionário'),
//                customField(
//                    'Insira seu ID de Funcionário', idController, false),
//                fieldTitle('Senha'),
//                customField('Insira sua Senha', passController, true),
//                GestureDetector(
//                  onTap: () {
//                   Navigator.pushReplacement(
//                        context,
//                        MaterialPageRoute(
//                            builder: (context) => const HomePage()));
//                  },
//                  child: Container(
//                    height: 68,
//                    width: screenWidth,
//                    margin: EdgeInsets.only(top: screenHeight / 40),
//                    decoration: BoxDecoration(
//                      color: primary,
//                      borderRadius: const BorderRadius.all(Radius.circular(30)),
//                    ),
//                    child: Center(
//                      child: Text(
//                        'Login',
//                        style: TextStyle(
//                          fontSize: screenWidth / 26,
//                          color: Colors.white,
//                          letterSpacing: 2,
//                        ),
//                      ),
//                    ),
//                  ),
//               ),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );

//Widget fieldTitle(String title) {
//  return Container(
//    margin: const EdgeInsets.only(bottom: 12),
//    child: Text(
//      title,
//      style: TextStyle(
//        fontSize: screenWidth / 26,
//      ),
//    ),
//  );
//}

//Widget customField(
//    String hint, TextEditingController controller, bool obscure) {
//  return Container(
//    width: screenWidth,
//    margin: EdgeInsets.only(bottom: screenHeight / 50),
//    decoration: const BoxDecoration(
//      color: Colors.white,
//      borderRadius: BorderRadius.all(Radius.circular(12)),
//      boxShadow: [
//        BoxShadow(
//          color: Colors.black26,
//          blurRadius: 10,
//          offset: Offset(2, 3),
//       ),
//      ],
//    ),
//    child: Row(
//      children: [
//        Container(
//          width: screenWidth / 6,
//          child: Icon(
//            Icons.person,
//            color: primary,
//           size: screenWidth / 15,
//          ),
//        ),
//        Expanded(
//          child: Padding(
//            padding: EdgeInsets.only(right: screenWidth / 12),
//            child: TextFormField(
//              controller: controller,
//              enableSuggestions: false,
//              autocorrect: false,
//              decoration: InputDecoration(
//                contentPadding: EdgeInsets.symmetric(
//                  vertical: screenHeight / 35,
//                ),
//                border: InputBorder.none,
//                hintText: hint,
//              ),
//              maxLines: 1,
//              obscureText: obscure,
//            ),
//          ),
//        ),
//      ],
//    ),
//  );
//}
