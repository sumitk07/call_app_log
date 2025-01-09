import 'package:flutter/material.dart';

class LeadProfileScreen extends StatelessWidget {
  const LeadProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Lead Profile'),
        ),
        body: Column(
          children: [
            _buildProfileCard(),
            _buildActionButtons(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: TabBar(
                isScrollable: true,
                tabs: const [
                  Tab(text: 'Lead Details'),
                  Tab(text: 'Timeline'),
                  Tab(text: 'Follow up & Notes'),
                  Tab(text: 'Communication Logs'),
                  Tab(text: 'Call Logs'),
                ],
                labelColor: Color(0XFF1148a5),
                unselectedLabelColor: Colors.grey,
                indicatorColor: Color(0XFF1148a5),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildLeadDetails(),
                  const Center(child: Text('Timeline')),
                  const Center(child: Text('Follow up & Notes')),
                  const Center(child: Text('Communication Logs')),
                  _buildCallLogs(),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Trilok J Pandya',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [
                    Text('Lead Stage'),
                    SizedBox(height: 4),
                    Text('Call back',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: const [
                    Text('Lead Score'),
                    SizedBox(height: 4),
                    Text('23', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildCircularButton(Icons.email, Color(0XFF1148a5)),
        _buildCircularButton(Icons.chat_bubble, Color(0XFF1148a5)),
        _buildCircularButton(Icons.phone, Color(0XFF1148a5)),
        _buildCircularButton(Icons.person_add, Color(0XFF1148a5)),
      ],
    );
  }

  Widget _buildCircularButton(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }

  Widget _buildLeadDetails() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDetailRow('Name', 'Trilok J Pandya'),
        _buildDetailRow('Email Address', 'Trilokjpandta@yahoo.com'),
        _buildDetailRow('Mobile Number\nCountry Dial Code', '+91'),
        _buildDetailRow('Mobile Number', '9374447442'),
        _buildDetailRow('Alternate Mobile\nDial Code', 'NA'),
        _buildDetailRow('Alternate\nMobile Number', 'NA'),
        _buildDetailRow('State', 'State Not Available'),
        _buildDetailRow('City', 'City Not Available'),
        _buildDetailRow('Lead Stage', 'Call back'),
        _buildDetailRow('Lead Sub Stage', 'Ask for call back today'),
        _buildDetailRow('Lead Stage Changed', '4'),
        _buildDetailRow('FB State', 'NA'),
        _buildDetailRow('FB City', 'NA'),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child:
                Text(label, style: const TextStyle(color: Color(0XFF1148a5))),
          ),
          const Text(' : '),
          Expanded(
            flex: 3,
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget _buildCallLogs() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    children: [
                      Text('Inbound Call'),
                      SizedBox(height: 4),
                      Text('0', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    children: [
                      Text('Outbound Call'),
                      SizedBox(height: 4),
                      Text('2', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _buildCallLogItem(
                  '06 Dec 2024 11:15 AM',
                  'Rohit Kumar called Trilok J Pandya and had a conversation for 25 Sec at 06/12/2024, 11:15 am.',
                  5),
              _buildCallLogItem(
                  '04 Dec 2024 11:29 AM',
                  'Rohit Kumar called Trilok J Pandya and had a conversation for 359 Sec at 04/12/2024, 11:29 am.',
                  5),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCallLogItem(String dateTime, String description, int duration) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0XFF1148a5), width: 2),
                ),
              ),
              const SizedBox(width: 8),
              Text(dateTime),
              const Spacer(),
              Text(
                '+$duration',
                style: const TextStyle(color: Color(0XFF1148a5)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(description),
                const Text(
                  'View Details -(In-App Calling)',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
