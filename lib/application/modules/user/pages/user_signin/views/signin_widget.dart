import 'dart:async';

import 'package:flutter/material.dart';
import 'package:polynesia/application/common/utils/color_util.dart';
import 'package:polynesia/application/common/utils/regexp_helper.dart';
import 'package:polynesia/application/common/utils/screen_adapter.dart';
import 'package:polynesia/application/common/widget/common_submit_buttom.dart';
import 'package:polynesia/application/data/index.dart';
import 'package:polynesia/application/modules/components/base/base_widget.dart';
import 'package:polynesia/application/modules/components/input_text_field.dart';
import 'package:polynesia/application/modules/user/pages/user_signin/viewModels/sign_view_model.dart';
import 'package:polynesia/application/services/index.dart';
import 'package:provider/provider.dart';

class SignInWidget extends BaseWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> getState() {
    return _SignInWidgetState();
  }
}

class _SignInWidgetState extends BaseWidgetState {
  final _textControllerUsername = TextEditingController(
          text: "harden"), // TextEditingController(text: "scott01"),
      _textControllerPassword = TextEditingController(
          text: "qwe123"), //TextEditingController(text: "123456"),
      _textControllePhone = TextEditingController(),
      _textControlleYzm = TextEditingController();
  bool _visiblePassword = false;
  bool _remberPwd = false;
  Timer? _countdownTimer;
  int _countdownNum = 59;

  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    super.dispose();
  }

  Widget _usernameWidget() {
    return SizedBox(
        height: 44.0,
        width: ScreenAdaper.getScreenWidth() -
            20 -
            ScreenAdaper.width(46) -
            ScreenAdaper.width(36),
        child: InputTextField(
          controller: _textControllerUsername,
          hintText: '用户名',
          prefixIcon: IconButton(
            icon: Image.asset(
              'assets/images/head.png',
              width: 18,
              height: 18,
            ),
            onPressed: () {},
          ),
          suffixIcon: IconButton(
            icon: Image.asset(
              'assets/images/clear.png',
              width: 18,
              height: 18,
            ),
            onPressed: () {
              _textControllerUsername.clear();
            },
          ),
          textInputAction: TextInputAction.next,
          borderRadius: const BorderRadius.all(Radius.circular(22)),
        ));
  }

  Widget _pwdWidget() {
    return SizedBox(
        height: 44.0,
        width: ScreenAdaper.getScreenWidth() -
            20 -
            ScreenAdaper.width(46) -
            ScreenAdaper.width(36),
        child: InputTextField(
          controller: _textControllerPassword,
          obscureText: !_visiblePassword,
          hintText: '请输入密码',
          prefixIcon: IconButton(
            icon: Image.asset(
              'assets/images/pwdl.png',
              width: 18,
              height: 18,
            ),
            onPressed: () {},
          ),
          suffixIcon: IconButton(
            icon: Image.asset(
              _visiblePassword
                  ? 'assets/images/eyeopen.png'
                  : 'assets/images/eyeclose.png',
              width: 18,
              height: 18,
            ),
            onPressed: () {
              setState(() {
                _visiblePassword = !_visiblePassword;
              });
            },
          ),
          textInputAction: TextInputAction.next,
          borderRadius: const BorderRadius.all(Radius.circular(22)),
        ));
  }

  ///手机号
  Widget _phoneWidget() {
    return SizedBox(
        height: 44.0,
        width: ScreenAdaper.getScreenWidth() -
            20 -
            ScreenAdaper.width(46) -
            ScreenAdaper.width(36),
        child: InputTextField(
          controller: _textControllePhone,
          hintText: '手机号',
          keyboardType: TextInputType.number,
          prefixIcon: IconButton(
            icon: Image.asset(
              'assets/images/phone.png',
              width: 18,
              height: 18,
            ),
            onPressed: () {},
          ),
          suffixIcon: IconButton(
            icon: Image.asset(
              'assets/images/clear.png',
              width: 18,
              height: 18,
            ),
            onPressed: () {
              setState(() {
                _textControllePhone.clear();
              });
            },
          ),
          textInputAction: TextInputAction.next,
          borderRadius: const BorderRadius.all(Radius.circular(22)),
        ));
  }

  ///验证码
  Widget _yzmWidget(TextButton yzmBtn) {
    return SizedBox(
        height: 44.0,
        width: ScreenAdaper.getScreenWidth() -
            20 -
            ScreenAdaper.width(46) -
            ScreenAdaper.width(36),
        child: InputTextField(
          controller: _textControlleYzm,
          hintText: '验证码',
          prefixIcon: IconButton(
            icon: Image.asset(
              'assets/images/yzm.png',
              width: 18,
              height: 18,
            ),
            onPressed: () {},
          ),
          suffixIcon: yzmBtn,
          textInputAction: TextInputAction.next,
          borderRadius: const BorderRadius.all(Radius.circular(22)),
        ));
  }

  Widget _remAndForgetWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /* FlatButton.icon(
            icon: Image.asset(
              _remberPwd
                  ? 'assets/images/rempwd_select.png'
                  : 'assets/images/rempwd_normal.png',
              width: 13,
              height: 13,
            ),
            label: const Text(
              "记住密码",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
            onPressed: () {
              setState(() {
                _remberPwd = !_remberPwd;
              });
            },
          )*/
          const Text("记住密码",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              )),
          TextButton(
            child: const Text(
              '忘记密码？',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  Widget _bottomWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            child: const Text(
              '先去逛逛',
              style: TextStyle(color: Colors.white, fontSize: 11),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text(
              '在线客服',
              style: TextStyle(color: Colors.white, fontSize: 11),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  Widget _goSigupWidget() {
    return SizedBox(
        width: ScreenAdaper.width(46),
        child: Consumer<SignViewModel>(builder: (_, viewModel, child) {
          return InkWell(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/regicon.png',
                  width: 20,
                  height: 20,
                ),
                const Text(
                  "注\n册\n新\n用\n户",
                  style: TextStyle(color: Colors.white, fontSize: 13),
                )
              ],
            ),
            onTap: () {
              viewModel.setIndex(1);
            },
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    UserService userService = Provider.of<UserService>(context);
    return Consumer<SignViewModel>(builder: (_, viewModel, child) {
      return Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Container(
          width: ScreenAdaper.getScreenWidth() - 20,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.2),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: [
              Container(
                width:
                    ScreenAdaper.getScreenWidth() - 20 - ScreenAdaper.width(46),
                // height: 318,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.2),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          child: Text(
                            '账密登录',
                            style: TextStyle(
                                color: viewModel.loginType == 0
                                    ? Colors.white
                                    : const Color.fromRGBO(234, 235, 238, 0.7),
                                fontSize: viewModel.loginType == 0 ? 16 : 14),
                          ),
                          onPressed: () {
                            viewModel.setLoginType(0);
                          },
                        ),
                        TextButton(
                          child: Text(
                            '手机号登录',
                            style: TextStyle(
                                color: viewModel.loginType == 1
                                    ? Colors.white
                                    : const Color.fromRGBO(234, 235, 238, 0.7),
                                fontSize: viewModel.loginType == 1 ? 16 : 14),
                          ),
                          onPressed: () {
                            viewModel.setLoginType(1);
                          },
                        ),
                      ],
                    ),
                    Consumer<SignViewModel>(builder: (_, signViewModel, child) {
                      if (signViewModel.loginType == 0) {
                        return Form(
                            child: Column(
                          children: [
                            _usernameWidget(),
                            const SizedBox(height: 8),
                            _pwdWidget()
                          ],
                        ));
                      } else {
                        return Form(
                            child: Column(
                          children: [
                            _phoneWidget(),
                            const SizedBox(height: 8),
                            _yzmWidget(TextButton(
                              child: Text(
                                signViewModel.codeCountdownStr!,
                                style: TextStyle(
                                    color: ColorUtil.fromHex('DFC3A8'),
                                    fontSize: 12),
                              ),
                              onPressed: () async {
                                if (signViewModel.codeCountdownStr! ==
                                    '获取验证码') {
                                  String phone = _textControllePhone.text;
                                  if (!RegexpHelper.isPhone(phone)) {
                                    onShowToast('请输入正确手机号');
                                    return;
                                  }

                                  /// 请求验证码
                                  bool? result = await signViewModel
                                      .fetchSmsCode(_textControllePhone.text);
                                  if (result) {
                                    signViewModel.setCodeCountdownStr(
                                        '${_countdownNum--}重新获取');
                                    _countdownTimer = Timer.periodic(
                                        const Duration(seconds: 1), (timer) {
                                      setState(() {
                                        if (_countdownNum > 0) {
                                          signViewModel.setCodeCountdownStr(
                                              '${_countdownNum--}重新获取');
                                        } else {
                                          signViewModel
                                              .setCodeCountdownStr('获取验证码');
                                          _countdownNum = 59;
                                          _countdownTimer?.cancel();
                                        }
                                      });
                                    });
                                  }
                                }
                              },
                            ))
                          ],
                        ));
                      }
                    }),
                    _remAndForgetWidget(),
                    CommonSubmitButton(
                      '登录',
                      vertical: 0,
                      verticalPadding: 0,
                      onPressed: () {
                        _doLogin(userService, viewModel);
                      },
                    ),
                    _bottomWidget()
                  ],
                ),
              ),
              _goSigupWidget()
            ],
          ),
        ),
      );
    });
  }

  _doLogin(UserService userService, SignViewModel viewModel) async {
    if (viewModel.loginType == 0) {
      if (_textControllerUsername.text.isEmpty) return;
      if (_textControllerPassword.text.isEmpty) return;

      /// Login
      UserEntity? userInfo = await viewModel.signin(
          _textControllerUsername.text, _textControllerPassword.text);
      if (userInfo != null && userInfo.apiToken != null) {
        userService.userDidSignin(userInfo.apiToken!);
        onBack();
      }
    } else {
      if (_textControllePhone.text.isEmpty) return;
      if (_textControlleYzm.text.isEmpty) return;

      ///phone Login
      UserEntity? userInfo = await viewModel.phonelogin(
          _textControllePhone.text, _textControlleYzm.text);
      if (userInfo != null && userInfo.apiToken != null) {
        userService.userDidSignin(userInfo.apiToken!);
        onBack();
      }
    }
  }
}
