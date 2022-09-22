import 'package:flutter/material.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends BaseWidget {
  final String url;
  String? title;
  WebPage(this.url, {Key? key, this.title}) : super(key: key);

  @override
  State<BaseWidget> getState() => _WebPageState();
}

class _WebPageState extends BaseWidgetState<WebPage> {
  late WebViewController _controller;
  String _pageTitle = "";
  @override
  void initState() {
    if (widget.title != null) {
      _pageTitle = widget.title ?? "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pageTitle,
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ),
        backgroundColor: TColor.appBarBackground,
        centerTitle: true,
      ),
      backgroundColor: TColor.primaryBackground,
      body: WebView(
        initialUrl: widget.url,
        //JS执行模式 是否允许JS执行
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          _controller = controller;
          // controller.loadUrl(Uri.dataFromString(htmlStr,
          //         mimeType: 'text/html',
          //         encoding: Encoding.getByName('utf-8'))
          //     .toString());
        },
        onPageFinished: (url) {
          //调用JS得到实际高度
          _controller
              .evaluateJavascript("document.documentElement.clientHeight;")
              .then((result) {
            if (!mounted) return;

            setState(() {
              // _height = double.parse(result);
              // print("高度$_height");
            });
          });

          _controller.getTitle().then((value) {
            if (widget.title != null) {
              return;
            }

            if (!mounted) return;

            setState(() {
              _pageTitle = value ?? "";
            });
          });
        },
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith("myapp://")) {
            // print("即将打开 ${request.url}");

            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
        javascriptChannels: <JavascriptChannel>{
          JavascriptChannel(
              name: "share",
              onMessageReceived: (JavascriptMessage message) {
                // print("参数： ${message.message}");
              }),
        },
      ),
    );
  }
}
