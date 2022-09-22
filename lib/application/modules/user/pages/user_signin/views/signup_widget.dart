import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/common/utils/regexp_helper.dart';
import 'package:polynesia/application/common/utils/screen_adapter.dart';
import 'package:polynesia/application/common/widget/common_submit_buttom.dart';
import 'package:polynesia/application/data/index.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/modules/components/input_text_field.dart';
import 'package:polynesia/application/modules/user/pages/user_signin/viewModels/sign_view_model.dart';
import 'package:polynesia/application/services/index.dart';
import 'package:provider/provider.dart';

class SignupWidget extends BaseWidget {
  const SignupWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> getState() {
    return _ReginWidgetState();
  }
}

class _ReginWidgetState extends BaseWidgetState {
  final _textControllerUsername = TextEditingController(),
      _textControllePhone = TextEditingController(),
      _textControlleYzm = TextEditingController(),
      _textControllerPassword = TextEditingController(),
      _textControllerRePassword = TextEditingController(),
      _textControllerInvate = TextEditingController();

  bool _visiblePassword = false;
  bool _visibleRePassword = false;
  Timer? _countdownTimer;
  int _countdownNum = 59;

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    super.dispose();
  }

  ///提交验证
  void verify(Function signupReq) {
    String username = _textControllerUsername.text;
    if (!RegexpHelper.isUsername(username)) {
      onShowToast('账号6-12位字母或数字');
      return;
    }
    ApplicationService applicationService =
        serviceDependency.get<ApplicationService>();
    if (applicationService.appConfig != null) {
      ConfigEntity config = applicationService.appConfig![16];
      Map<String, dynamic> signUnJson = json.decode(config.value!);
      SignConfigEntity signConfig = SignConfigEntity.fromJson(signUnJson);
      if (signConfig.registerMobile == 0) {
        String phone = _textControllePhone.text;
        if (!RegexpHelper.isPhone(phone)) {
          onShowToast('请输入正确手机号');
          return;
        }
        String yzm = _textControlleYzm.text;
        if (yzm.isEmpty) {
          onShowToast('请输入正确验证码');
          return;
        }
      }
    }
    String pwd = _textControllerPassword.text;
    if (!RegexpHelper.isPassword(pwd)) {
      onShowToast('密码8-20位字母或数字');
      return;
    }
    String repwd = _textControllerRePassword.text;
    if (pwd != repwd) {
      onShowToast('两次输入密码不一致');
      return;
    }

    if (applicationService.appConfig != null) {
      ConfigEntity config = applicationService.appConfig![16];
      Map<String, dynamic> signUnJson = json.decode(config.value!);
      SignConfigEntity signConfig = SignConfigEntity.fromJson(signUnJson);
      if (signConfig.registerInviteCode == 1) {
        //邀请码必填
        String invateCode = _textControllerInvate.text;
        if (invateCode.isEmpty) {
          onShowToast('请输入邀请码');
          return;
        }
      }
    }
    signupReq();
  }

  ///返回登录
  Widget _goToSigninWidget() {
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
                  "返\n回\n登\n录",
                  style: TextStyle(color: Colors.white, fontSize: 13),
                )
              ],
            ),
            onTap: () {
              viewModel.setIndex(0);
            },
          );
        }));
  }

  ///邀请码
  Widget _invateWidegt() {
    return //监听注册配置
        Consumer<ApplicationService>(builder: (_, viewModel, child) {
      ConfigEntity config = viewModel.appConfig![16];
      Map<String, dynamic> signUnJson = json.decode(config.value!);
      SignConfigEntity signConfig = SignConfigEntity.fromJson(signUnJson);
      return SizedBox(
          height: 44.0,
          width: ScreenAdaper.getScreenWidth() -
              20 -
              ScreenAdaper.width(46) -
              ScreenAdaper.width(36),
          child: InputTextField(
            controller: _textControllerInvate,
            hintText:
                signConfig.registerInviteCode == 0 ? '邀请码(选填)' : '邀请码(必填)',
            prefixIcon: IconButton(
              icon: Image.asset(
                'assets/images/invate.png',
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
                  _textControllerInvate.clear();
                });
              },
            ),
            textInputAction: TextInputAction.next,
            borderRadius: const BorderRadius.all(Radius.circular(22)),
          ));
    });
  }

  ///用户名
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
          // validator: validateUsername,
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

  ///密码
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
          hintText: '密码',
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
          // validator: validateUsername,
          borderRadius: const BorderRadius.all(Radius.circular(22)),
        ));
  }

  ///确认密码
  Widget _repwdWidget() {
    return SizedBox(
        height: 44.0,
        width: ScreenAdaper.getScreenWidth() -
            20 -
            ScreenAdaper.width(46) -
            ScreenAdaper.width(36),
        child: InputTextField(
          controller: _textControllerRePassword,
          obscureText: !_visibleRePassword,
          hintText: '确认密码',
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
              _visibleRePassword
                  ? 'assets/images/eyeopen.png'
                  : 'assets/images/eyeclose.png',
              width: 18,
              height: 18,
            ),
            onPressed: () {
              setState(() {
                _visibleRePassword = !_visibleRePassword;
              });
            },
          ),
          textInputAction: TextInputAction.next,
          borderRadius: const BorderRadius.all(Radius.circular(22)),
        ));
  }

  ///提交按钮
  Widget _submitWidget(Function signupReq) {
    return CommonSubmitButton(
      "注册",
      onPressed: () {
        verify(signupReq);
      },
      vertical: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    UserService userService = Provider.of<UserService>(context);
    return Consumer<SignViewModel>(builder: (_, signViewModel, child) {
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
                _goToSigninWidget(),
                Container(
                  width: ScreenAdaper.getScreenWidth() -
                      20 -
                      ScreenAdaper.width(46),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.2),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: const Text('注册',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.white)),
                      ),
                      Form(
                          child: Column(
                        children: [
                          _usernameWidget(),
                          //监听注册配置
                          Consumer<ApplicationService>(
                              builder: (_, appServiceModel, child) {
                            if (appServiceModel.appConfig == null) {
                              return Container();
                            }
                            ConfigEntity config =
                                appServiceModel.appConfig![16];
                            Map<String, dynamic> signUnJson =
                                json.decode(config.value!);
                            SignConfigEntity signConfig =
                                SignConfigEntity.fromJson(signUnJson);
                            if (signConfig.registerMobile != 0) {
                              return Container();
                            }
                            return Column(
                              children: [
                                const SizedBox(height: 8),
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
                                      bool? result =
                                          await signViewModel.fetchSmsCode(
                                              _textControllePhone.text);
                                      if (result) {
                                        signViewModel.setCodeCountdownStr(
                                            '${_countdownNum--}重新获取');
                                        _countdownTimer = Timer.periodic(
                                            const Duration(seconds: 1),
                                            (timer) {
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
                            );
                          }),
                          const SizedBox(height: 8),
                          _pwdWidget(),
                          const SizedBox(height: 8),
                          _repwdWidget(),
                          const SizedBox(height: 8),
                          _invateWidegt(),
                        ],
                      )),
                      const SizedBox(height: 17),
                      _submitWidget(() async {
                        UserEntity? userInfo = await signViewModel.signup(
                            _textControllerUsername.text,
                            _textControllerPassword.text,
                            _textControllePhone.text,
                            _textControlleYzm.text,
                            _textControllerInvate.text);
                        if (userInfo != null && userInfo.apiToken != null) {
                          userService.userDidSignin(userInfo.apiToken!);
                          onBack();
                        }
                      }),
                      const SizedBox(
                        height: 18,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
