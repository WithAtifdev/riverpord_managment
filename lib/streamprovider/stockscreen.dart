import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpord_management/streamprovider/streamprovider.dart';

class StockScreen extends ConsumerWidget {

  const StockScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockPrice = ref.watch(stockPriceProvider);

    return Scaffold(
      body: Center(
        child: stockPrice.when(
          data: (price) => Text(
           price.toStringAsFixed(2),
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ),
    );
  }
}