part of darwin_theme_data;

class AppImagesData {
  final Widget darwinLogo;
  final Widget chatSquareText;
  final ImageProvider vehicleDamageLeftFront;

  const AppImagesData({
    required this.darwinLogo,
    required this.chatSquareText,
    required this.vehicleDamageLeftFront,
  });

  factory AppImagesData._standard() => AppImagesData(
        darwinLogo: SvgPicture.asset(
          'assets/icons/logo.svg',
        ),
        chatSquareText: SvgPicture.asset(
          'assets/icons/chat_square_text.svg',
        ),
        vehicleDamageLeftFront: const AssetImage(
          'assets/images/vehicle/damage/left_front.png',
          package: 'nasa_apod_app',
        ),
      );
}
