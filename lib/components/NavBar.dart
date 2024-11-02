import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:stock_sync/constants/Constants.dart";
import "package:stock_sync/controllers/userControllers/registerController.dart";
import "package:stock_sync/repository/authentication_repo.dart";

class NavBar extends StatefulWidget {
  final String user;
  final String image;
  const NavBar({super.key,required this.image,required this.user});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          const SizedBox(height: 70),
          Container(
            height : 100,
            child : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:  Text(widget.user, style: TextStyle(
                      color: tertiaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                ),
                Row(
                  children: [
                    Image.asset('assets/images/${widget.image}', width: 100, height: 100,),
                    IconButton(onPressed: () {
                     AuthenticationRepo.instance.logOut();
                    }, icon: Icon(Icons.logout)),
                  ],
                )
              ],
            )

          ),
        ],
      );
  }
}
