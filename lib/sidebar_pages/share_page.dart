import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SharePage extends StatelessWidget {
  const SharePage({super.key});

  final String shareLink = 'https://www.fynhelper.com/app';
  final String instagram = 'https://www.instagram.com/aaditya_.ig/';
  final String linkedin = 'https://linkedin.com/in/aadityagoyal-net';
  final String email = 'mailto:aadityagoyalofficial@gmail.com';

  void _copyAndToast(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Coped to Clipboard!',
        style: GoogleFonts.comfortaa(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.deepPurple.shade200,
    ));
  }

  void _showBottomContact(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[100],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Contact Us",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            _contactTile(
                context, Icons.camera_alt_outlined, "Instagram", instagram),
            _contactTile(context, Icons.business_center, "LinkedIn", linkedin),
            _contactTile(context, Icons.email_outlined, "Email", email),
          ],
        ),
      ),
    );
  }

  Widget _contactTile(
      BuildContext context, IconData icon, String title, String data) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.deepPurple,
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
        trailing: IconButton(
          onPressed: () => _copyAndToast(context, data),
          icon: const Icon(
            Icons.copy,
            color: Colors.black45,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f8fc),
      appBar: AppBar(
        title: Text(
          'Share',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.share_rounded,
                    size: 60,
                    color: Colors.deepPurple,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Share FynHelper',
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Invite your friends and help them manage their finances!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Your Invite Link',
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      shareLink,
                      style: GoogleFonts.poppins(
                        fontSize: 14.5,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => _copyAndToast(context, shareLink),
                    icon: const Icon(
                      Icons.copy,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  elevation: 4,
                ),
                onPressed: () => _showBottomContact(context),
                icon: const Icon(Icons.connect_without_contact),
                label: Text(
                  "Contact Us",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Divider(
              color: Colors.grey.shade400,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Tip : Sharing this app helps your friends save better. In addition, you become their financial guru 😎 as well",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 13, color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}
