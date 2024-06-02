import 'package:doctor_booking_app_with_flutter_and_bloc/screens/contacts_screen.dart';
import 'package:doctor_booking_app_with_flutter_and_bloc/screens/default_screen.dart';
import 'package:doctor_booking_app_with_flutter_and_bloc/screens/appointment_screen.dart'; // Yeni eklenen satır
import 'package:doctor_booking_app_with_flutter_and_bloc/screens/chat_screen.dart'; // Yeni eklenen satır

import 'state/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repositories/doctor_repository.dart';
import 'screens/home_screen.dart';
import 'shared/theme/app_theme.dart';

// File imports
import 'package:doctor_booking_app_with_flutter_and_bloc/screens/home_screen.dart';
import 'package:doctor_booking_app_with_flutter_and_bloc/screens/default_screen.dart';
import 'package:doctor_booking_app_with_flutter_and_bloc/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'repositories/doctor_repository.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/doctor_categories_screen.dart';
import 'screens/doctor_list_screen.dart';
import 'screens/doctor_profile_screen.dart';
import 'screens/booking_screen.dart';
import 'screens/select_package_screen.dart';
import 'screens/input_patient_details_screen.dart';
import 'shared/theme/app_theme.dart';
import 'state/home/home_bloc.dart';

void main() {
  final doctorRepository = DoctorRepository();
  runApp(AppScreen(doctorRepository: doctorRepository));
}

class AppScreen extends StatelessWidget {
  const AppScreen({
    super.key,
    required this.doctorRepository,
  });

  final DoctorRepository doctorRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: doctorRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(doctorRepository: doctorRepository)
              ..add(LoadHomeEvent()),
          ),
        ],
        child: MaterialApp(
          title: 'Psikolog Uygulamasi',
          theme: const AppTheme().themeData,
          initialRoute: '/',
          routes: {
            '/': (context) => LoginScreen(),
            '/home': (context) => DefaultView(),
            '/register': (context) => RegisterScreen(),
            '/categories': (context) => DoctorCategoriesScreen(),
            '/doctorList': (context) => DoctorListScreen(),
            '/doctorProfile': (context) => DoctorProfileScreen(),
            '/booking': (context) => BookingScreen(),
            '/selectPackage': (context) => SelectPackageScreen(),
            '/inputDetails': (context) => InputPatientDetailsScreen(),
            '/appointment': (context) => AppointmentScreen(), // Yeni eklenen rota
            '/chat': (context) => ChatScreen(), // Yeni eklenen
            '/contacts': (context) => ContactsScreen(), // Yeni eklenen rota
          },
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
