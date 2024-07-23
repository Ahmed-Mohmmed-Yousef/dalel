import 'package:dalel/core/router/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: didTapOnLogoutBtn, icon: const Icon(Icons.logout)),
        ],
      ),
      body: const Center(
        child: Text("Home"),
      ),
    );
  }

  void didTapOnLogoutBtn() async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return; // Check if widget is still mounted
    replacementNavigateTo(context, AppRouter.signIn);
  }
}
