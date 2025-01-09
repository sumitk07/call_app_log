import 'package:flutter/material.dart';
import './lead_profile_screen.dart';

class LeadsScreen extends StatelessWidget {
  const LeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('Leads'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.download), onPressed: () {}),
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          _buildViewSelector(),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              padding: const EdgeInsets.all(16),
              itemBuilder: _buildLeadCard,
            ),
          ),
          _buildBottomNav(),
        ],
      ),
    );
  }

  Widget _buildViewSelector() {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Row(
        children: const [
          Text(
            'System Default View (2233)',
            style: TextStyle(color: Color(0XFF1148a5)),
          ),
          Icon(Icons.arrow_drop_down, color: Color(0XFF1148a5)),
        ],
      ),
    );
  }

  Widget _buildLeadCard(BuildContext context, int index) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LeadProfileScreen()),
      ),
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: const Text('S'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Shahidha',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('shahidha28@gmail.com',
                            style: TextStyle(color: Colors.grey[600])),
                        Text('+91-9964862378',
                            style: TextStyle(color: Colors.grey[600])),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoColumn('Lead Status', 'Unverified'),
                  _buildInfoColumn('Lead Score', '1'),
                  _buildInfoColumn('Registration Date', '24/12/2024'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.people, 'Leads', true),
          _buildNavItem(Icons.bar_chart, 'My Workspace', false),
          _buildNavItem(Icons.grid_view, 'More', false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? Color(0XFF1148a5) : Colors.grey),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Color(0XFF1148a5) : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
