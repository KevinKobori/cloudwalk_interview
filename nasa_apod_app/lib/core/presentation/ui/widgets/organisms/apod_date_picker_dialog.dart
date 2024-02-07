import 'package:nasa_apod_app/nasa_apod_app.dart';

class ApodDatePickerDialog extends StatefulWidget
    implements PreferredSizeWidget {
  final PicturesPagePresenter picturesPagePresenter;

  const ApodDatePickerDialog(
    this.picturesPagePresenter, {
    super.key,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  State<ApodDatePickerDialog> createState() => _ApodDatePickerDialogState();
}

class _ApodDatePickerDialogState extends State<ApodDatePickerDialog>
    with RestorationMixin {
  @override
  String? get restorationId => 'main';

  final RestorableDateTime _selectedDate = RestorableDateTime(
    DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      DateTime.now().hour - 1,
    ),
  );
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (navigator, arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2019),
          lastDate: DateTime.now(),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  Future<void> _selectDate(DateTime? newSelectedDate) async {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;

        widget.picturesPagePresenter.loadPictureByDate(_selectedDate.value);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        _restorableDatePickerRouteFuture.present();
      },
      child: const Text('Search by date'),
    );
  }
}
