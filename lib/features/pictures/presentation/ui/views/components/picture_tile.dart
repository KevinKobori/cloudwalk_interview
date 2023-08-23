import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PictureTile extends StatelessWidget {
  final PictureViewModel viewModel;

  const PictureTile(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<IPicturesPresenter>(context);
    return GestureDetector(
      onTap: () => presenter.goToPictureDetails(viewModel.date),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                  blurRadius: 2,
                  color: Colors.black,
                )
              ],
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                viewModel.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                viewModel.date,
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
