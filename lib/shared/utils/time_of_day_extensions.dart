import 'package:flutter/material.dart';

extension TimeOfDayExtensions on TimeOfDay {
  toCustomString() {
    String period = this.period == DayPeriod.am ? 'Ö.Ö.' : 'Ö.S.';
    return '${hourOfPeriod.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
  }
}
