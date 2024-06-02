import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class DoctorWorkingHours extends Equatable {
  final String id;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String dayOfWeek;

  const DoctorWorkingHours({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.dayOfWeek,
  });

  @override
  List<Object?> get props => [id, startTime, endTime, dayOfWeek];

  static const sampleDoctorWorkingHours = [
    DoctorWorkingHours(
      id: '1',
      startTime: TimeOfDay(hour: 8, minute: 0),
      endTime: TimeOfDay(hour: 12, minute: 0),
      dayOfWeek: 'Pazartesi',
    ),
    DoctorWorkingHours(
      id: '2',
      startTime: TimeOfDay(hour: 9, minute: 0),
      endTime: TimeOfDay(hour: 12, minute: 0),
      dayOfWeek: 'Salı',
    ),
    DoctorWorkingHours(
      id: '3',
      startTime: TimeOfDay(hour: 8, minute: 0),
      endTime: TimeOfDay(hour: 6, minute: 30),
      dayOfWeek: 'Çarşamba',
    ),
    DoctorWorkingHours(
      id: '4',
      startTime: TimeOfDay(hour: 9, minute: 15),
      endTime: TimeOfDay(hour: 6, minute: 30),
      dayOfWeek: 'Perşembe',
    ),
    DoctorWorkingHours(
      id: '5',
      startTime: TimeOfDay(hour: 9, minute: 15),
      endTime: TimeOfDay(hour: 12, minute: 30),
      dayOfWeek: 'Cuma',
    ),
    DoctorWorkingHours(
      id: '6',
      startTime: TimeOfDay(hour: 8, minute: 45),
      endTime: TimeOfDay(hour: 5, minute: 30),
      dayOfWeek: 'Cumartesi',
    ),
    DoctorWorkingHours(
      id: '7',
      startTime: TimeOfDay(hour: 8, minute: 45),
      endTime: TimeOfDay(hour: 5, minute: 0),
      dayOfWeek: 'Pazar',
    ),
  ];
}
