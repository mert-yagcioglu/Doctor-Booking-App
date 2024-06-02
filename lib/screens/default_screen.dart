import 'package:doctor_booking_app_with_flutter_and_bloc/screens/booking_screen.dart';
import 'package:doctor_booking_app_with_flutter_and_bloc/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'booking_screen.dart';
import 'chat_screen.dart';
import 'homescreen2.dart';

class DefaultView extends StatefulWidget {

  _DefaultViewState createState() => _DefaultViewState();
}

class _DefaultViewState extends State<DefaultView> {
  int selectedPage = 0;
  final _pageOptions = [
    const HomeView(),
    BookingScreen(),
    const HomeScreen2(),

  ];

  Widget build(BuildContext context) {

    int _selectedIndex = 0;
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        selectedPage = index;
        print(_selectedIndex);
      });
    }
    // Create a bloc and provide it to the HomeView
    return Scaffold(
      body:_pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 11,
        selectedIconTheme: IconThemeData(color: Colors.blueAccent, size: 35),
        selectedItemColor: Colors.blueAccent,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        mouseCursor: SystemMouseCursors.grab,
        //currentIndex: _selectedIndex, //New
        //onTap: _onTapItem, //New
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Randevularım',
          ),
          //BottomNavigationBarItem(
          //  icon: Icon(Icons.video_call),
          //  label: 'Görüntülü Görüşme',
          //),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Mesajlaşma',
          ),
          //BottomNavigationBarItem(
          //  icon: Icon(Icons.chat),
          //  label: 'Mesajlaşma',
          //),
        ],
        currentIndex: selectedPage,
        onTap: _onItemTapped,             //New
      ),
      //body: Column(
      //  children: Text('Home Screen 2 içeriği burada yer almalı.'),
      //),

    );
  }

  Widget bodyContainer(index) {
    if(index == 0)
      {
        return HomeView();
      }

    else if(index == 1)
    {
      return BookingScreen();
    }

    else if(index == 2)
    {
      return ChatScreen();
    }

    //else if(index == 3)
    //{
    //  return HomeScreen2();
    //}

    else
    {
      return Scaffold(body: Text('Hata Durumu'),);
    }
  }
}