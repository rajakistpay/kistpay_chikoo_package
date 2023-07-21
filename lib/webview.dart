







import 'core/app_export.dart';

class WebViewExample extends StatefulWidget {
  const WebViewExample({super.key, this.isTrue});

  final Function(bool)? isTrue;

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late final WebViewController _controller;
  bool loaded = true;
  @override
  void initState() {
    super.initState();

    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;

      params = const PlatformWebViewControllerCreationParams();


    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
            setState(() {
              loaded = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
        ),
      )
      ..addJavaScriptChannel(
        'Print',
        onMessageReceived: (JavaScriptMessage message) {
          print('afdafsdafsd ${message.message}');
          widget.isTrue!(true);
        },
      )
      ..loadRequest(Uri.parse('https://s3-group-landing-images.s3.me-south-1.amazonaws.com/index.html'));

    // #docregion platform_features

    // #enddocregion platform_features

    _controller = controller;

  }

  // void checkScrollEnd() async {
  //   final isScrollEnd = await _controller.evaluateJavascript(
  //       "window.innerHeight + window.scrollY >= document.body.scrollHeight");
  //
  //   if (isScrollEnd == 'true') {
  //     // Scrolling has reached the end.
  //     print('Scroll reached the end');
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: loaded
            ? const Center(child: CircularProgressIndicator())
            : WebViewWidget(controller: _controller));
  }

  Widget favoriteButton() {
    return FloatingActionButton(
      onPressed: () async {
        final String? url = await _controller.currentUrl();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Favorited $url')),
          );
        }
      },
      child: const Icon(Icons.favorite),
    );
  }
}

enum MenuOptions {
  showUserAgent,
  listCookies,
  clearCookies,
  addToCache,
  listCache,
  clearCache,
  navigationDelegate,
  doPostRequest,
  loadLocalFile,
  loadFlutterAsset,
  loadHtmlString,
  transparentBackground,
  setCookie,
}
