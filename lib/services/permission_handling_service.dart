import 'package:permission_handler/permission_handler.dart';

Future<PermissionStatus> requestPermission() async {
  final PermissionStatus status = await Permission.storage.request();

  switch (status) {
    case PermissionStatus.granted:
      return status;
    case PermissionStatus.denied:
      return await requestPermission();
    case PermissionStatus.restricted:
      return await requestPermission();
    case PermissionStatus.limited:
      return await requestPermission();
    case PermissionStatus.permanentlyDenied:
      if (await Permission.storage.shouldShowRequestRationale) {
        return await requestPermission();
      } else {
        await openAppSettings();
        return await requestPermission();
      }
  }
}
