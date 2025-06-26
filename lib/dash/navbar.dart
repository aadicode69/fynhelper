import 'package:flutter/material.dart';
import 'package:fynhelper/home/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Aaditya',
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              'aadityagoyal@gmail.com',
              style: GoogleFonts.poppins(),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/my.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              }),
          ListTile(
              leading: Icon(Icons.group),
              title: Text("About us"),
              onTap: () => null),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("My Account"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.calendar_month),
            title: Text("Expense Calender"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.share_sharp),
            title: Text("Share"),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("How to use"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.headphones),
            title: Text("Help & Support"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Exit"),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
