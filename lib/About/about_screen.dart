import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Feminee',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Welcome to Feminee, a platform designed specifically to uplift marginalized women by providing access to education, resources, and support. Our mission is to empower women in underserved communities by offering learning opportunities, professional development, and a supportive network to help them thrive. Whether you’re looking to gain new skills, start a business, or simply learn more about your rights, Feminee is here to help you on your journey.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Our Courses',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'At Feminee, we offer a range of courses designed to equip marginalized women with practical skills and knowledge in areas such as financial literacy, digital skills, entrepreneurship, personal development, and more. Our courses are curated with the unique needs and challenges of women in mind, and are designed to be accessible, inclusive, and empowering.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Our Vision',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Our vision is to create an inclusive and supportive space where marginalized women can access the tools and knowledge they need to build better futures for themselves and their families. We are committed to breaking down barriers to education, ensuring that women from all backgrounds have the opportunity to learn, grow, and thrive.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Join Us',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Join the thousands of women around the world who have chosen Feminee as their platform for growth and development. By signing up today, you’ll gain access to courses, workshops, mentorship, and a community that understands and supports your journey.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 32),
              Text(
                'Frequently Asked Questions (FAQ)',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildFAQItem(
                'What is Feminee?',
                'Feminee is an online learning platform created to help marginalized women gain access to education, professional skills, and supportive communities. We offer a variety of courses and resources to help women enhance their lives and achieve their personal and professional goals.',
              ),
              _buildFAQItem(
                'How do I sign up?',
                'Signing up is simple and free! Click on the "Sign Up" button on our homepage, and follow the instructions to create an account. You can sign up using your email or social media accounts.',
              ),
              _buildFAQItem(
                'Are the courses free?',
                'We offer both free and affordable courses. Many of our courses are completely free, and some may require a small fee to cover costs. Please check the course details page for more information.',
              ),
              _buildFAQItem(
                'Can I get a certificate?',
                'Yes, upon successful completion of a course, you will receive a certificate that you can add to your resume or share with potential employers.',
              ),
              _buildFAQItem(
                'What if I face any difficulties?',
                'If you encounter any issues or need assistance, you can contact our support team through the "Help" section in the app, or you can email us directly at support@Feminee.com.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ExpansionTile(
        title: Text(
          question,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              answer,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
