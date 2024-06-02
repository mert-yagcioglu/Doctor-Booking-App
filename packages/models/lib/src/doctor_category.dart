import 'package:flutter/material.dart';

enum DoctorCategory {
  anesthesiology(
    name: 'Ergen Psikolojisi',
    icon: Icons.face,
  ),
  emergencyMedicine(
    name: 'Aile ve Çift Terapisi',
    icon: Icons.family_restroom,
  ),
  dentist(
    name: 'Yetişkin Psikolojisi',
    icon: Icons.self_improvement,
  ),
  dermatology(
    name: 'Sınav Kaygısı',
    icon: Icons.school,
  ),
  cardiology(
    name: 'Cinsel Terapi',
    icon: Icons.favorite,
  ),
  familyMedicine(
    name: 'Çocuk Psikolojisi',
    icon: Icons.child_care,
  ),
  generalSurgery(
    name: 'General Surgery',
    icon: Icons.health_and_safety_outlined,
  ),
  internalMedicine(
    name: 'Internal Medicine',
    icon: Icons.emergency_outlined,
  ),
  neurology(
    name: 'Neurology',
    icon: Icons.psychology_outlined,
  ),
  orthopedicSurgery(
    name: 'Orthopedic Surgery',
    icon: Icons.medication_liquid_sharp,
  ),
  pediatrics(
    name: 'Pediatrics',
    icon: Icons.medical_services_outlined,
  ),
  psychiatry(
    name: 'Psychiatry',
    icon: Icons.psychology_outlined,
  ),
  pulmonology(
    name: 'Pulmonology',
    icon: Icons.medical_services_outlined,
  );

  final String name;
  final IconData icon;

  const DoctorCategory({
    required this.name,
    required this.icon,
  });
}
