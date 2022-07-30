# mypet_doctor

A new Flutter project.


# 버전 관리

## 규칙
- 코드 작업 진행시 master 브랜치에서만 push 및 pull 합니다.
- main 브랜치에서는 APP의 배포 버전들만 push 합니다.
- 코드 충돌을 방지하기 위해 코드 수정시 내 PC의 파일에서 바로 수정하는 것이 아니라
마지막 commit 파일을 pull 받아 이어서 수정 합니다.
- 코드 수정시 하단 리스트에 날짜와 함께 수정 내용을 기록합니다.

## 2022-07-25
모든 작업자가 최초 생성한 UI 코드를 합치는 과정을 진행하였습니다.
- main.dart는 앱을 실행하는 역할만 합니다.
- ui 폴더의 내부는 화면을 구성하는 코드들이 있습니다.
- function 폴더의 내부에는 기능별 하위 폴더로 정리하여 모았습니다.
- widget_test.dart 의 충돌 버그를 수정하였습니다.


## 2022-07-30 / 23:17
main.dart 파일에 bottomNavigationBar 기능을 추가하였습니다.
-main.dart 의 myApp class 에서 지정한 모든 페이지는 바텀 네비게이션 바가 생성됩니다.
- 마이펫 페이지 목업 제작이 필요합니다. 