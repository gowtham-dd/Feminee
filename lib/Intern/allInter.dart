import 'package:flutter/material.dart';

class FreelancingPage extends StatefulWidget {
  const FreelancingPage({super.key});

  @override
  State<FreelancingPage> createState() => _FreelancingPageState();
}

class _FreelancingPageState extends State<FreelancingPage> {
  // Updated list of freelancing jobs with government schemes and better job data
  List<Map<String, dynamic>> freelancingJobs = [
    {
      'companyName': 'Vocational Training Programme for Women',
      'projectType': 'Government',
      'region': 'Saravanaampatti',
      'startDate': '2025-03-01',
      'endDate': '2025-06-01',
      'neededPeople': 5,
      'details':
          'Vocational training to empower women with skills in various trades.',
      'skillRequired': 'Various Trades',
      'scheme': 'Ministry of Skill Development & Entrepreneurship',
    },
    {
      'companyName': 'Tailoring Skill Development',
      'projectType': 'Government',
      'region': 'Peelamedu',
      'startDate': '2025-04-01',
      'endDate': '2025-08-01',
      'neededPeople': 8,
      'details':
          'Tailoring skills training for women to help them start their own businesses.',
      'skillRequired': 'Tailoring',
      'scheme': 'Indiramma Mahila Shakti Scheme',
    },
    {
      'companyName': 'Skill Development in Various Trades',
      'projectType': 'Government',
      'region': 'Annur',
      'startDate': '2025-05-01',
      'endDate': '2025-07-01',
      'neededPeople': 6,
      'details':
          'Providing skill development in various trades for women to enhance employability.',
      'skillRequired': 'Various Trades',
      'scheme': 'Skill India Mission',
    },
    {
      'companyName': 'Tailoring Skill Development',
      'projectType': 'Government',
      'region': 'Coimbatore',
      'startDate': '2025-06-01',
      'endDate': '2025-09-01',
      'neededPeople': 4,
      'details':
          'Tailoring training aimed at improving women\'s skills in the textile industry.',
      'skillRequired': 'Tailoring',
      'scheme': 'SEWA Bharat\'s Skill Development Project',
    },
    {
      'companyName': 'Tailoring Training',
      'projectType': 'Government',
      'region': 'Saravanaampatti',
      'startDate': '2025-07-01',
      'endDate': '2025-10-01',
      'neededPeople': 10,
      'details':
          'A dedicated programme for women to learn tailoring skills and start their own businesses.',
      'skillRequired': 'Tailoring',
      'scheme': 'Caritas India\'s Tailoring Training Centre',
    },
  ];

  // Selected skill for filtering
  String? selectedSkill = 'All Skills';
  String? selectedRegion = 'Saravanaampatti';

  @override
  Widget build(BuildContext context) {
    // Filtered list based on selected skill and region
    List<Map<String, dynamic>> filteredJobs = freelancingJobs.where((job) {
      bool matchesSkill = selectedSkill == 'All Skills' ||
          job['skillRequired'] == selectedSkill;
      bool matchesRegion = job['region'] == selectedRegion;
      return matchesSkill && matchesRegion;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Trainings Nearby'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filter Dropdown for skills
            Row(
              children: [
                const Text('Filter by Skill:'),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: selectedSkill,
                  onChanged: (newValue) {
                    setState(() {
                      selectedSkill = newValue;
                    });
                  },
                  items: <String>[
                    'All Skills',
                    'Tailoring',
                    'Various Trades',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Region Dropdown for selecting a nearby district
            Row(
              children: [
                const Text('Select Region:'),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: selectedRegion,
                  onChanged: (newValue) {
                    setState(() {
                      selectedRegion = newValue;
                    });
                  },
                  items: <String>[
                    'Thudiyalur',
                    'Tirupur',
                    'Peelamedu',
                    'Saravanaampatti',
                    'Ukkadam',
                    'Annur'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // List of Freelancing Jobs (Filtered by Skill and Region)
            ListView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // Disable internal scroll
              itemCount: filteredJobs.length,
              itemBuilder: (context, index) {
                return _buildFreelanceTile(filteredJobs, index);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build the freelancing job tile with Expandable Details
  Widget _buildFreelanceTile(
      List<Map<String, dynamic>> filteredJobs, int index) {
    var job = filteredJobs[index];
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ExpansionTile(
        title: Text(job['companyName']),
        subtitle: Text('${job['projectType']} - ${job['region']}'),
        leading: const CircleAvatar(
          child: Icon(Icons.business),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Start Date: ${job['startDate']}'),
                Text('End Date: ${job['endDate']}'),
                Text('Needed People: ${job['neededPeople']}'),
                const SizedBox(height: 10),
                Text('Government Scheme: ${job['scheme'] ?? 'null'}'),
                const SizedBox(height: 10),
                Text('Details: ${job['details']}'),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    // You can navigate to a detailed view page or show a popup
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('More Details'),
                        content: Text(job['details']),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text('Get More Details'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
