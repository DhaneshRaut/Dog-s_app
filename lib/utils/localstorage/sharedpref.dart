import 'package:shared_preferences/shared_preferences.dart';

class UserPrefrences{
  static SharedPreferences? _pref;
  
  // get clean => UserPrefrences();

  static Future<void> _init() async {
    _pref ??= await SharedPreferences.getInstance();
  }

  static void addToCart({required String imageUrl}) async {
    await _init();
    List<String> cart= await  getCart();
    cart.add(imageUrl);
    await _pref?.setStringList('addToCart', cart);
  }

  static Future<List<String>> getCart() async {
    await _init();
    return _pref!.getStringList('addToCart') ?? [];
  }

  static void addToHistory({required String imageUrl}) async {
    await _init();
    List<String> cart= await  getHistory();
    cart.add(imageUrl);
    await _pref?.setStringList('history', cart);
  }

  static Future<List<String>> getHistory() async {
    await _init();
    return _pref!.getStringList('history') ?? [];
  }

  Future<void> clear() async {
    await _pref?.clear();
  }
  // static void generaterandomNumber({required int x}) async {
  //   await _init();
  //   int cart= await  getrandomnuber();
  //   cart.add(x);
  //   await _pref?.setInt('random number', cart);

  //    Future<int> getrandomnuber() async {
  //   await _init();
  //   return _pref!.getInt('random') ?? [];
  // }
  // }



}