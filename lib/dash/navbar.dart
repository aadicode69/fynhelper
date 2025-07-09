import 'package:flutter/material.dart';
import 'package:fynhelper/sidebar_pages/help&support.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fynhelper/home/login_page.dart';
import 'package:fynhelper/sidebar_pages/about_us.dart';
import 'package:fynhelper/sidebar_pages/share_page.dart';
import 'package:fynhelper/sidebar_pages/my_account.dart';
import 'package:fynhelper/sidebar_pages/howtouse.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFF6FAFF), // Light pastel bg
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg'),
                  fit: BoxFit.cover),
            ),
            accountName: Text(
              'Aaditya',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            accountEmail: Text(
              'aadityagoyal@gmail.com',
              style: GoogleFonts.poppins(color: Colors.white70),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/my.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          _buildNavItem(
            context,
            icon: Icons.home_outlined,
            label: "Home",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Login()));
            },
          ),
          _buildNavItem(
            context,
            icon: Icons.info_outline,
            label: "About Us",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AboutUs()));
            },
          ),
          _buildNavItem(
            context,
            icon: Icons.person_outline,
            label: "My Account",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => MyAccount()));
            },
          ),
          _buildNavItem(
            context,
            icon: Icons.calendar_today_outlined,
            label: "Expense Calendar",
            onTap: () {
              // Add your navigation here
            },
          ),
          _buildNavItem(
            context,
            icon: Icons.share_outlined,
            label: "Share",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SharePage()));
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Divider(),
          ),
          _buildNavItem(
            context,
            icon: Icons.help_outline,
            label: "How to Use",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const HowToUsePage()));
            },
          ),
          _buildNavItem(
            context,
            icon: Icons.headset_mic_outlined,
            label: "Help & Support",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const HelpSupportPage()));
            },
          ),
          _buildNavItem(
            context,
            icon: Icons.logout,
            label: "Exit",
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 15,
          color: Colors.black87,
        ),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      hoverColor: Colors.blue.shade50,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
    );
  }
}
