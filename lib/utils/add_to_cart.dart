import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_2_dogapp/bloc/add_to_cart/add_to_cart_bloc.dart';
import 'package:flutter_application_2_dogapp/bloc/add_to_cart/add_to_cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class AddToCartPage extends StatelessWidget {
  const AddToCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Implement the Add to Cart functionality and display the total
    return BlocProvider<CartCubit>(
        create: (context) =>
           CartCubit()..getCartProducts(),
    child: Scaffold(
      appBar: AppBar(
        title: const Text(' Add to Cart')),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          // decoration: BoxDecoration(
          //     gradient: LinearGradient(colors: [
          //   hexStringToColor("CB2B93"),
          //   hexStringToColor("9546C4"),
          //   hexStringToColor("5E61F4")
          // ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height*0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text('Your Cart!!!',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        BlocConsumer<CartCubit, CartState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              // print('qtt $quantity');
                              print("check${state.status}");
                              if (state.status ==HomeStatus.loading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (state.status ==HomeStatus.error) {
                                return SizedBox(
                                  height: 100,
                                  child: Center(
                                    child: Text(
                                      state.error,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                );
                              }
                              if (state.status ==HomeStatus.loaded) {
                                var cart = state.cartList;
                                return SingleChildScrollView(
                                  child: ListView.builder(
                                      physics: ScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: cart!.length,
                                      itemBuilder: (context, index) {
                                        return getCartProductCard(
                                            data:cart[index],
                                            index: index,
                                            context: context,
                                            price : generateRandomNumber());
                                      }),
                                );
                              }
                              return SizedBox();
                            })


                      ],
                    ),
                  ),

                  BlocBuilder<CartCubit,CartState>(
                    builder: (context, state) {
                      // if(state.isSuccess){
                      //
                      // }
                      return Container(
                        // padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        margin: const EdgeInsets.fromLTRB(15, 10, 25, 0),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(90),
                            color: Colors.white
                        ),
                        child:Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // const Text('Grand Total: R ' ,
                            //     textAlign: TextAlign.center,
                            //     style: TextStyle(
                            //         color: Colors.black,
                            //         fontSize: 18,
                            //         fontWeight: FontWeight.w800)),

                            // Text('${state.total}\$ ',
                            //     textAlign: TextAlign.start,
                            //     style: const TextStyle(
                            //         color: Colors.black,
                            //         fontSize: 18,
                            //         fontWeight: FontWeight.w800)),
                    //                  Text(
                    //               ' ${generateRandomNumber()}',
                    //               style: const TextStyle(
                    //                 color: Colors.black,
                    //                 fontSize: 18,
                    //                 fontWeight: FontWeight.w800,
                    //   ),
                    // ),



                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    ));
  }

  getCartProductCard(
      {required String data,
        required int index,
        required BuildContext context, 
        required int price}) {
    // double total=(data.quantity)*(data.price);
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: 70,
                width: 70,
                child: Image.network(
                  data,
                  fit: BoxFit.contain,
                ),
                ),
                Text(
              'Price: \₹$price\/-',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
                ),
            
            //
            // InkWell(
            //     onTap: () async {
            //       await Cart().removeFromCart(index);
            //       context.read<CartCubit>()..getCartProducts();
            //     },
            //     child: Icon(Icons.delete_forever_outlined))
          ],
        ),
      ),
    );
  }
  
  
  int generateRandomNumber() {
    final total = Random();
  return total.nextInt(1000);
  }
}
