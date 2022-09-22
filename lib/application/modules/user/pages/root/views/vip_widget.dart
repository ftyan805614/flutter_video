import 'package:polynesia/application/common/utils/color_util.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:flutter/material.dart';
import 'package:polynesia/application/modules/user/pages/root/viewModels/user_root_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../../routes/app_routes.dart';

class VipWidget extends BaseWidget {
  @override
  State<StatefulWidget> getState() {
    return _VipWidgetState();
  }
}

class _VipWidgetState extends BaseWidgetState<VipWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserRootViewModel>(
      builder: (_, viewModel, child) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
          child: Stack(
            children: [
              const Image(image: AssetImage("assets/images/user_vip.png")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 /* Expanded(
                    child: FlatButton(
                      child: const Text(''),
                      onPressed: () {
                      },
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      child: const Text(''),
                      onPressed: () => {},
                    ),
                  )*/
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
