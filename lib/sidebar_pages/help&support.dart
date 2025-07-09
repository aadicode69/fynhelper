import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpSupportPage extends StatefulWidget {
  const HelpSupportPage({super.key});

  @override
  State<HelpSupportPage> createState() => _HelpSupportPageState();
}

class _HelpSupportPageState extends State<HelpSupportPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController subjectCtrl = TextEditingController();
  final TextEditingController messageCtrl = TextEditingController();

  bool _isSubmitting = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);

      Future.delayed(const Duration(seconds: 1), () {
        setState(() => _isSubmitting = false);
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (_) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle, size: 50, color: Colors.blueAccent),
                const SizedBox(height: 10),
                const Text(
                  "Thanks for your response!",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Our support team will get back to you soon.",
                  style: TextStyle(color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text("Okay", style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help & Support"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                "Need assistance? Fill out the form below and we’ll get back to you shortly.",
                style: TextStyle(color: Colors.black87, fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Name
              _buildField(
                controller: nameCtrl,
                label: "Full Name",
                validator: (val) =>
                val == null || val.trim().isEmpty ? "Please enter your name" : null,
              ),

              const SizedBox(height: 16),

              // Email
              _buildField(
                controller: emailCtrl,
                label: "Email",
                keyboardType: TextInputType.emailAddress,
                validator: (val) {
                  if (val == null || val.trim().isEmpty) return "Please enter your email";
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(val)) return "Enter a valid email";
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Subject
              _buildField(
                controller: subjectCtrl,
                label: "Subject",
                validator: (val) =>
                val == null || val.trim().isEmpty ? "Please enter a subject" : null,
              ),

              const SizedBox(height: 16),

              // Message
              _buildField(
                controller: messageCtrl,
                label: "Message",
                maxLines: 4,
                validator: (val) =>
                val == null || val.trim().isEmpty ? "Please enter your message" : null,
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isSubmitting
                      ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                  )
                      : const Text("Submit", style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      style: GoogleFonts.poppins(fontSize: 14.5),
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueAccent, width: 1.6),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
