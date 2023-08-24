import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:flutter/material.dart';

StatefulWidget pictureDetailsFactory(String pictureDate,
        {PictureViewModel? pictureViewModel}) =>
    PictureDetailsPage(pictureDate, pictureViewModel: pictureViewModel);
