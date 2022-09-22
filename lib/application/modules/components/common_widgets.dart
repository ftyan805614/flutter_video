import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polynesia/application/theme/index.dart';

class PageTopLargeTitleView extends StatelessWidget {
  final String title;
  const PageTopLargeTitleView(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title,
              style:
                  const TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold)),
          // IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        ],
      ),
    );
  }
}

// 加载占位视图
Widget buildPageLoadingView(BuildContext context) {
  return const Scaffold(
    body: SafeArea(
        child: Center(
      child: CupertinoActivityIndicator(
        radius: 14,
      ),
    )),
  );
}

Widget buildContentLoadingView(BuildContext context) {
  return const Center(
    child: CupertinoActivityIndicator(
      radius: 14,
    ),
  );
}

// 错误占位视图
Widget buildPageErrorView(BuildContext context, String text) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: TColor.primaryBackground,
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 17),
      leading: IconButton(
        color: Colors.black,
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.of(context).pop(),
      ),
      elevation: 0,
    ),
    body: SafeArea(
        child: Center(
      child: Text(text),
    )),
  );
}

//loading widget
void loadingDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const CupertinoAlertDialog(
          title: Text("Loading..."),
          content: CupertinoActivityIndicator(
            radius: 15,
          ),
        );
      });
}

//loading widget
void messageDialog(BuildContext context, String message) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(message),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text("Ok"),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          ],
        );
      });
}

Future<bool> showAlertDialog(
  BuildContext context,
  String title,
  String message, {
  String cancelText = "取消",
  String continueText = "继续",
}) async {
  //设置按钮

  Widget cancelButton = TextButton(
    child: Text(cancelText),
    onPressed: () {
      Navigator.of(context).pop(false);
    },
  );
  Widget continueButton = TextButton(
    child: Text(continueText),
    onPressed: () {
      Navigator.of(context).pop(true);
    },
  );

  //设置对话框
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  //显示对话框
  bool isSelect = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );

  return isSelect;
}

Widget leadingPrevious(Function? onTap) {
  return Center(
    child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsets.only(left: 18),
        width: 70,
        height: 28,
        child: Stack(
          children: const [
            Positioned(
              child: Icon(Icons.arrow_back_ios),
            ),
            Positioned(
              left: 18,
              child: Text(
                '上一步',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
    ),
  );
}
