import 'package:flutter/material.dart';
import 'package:flutter_application_2_dogapp/bloc/add_to_cart/add_to_cart_bloc.dart';
import 'package:flutter_application_2_dogapp/bloc/home_page/dog_bloc.dart';
import 'package:flutter_application_2_dogapp/bloc/home_page/dog_event.dart';
import 'package:flutter_application_2_dogapp/service/api_service.dart';
import 'package:flutter_application_2_dogapp/utils/add_to_cart.dart';
import 'package:flutter_application_2_dogapp/utils/history_page.dart';
import 'package:flutter_application_2_dogapp/utils/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive_flutter/hive_flutter.dart';



void main() async { 
  // WidgetsFlutterBinding.ensureInitialized();
  
  // final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  // Hive.initFlutter(appDocumentDirectory.path);
//  await Hive.openBox<String>('dog_history');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dog App',   
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => DogBloc(DogService())..add(FetchDog())),
          BlocProvider(create: (context) => CartCubit()),
        ],
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  final screens = [
     HomePage(),
            HistoryPage(),
            AddToCartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // appBar: AppBar(
        //   title: Center(child: Text('Dog App')),
        //   // bottom: TabBar(
        //   //   tabs: [
        //   //     Tab(icon: Icon(Icons.home)),
        //   //     Tab(icon: Icon(Icons.history)),
        //   //     Tab(icon: Icon(Icons.shopping_cart)),
        //   //   ],
        //   // ),
        // ),
        body: 
        
        // TabBarView(
        //   children: [
        //     HomePage(),
        //     HistoryPage(),
        //     AddToCartPage(),
        //   ],
        // ),
        screens [currentIndex],
        bottomNavigationBar: BottomNavigationBar(   
          currentIndex: currentIndex,

          onTap: (index) => setState(()=> currentIndex = index) ,
          
          items: 
        [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home, ' , ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'history'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'shopping cart'),
          
        ]),
      ),
    );
  }
}
