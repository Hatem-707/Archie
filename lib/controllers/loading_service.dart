import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingService {
  static final LoadingService _instance = LoadingService._internal();
  factory LoadingService() => _instance;
  LoadingService._internal();

  OverlayEntry? _overlayEntry;

  void showLoading(BuildContext context, {String? animationPath}) {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => LoadingOverlay(animationPath: animationPath),
    );

    Overlay.of(context)?.insert(_overlayEntry!);
  }

  void hideLoading() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

class LoadingOverlay extends StatelessWidget {
  final String? animationPath;

  const LoadingOverlay({Key? key, this.animationPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                animationPath ?? 'assets/animations/Loading.json',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 16),
              const Text('Loading...', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
