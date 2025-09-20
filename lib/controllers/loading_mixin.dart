import 'package:flutter/material.dart';
import 'loading_service.dart';

mixin LoadingMixin {
  final LoadingService loadingService = LoadingService();

  void showLoading(BuildContext context, {String? animationPath}) {
    loadingService.showLoading(context, animationPath: animationPath);
  }

  void hideLoading() {
    loadingService.hideLoading();
  }

  Future<T> runWithLoader<T>(
    BuildContext context,
    Future<T> Function() asyncFunction, {
    String? animationPath,
  }) async {
    showLoading(context, animationPath: animationPath);
    try {
      final result = await asyncFunction();
      hideLoading();
      return result;
    } catch (e) {
      hideLoading();
      rethrow;
    }
  }
}
