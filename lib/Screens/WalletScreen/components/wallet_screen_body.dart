import 'package:flutter/material.dart';

class WalletScreenBody extends StatefulWidget {
  const WalletScreenBody({super.key});

  @override
  State<WalletScreenBody> createState() => _WalletScreenBodyState();
}

class _WalletScreenBodyState extends State<WalletScreenBody> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Wallet Screen"),
        ),
      ),
    );
  }
}
