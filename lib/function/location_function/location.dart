import 'package:geolocator/geolocator.dart';

/// 장치의 현재 위치를 결정합니다..
///
/// 위치 서비스가 활성화되지 않았거나 권한이 없는 경우
/// 거부되면 `Future`는 오류를 반환합니다
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // 위치 서비스가 활성화되어 있는지 테스트합니다.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // 위치 서비스가 활성화되지 않음 계속하지 않음
    // 위치에 액세스하고 사용자를 요청합니다.
    // 위치 서비스를 활성화하는 앱.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // 권한이 거부되었습니다. 다음에 시도할 수 있습니다.
      // 권한을 다시 요청합니다(여기도
      // 안드로이드의 shouldShowRequestPermissionRationale
      // true를 반환했습니다. 안드로이드 가이드라인에 따르면
      // 이제 앱에 설명 UI가 표시되어야 합니다.
      return Future.error('위치 권한이 거부되었습니다.');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // 권한은 영원히 거부됩니다. 적절하게 처리하십시오.
    return Future.error('위치 권한이 영구적으로 거부되었습니다. 권한을 요청할 수 없습니다.');
  }

// 여기에 도달하면 권한이 부여되고
  // 장치의 위치에 계속 액세스합니다.
  return await Geolocator.getCurrentPosition();
}
