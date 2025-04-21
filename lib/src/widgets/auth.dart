import 'package:flutter/cupertino.dart';

class TodoListAuth extends ChangeNotifier {

  bool _signedIn = false;

  bool get signedIn => _signedIn;

  static TodoListAuth of(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<TodoListAuthScope>()!
          .notifier!;

  Future<bool> signIn(String username, String password) async {
    await Future<void>.delayed(const Duration(microseconds: 200));

    _signedIn = true;
    notifyListeners();
    return _signedIn;
  }
}

class TodoListAuthScope extends InheritedNotifier<TodoListAuth> {
  const TodoListAuthScope({
    required super.notifier,
    required super.child,
    super.key,
  });
}
