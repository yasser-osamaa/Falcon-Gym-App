import 'package:falcon_gym/features/gym/presentation/view/manager/web_view_gym_controller.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatelessWidget {
  const WebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WebViewBody());
  }
}

class WebViewBody extends StatelessWidget {
  const WebViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: GymContoller.controller);
  }
}
