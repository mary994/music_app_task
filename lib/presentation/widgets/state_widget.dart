import 'package:flutter/material.dart';
import 'package:music_app/core/state/state_types.dart';
import 'package:music_app/core/utils.dart';
import 'package:music_app/generated/app_text.dart';
import 'package:music_app/presentation/widgets/space.dart';

// ignore: must_be_immutable
class AppStateWidget<T> extends StatelessWidget {
  AppStateWidget(
      {Key? key,
      this.errorMessage,
      this.errorWidget,
      this.loadingWidget,
      this.onRetry,
      @required this.builder,
      @required this.state})
      : super(key: key);
  T? state;
  AppStateBuilder<T>? builder;
  Function? onRetry;
  String? errorMessage;
  Widget? loadingWidget;
  Widget? errorWidget;
  @override
  Widget build(BuildContext context) {
    if (state is Failable) {
      return errorWidget ??
          AppErrorState(onRetry: onRetry, message: errorMessage);
    }
    if (state is Loadable) {
      return loadingWidget ?? const AppLoadingState();
    }
    return builder?.call(state, context);
  }
}

class AppLoadingState extends StatelessWidget {
  const AppLoadingState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        key: ValueKey('AppLoadingState'),
        child: CircularProgressIndicator(
          color: AppConst.kAppSecondaryColor,
        ));
  }
}

class AppErrorState extends StatelessWidget {
  AppErrorState({Key? key, this.onRetry, this.message}) : super(key: key);
  Function? onRetry;
  String? message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(tr('error.message')),
          const VerticalSpace(5),
          ElevatedButton(
            onPressed: () {
              onRetry?.call();
            },
            child: Text(message ?? tr('error.try_again')),
          )
        ],
      ),
    );
  }
}

typedef AppStateBuilder<T> = Function(T? state, BuildContext context);
