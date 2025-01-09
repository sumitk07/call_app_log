import 'package:flutter/material.dart';

class CallLogsScreen extends StatelessWidget {
  const CallLogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                tabs: const [
                  Tab(text: 'Lead Details'),
                  Tab(text: 'Timeline'),
                  Tab(text: 'Follow up & Notes'),
                  Tab(text: 'v up & Notes'),
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
                  const Center(child: Text('Follow up & Notes')),
                  const Center(child: Text('Communication Logs')),
                  _buildCallLogs(),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0XFF1148a5),
          onPressed: () {},
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Trilok J Pandya',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: const [
                    Text('Lead Stage',
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                    SizedBox(height: 4),
                    Text('Call back',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: const [
                    Text('Lead Score',
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCircularButton(Icons.email, Color(0XFF1148a5)),
          _buildCircularButton(Icons.chat_bubble, Color(0XFF1148a5)),
          _buildCircularButton(Icons.phone, Color(0XFF1148a5)),
          _buildCircularButton(Icons.person_add, Color(0XFF1148a5)),
        ],
      ),
    );
  }

  Widget _buildCircularButton(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  Widget _buildCallLogs() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: _buildCallTypeCard('Inbound Call', '0'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildCallTypeCard('Outbound Call', '2'),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              _buildCallLogItem(
                '06 Dec 2024 11:15 AM',
                'Rohit Kumar called Trilok J Pandya and had a conversation for 25 Sec at 06/12/2024, 11:15 am. View Details -(In-App Calling)',
                '+5',
              ),
              _buildCallLogItem(
                '04 Dec 2024 11:29 AM',
                'Rohit Kumar called Trilok J Pandya and had a conversation for 359 Sec at 04/12/2024, 11:29 am. View Details -(In-App Calling)',
                '+5',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCallTypeCard(String title, String count) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 8),
          Text(count,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildCallLogItem(String date, String description, String points) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Color(0XFF1148a5), width: 2),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date,
                    style: const TextStyle(
                        color: Color(0XFF1148a5), fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(description, style: const TextStyle(fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(points,
              style: const TextStyle(
                  color: Color(0XFF1148a5), fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
