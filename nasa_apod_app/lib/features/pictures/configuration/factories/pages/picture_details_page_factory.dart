import 'package:flutter/material.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

StatefulWidget pictureDetailsFactory(String pictureDate,
        {PictureViewModel? pictureViewModel}) =>
    PictureDetailsPage(pictureDate, pictureViewModel: pictureViewModel);
