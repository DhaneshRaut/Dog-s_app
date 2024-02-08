// home_page.dart
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_2_dogapp/bloc/home_page/dog_bloc.dart';
import 'package:flutter_application_2_dogapp/bloc/home_page/dog_event.dart';
import 'package:flutter_application_2_dogapp/bloc/home_page/dog_state.dart';
import 'package:flutter_application_2_dogapp/utils/localstorage/sharedpref.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final int x=generateRandomNumber();
  // String randomNumber = 'x';
  @override
  Widget build(BuildContext context ,) {
    return Scaffold(
      appBar: AppBar(
     
        title: const Text(' Home')),
      body: BlocBuilder<DogBloc, DogState>(
        builder: (context, state) {
          if (state is DogLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DogLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(child: Text("Welcome to Dog App !!!", 
                   style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 300,
                      width: 300,
                      child: ListTile(title: Image.network(state.dog.message)
                      ,
                      // subtitle: 
                      //  Text(
                      //             ' ${x}'
                      // )
                      // ,
                      ),
                ),
                
                ),
                SizedBox(
                  height: 10,
                ),

                 

                Center(
                  child: ElevatedButton(
                    
                    onPressed: () => context.read<DogBloc>().add(FetchDog()),
                    child: const Text('Fetch New Dog'),
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: SizedBox(
                    height: 30,
                  width: 130,
                    child: ElevatedButton(
                      onPressed: () async{
                                  
                        
                                  
                        UserPrefrences.addToCart(imageUrl: state.dog.message);
                        // int generateRandomNumber() {
                        // final random = Random();
                        // return random.nextInt(1000); 
                        // Adjust the range as needed
                                  }
                        // setState((){
                        //   randomNumber = Random().nextInt(1001).toString();
                        // });
                                  
                                  
                      ,
                      child: const Text('Add to Cart' , ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent
                      ),
                      
                    ),
                  ),
                  
                ),
                SizedBox(height: 15,)
                ,
                SizedBox( 
                  height: 30,
                  width: 130,
                  child: ElevatedButton(onPressed: (){
                    var clean = UserPrefrences();
                    clean.clear();
                
                  }, child: Text("Clear Data") , ),
                )
              ] 
                
            );
            
          } else if (state is DogError) {
            return Center(child: Text(state.message));
          }
          return Container(); // Handle other states if needed
        },
      ),
    );
  }
}

generateRandomNumber() {
   final total = Random();
  return total.nextInt(1000);

}



