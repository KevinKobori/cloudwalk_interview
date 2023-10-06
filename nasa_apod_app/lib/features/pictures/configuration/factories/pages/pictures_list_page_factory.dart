import 'package:flutter/material.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

StatefulWidget picturesListPageFactory() =>
    PicturesPage(picturesPresenterFactory());
