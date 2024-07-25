import 'package:dalel/core/router/app_router.dart';
import 'package:dalel/features/home/presentation/widgets/home_sections.dart';
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
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: HomeAppBarSection()),
              SliverToBoxAdapter(child: HistoricalPeroidsSection()),
              SliverToBoxAdapter(child: HistoricalCharacters()),
              SliverToBoxAdapter(child: HistoricalSouvenirs()),
            ],
          ),
        ),
      ),
    );
  }

  void didTapOnLogoutBtn() async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return; // Check if widget is still mounted
    replacementNavigateTo(context, AppRouter.signIn);
  }
}
