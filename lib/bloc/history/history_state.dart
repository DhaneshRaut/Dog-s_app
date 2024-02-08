import 'package:equatable/equatable.dart';


enum HomeStatus {
  initial,
  loading,
  loaded,
  error,
}
class HistoryState extends Equatable{
  const HistoryState({
    this.status=HomeStatus.initial,
    this.error='',
    this.historyList,
    // required this.generateRandomNumber
    this.total=0, 
    // required int generateRandomNumber


  });
  final HomeStatus status;
  final String error;
  final int total;
  final List<String>?  historyList;
  // final int generateRandomNumber;

  HistoryState copyWith({
    HomeStatus? status,
    String? error,
    List<String>?  cartList,
    // int? generaterandomNumber,
    int? total, 
    // required int generaterandomNumber,
  }){
    return HistoryState( 
      //  generateRandomNumber: generateRandomNumber ?? this.generateRandomNumber,
      total: total ?? this.total,
      status: status ?? this.status,
      error: error ?? this.error,
      historyList: cartList ?? this.historyList,
    );

  }

  @override
  List<Object?> get props => [historyList,status, 
  // generateRandomNumber
  total
  ];

}

