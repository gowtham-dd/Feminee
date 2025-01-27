import 'package:flutter/material.dart';

class AllIntern extends StatefulWidget {
  const AllIntern({super.key});

  @override
  State<AllIntern> createState() => _AllInternState();
}

class _AllInternState extends State<AllIntern> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('All Internships'),
      ),
      body: SingleChildScrollView(
        // This makes the body scrollable
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Horizontally scrollable tiles for courses/training images
              SizedBox(
                height: 120, // Adjust height of the tile container
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildTile('assets/intern1.jpg'),
                    _buildTile('assets/intern2.jpg'),
                    _buildTile('assets/intern3.jpg'),
                    _buildTile('assets/intern4.jpg'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  labelText: 'Search Internships',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 20),
              // List of Internships with company details
              ListView.builder(
                shrinkWrap:
                    true, // Makes the ListView take only the space it needs
                physics:
                    const NeverScrollableScrollPhysics(), // Disables inner scrolling
                itemCount: 10, // Replace with the actual count of internships
                itemBuilder: (context, index) {
                  return _buildInternTile(index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build a tile for the horizontal scroll
  Widget _buildTile(String imagePath) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      width: 100, // Adjust the width as necessary
      height: 100, // Adjust the height as necessary
    );
  }

  // Helper method to build the internship details tile
  Widget _buildInternTile(int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(
              'assets/company_logo.jpg'), // Placeholder for company logo
        ),
        title: Text('Company $index'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Internship Position $index'),
            const SizedBox(height: 5),
            Text('Mode of Teaching: ${index % 2 == 0 ? 'Online' : 'Offline'}'),
            const SizedBox(height: 5),
            Text('Area it is taught: Area $index'),
            const SizedBox(height: 5),
            Text('Duration: ${index * 2 + 3} weeks'),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () {
            // Navigate to the internship detail page
          },
        ),
      ),
    );
  }
}
