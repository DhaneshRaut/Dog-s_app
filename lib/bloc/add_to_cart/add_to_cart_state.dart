import 'package:equatable/equatable.dart';


enum HomeStatus {
  initial,
  loading,
  loaded,
  error,
}
class CartState extends Equatable{
  const CartState( {
    this.status=HomeStatus.initial,
    this.error='',
    this.cartList,
    this.total=0,
    //  required this.generateRandomNumber  ,


  });
  final HomeStatus status;
  final String error;
  final int total;
  // final int generateRandomNumber;
  final List<String>?  cartList;

  CartState copyWith({
    HomeStatus? status,
    String? error,
    List<String>?  cartList,
    int? total,
    int? generaterandomNumber,
  }){
    return CartState(
      // generateRandomNumber: generateRandomNumber ?? this.generateRandomNumber,
        total: total ?? this.total,
        status: status ?? this.status,
        error: error ?? this.error,
        cartList: cartList ?? this.cartList,
    );

  }

  @override
  List<Object?> get props => [cartList,status,
  total
  // ,
  // generateRandomNumber
  ];

}

