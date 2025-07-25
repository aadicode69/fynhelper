import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> teamMembers = [
      {
        "name": "Aaditya Goyal",
        "image": "assets/images/my.jpg",
        "linkedin": "aadityagoyal-net"
      },
      {
        "name": "Utkarsh Raj",
        "image": "assets/images/pf3.jpg",
        "linkedin": "utkarsh-raj-a91b83245"
      },
      {
        "name": "Saksham Singh",
        "image": "assets/images/pf5.jpg",
        "linkedin": "saksham-singh-4203a5346"
      },
      {
        "name": "Naina Verma",
        "image": "assets/images/pf2.jpg",
        "linkedin": "naina-verma-3755242b4"
      },
      {
        "name": "Yogita Upadhyay",
        "image": "assets/images/profilepic1.jpg",
        "linkedin": "yogita-upadhyay-0020172b0"
      },
      {
        "name": "Gargi Lohiya",
        "image": "assets/images/pf4.jpg",
        "linkedin": "gargi-lohia-750393372"
      },
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff022d33), Color(0xFFbbdefb)],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),

            // 🌟 Content
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'FynHelper',
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff022d33),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Smartly Manage Your Finances',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'FynHelper helps you manage your finances effectively. From daily expenses to budgeting and alerts, we empower users with smart tools for a financially healthy life.',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.grey[900],
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1.2,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Meet Our Team',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1.2,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ...teamMembers.map((member) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.85),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: const Offset(2, 4),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.blueAccent, width: 2),
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                member['image']!,
                                width: 65,
                                height: 65,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  member['name']!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.link,
                                        size: 16,
                                        color: Colors.blueGrey),
                                    const SizedBox(width: 4),
                                    Text(
                                      "LinkedIn: ${member['linkedin']}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                    const SizedBox(height: 30),
                    Text(
                      'Made with ❤️ by Team FynHelper',
                      style: GoogleFonts.poppins(
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                        color: Colors.grey[100],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/dashboard');
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.black87),
                ),
                title: Text(
                  'About Us',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                centerTitle: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
