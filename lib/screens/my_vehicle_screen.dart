import 'package:flutter/material.dart';
import 'package:flash_fuel/widgets/main_scaffold.dart';

class MyVehiclesScreen extends StatelessWidget {
  const MyVehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 3, // Account tab
      child: Column(
        children: [
          AppBar(
            title: const Text(
              'My Vehicles',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            automaticallyImplyLeading: false,
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: MyVehicleList(),
            ),
          ),
        ],
      ),
    );
  }
}

class MyVehicleList extends StatelessWidget {
  const MyVehicleList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
       /* const VehicleCard(
          title: 'Motorcycles',
          icon: Icons.electric_scooter,
        ),
        const SizedBox(height: 12),
        const VehicleCard(
          title: 'Cars',
          icon: Icons.directions_car,
        ),
        const SizedBox(height: 12),
        const VehicleCard(
          title: 'Trucks',
          icon: Icons.local_shipping,
        ), */
        const SizedBox(height: 24),
        Center(
          child: Column(
            children: const [
              ActionButton(
                title: 'Add Vehicles',
                icon: Icons.add_box_outlined,
              ),
              SizedBox(height: 10),
              ActionButton(
                title: 'Remove Vehicles',
                icon: Icons.delete_outline,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class VehicleCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const VehicleCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.green, size: 28),
        title: Text(title, style: const TextStyle(fontSize: 16)),
        onTap: () {
          // Handle tap
        },
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String title;
  final IconData icon;

  const ActionButton({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 45,
      child: ElevatedButton.icon(
        onPressed: () {
          // Handle add/remove action
        },
        icon: Icon(icon, size: 18),
        label: Text(title, style: const TextStyle(fontSize: 14)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
