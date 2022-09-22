import 'package:polynesia/application/modules/components/index.dart';
import 'package:flutter/material.dart';
import 'package:polynesia/application/modules/user/pages/root/viewModels/user_root_view_model.dart';
import 'package:polynesia/application/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ActionWidget extends BaseWidget {
  @override
  State<StatefulWidget> getState() {
    return _ActionWidgetState();
  }
}

class _ActionWidgetState extends BaseWidgetState<ActionWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserRootViewModel>(
      builder: (_, viewModel, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: Column(
                  children: const [
                    Image(
                      image: AssetImage(
                        "assets/images/user_wallet.png",
                      ),
                      width: 38,
                      height: 33,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "我的钱包",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
                onTap: () {
                },
              ),
              InkWell(
                onTap: () {
                },
                child: Column(
                  children: const [
                    Image(
                      image: AssetImage(
                        "assets/images/user_record.png",
                      ),
                      width: 38,
                      height: 33,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "投注记录",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                },
                child: Column(
                  children: const [
                    Image(
                      image: AssetImage(
                        "assets/images/user_trade.png",
                      ),
                      width: 38,
                      height: 33,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "交易记录",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                },
                child: Column(
                  children: const [
                    Image(
                      image: AssetImage(
                        "assets/images/user_manage.png",
                      ),
                      width: 38,
                      height: 33,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "账户管理",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
