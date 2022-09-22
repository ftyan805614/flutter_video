import 'package:flutter/material.dart';
import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/common/utils/screen_adapter.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/modules/user/pages/user_signin/viewModels/sign_view_model.dart';
import 'package:polynesia/application/modules/user/pages/user_signin/views/signin_widget.dart';
import 'package:polynesia/application/modules/user/pages/user_signin/views/signup_widget.dart';

/// 用户登录注册页面
class UserSigninPage extends BaseWidget {
  const UserSigninPage({Key? key}) : super(key: key);

  @override
  State<BaseWidget> getState() => _UserSigninPageState();
}

class _UserSigninPageState extends BaseWidgetState<UserSigninPage> {
  @override
  Widget build(BuildContext context) {
    ScreenAdaper.init(context);
    return Scaffold(
      backgroundColor: TColor.primaryColor,
      body: ListView(
        children: [
          const SizedBox(height: 146),
          const SizedBox(height: 14),
          const SizedBox(height: 5),
          const SizedBox(height: 40),
          UnitView<SignViewModel>(
              viewModel: SignViewModel(),
              builder: (context, viewModel, child) {
                if (viewModel.exception != null) {
                  onShowToast(viewModel.exception.toString());
                }
                if (viewModel.index == 0) {
                  return const SignInWidget();
                } else {
                  return const SignupWidget();
                }
              },
              child: Container())
        ],
      ),
    );
  }
}
