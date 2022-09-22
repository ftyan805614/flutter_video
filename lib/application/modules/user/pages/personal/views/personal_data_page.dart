import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/modules/user/pages/personal/viewModels/personal_data_model.dart';
import 'package:polynesia/application/modules/user/pages/personal/views/personal_data.dart';
import 'package:polynesia/application/services/index.dart';

class PersonalDataPage extends StatelessWidget {
  const PersonalDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('个人资料'),
        backgroundColor: TColor.appBarBackground,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 17),
      ),
      body: Consumer<UserService>(
        builder: (_, userService, child) {
          return UnitView<PersonalDataModel>(
            viewModel: PersonalDataModel(),
            builder: (context, viewModel, child) {
              return const PersonalData();
            },
          );
        },
      ),
    );
  }
}
