import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_2_dogapp/bloc/add_to_cart/add_to_cart_state.dart';
import 'package:flutter_application_2_dogapp/utils/localstorage/sharedpref.dart';



class CartCubit extends Cubit<CartState>{
  CartCubit({ required}):super(CartState( ));
  
  

  void getCartProducts() async{
    emit(state.copyWith(status: HomeStatus.loading));
    final response = await UserPrefrences.getCart();
     var randomnum = Random().nextInt(1000);
    // final total=await Cart().getTotal();
    // print('object $total');
    print('response1 $response');
    if(response.isEmpty){
      emit(state.copyWith(error: "Cart is Empty ",status: HomeStatus.error,
      // total: 0
      ));

    }else{
      emit(state.copyWith( cartList: response,status: HomeStatus.loaded, generaterandomNumber: randomnum ));

    }

    // final response = await  cartRepository.getCartProducts();
    // response.fold((l) {
    //   emit(state.copyWith(isError: true,error: l.message));
    // }, (r) {
    //   emit(state.copyWith(isSuccess: true,isLoading: false,cartProductList: r));
    // });

  }


}