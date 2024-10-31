import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BasePage<T extends StateNotifier<S>, S> extends ConsumerStatefulWidget {
  final StateNotifierProvider<T, S> provider;
  BasePage({super.key, required this.provider});
}

abstract class BasePageConsumerState<T extends StateNotifier<S>, S> extends ConsumerState<BasePage<T, S>> {
  T get pageModel => ref.read(widget.provider.notifier);
  S get read => ref.read(widget.provider);
  void listen(void Function(S? previous, S next) listener) => ref.listen(widget.provider, listener);

  Widget renderPage(BuildContext context, S pageState);

  @override
  Widget build(BuildContext context) {
    final pageState = ref.watch(widget.provider);
    return renderPage(context, pageState);
  }
}