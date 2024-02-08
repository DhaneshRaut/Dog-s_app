import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_2_dogapp/bloc/history/history_state.dart';
import 'package:flutter_application_2_dogapp/utils/localstorage/sharedpref.dart';



class HistoryCubit extends Cubit<HistoryState>{
  HistoryCubit({required }):super(HistoryState());

void getCartProducts() async{
emit(state.copyWith(status: HomeStatus.loading, ));
final response = await UserPrefrences.getHistory();
 var randomnum = Random().nextInt(1000);
// final total=await Cart().getTotal();
// print('object $total');
print('response1 $response');
if(response.isEmpty){
emit(state.copyWith(error: "Histroy is Empty ",status: HomeStatus.error,
total: 0, 
));

}else{
emit(state.copyWith( cartList: response,status: HomeStatus.loaded));

}

// final response = await  cartRepository.getCartProducts();
// response.fold((l) {
//   emit(state.copyWith(isError: true,error: l.message));
// }, (r) {
//   emit(state.copyWith(isSuccess: true,isLoading: false,cartProductList: r));
// });

}


}