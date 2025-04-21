import 'package:expr/src/screens/home.dart';
import 'package:expr/src/screens/sign_in.dart';
import 'package:expr/src/widgets/auth.dart';
import 'package:expr/src/widgets/fade_transition_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'app shell');
final todoNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'todo shell');

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<StatefulWidget> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TodoListAuth auth = TodoListAuth();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) {
        if (child == null) {
          throw ('No child in .router constructor builder');
        }
        return TodoListAuthScope(notifier: auth, child: child);
      },
      routerConfig: GoRouter(
        refreshListenable: auth,
        debugLogDiagnostics: true,
        initialLocation: '/todo/home',
        redirect: (context, state) {
          final signedIn = TodoListAuth
              .of(context)
              .signedIn;
          if (state.uri.toString() != '/sign-in' && !signedIn) {
            return '/sign-in';
          }
          return null;
        },
        routes: [
          ShellRoute(
              routes: [
                GoRoute(
                    path: '/todo/home',
                    builder: (context, state) {
                      return HomeScreen();
                    }
                )
              ]
          ),
          GoRoute(
            path: '/sign-in',
            builder: (context, child) {
              return Builder(
                builder: (context) {
                  return SignInScreen(
                    onSignIn: (value) async {
                      final router = GoRouter.of(context);
                      await TodoListAuth.of(
                        context,
                      ).signIn(value.username, value.password);
                      router.go('/todo/home');
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
