# SIMKP PLN Mobile Flutter

# Core

1. Use `BaseView()` as parent widget in every screen
2. For navigation between screen use `Get.to(SomeView())`
3. Simple usecase of GetX look after `login` folder:
- `login_controller` -> put all logic here (use .obs to make value listenable for change)
- `login_view` -> view with `Obx` widget to listen change from controller

# Styling

1. Using flutter_screen_util packages to get dynamic size based on design draft, example usecase:
- to set width use `38.w`
- to set height use `38.h`
- to set fontsize use `20.ssp`
- to set TextStyle use `ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 14.ssp)`

# Networking

1. Create class for response model, example in `standart.dart`
2. Register model class that we wrote before to `base_service.dart` so we can easily parse the json with class model (look at the fromJson method in `base_service.dart`) 
3. Create class service (example in `http_service.dart`) for call the http method writen in `base_service.dart`
4. Create method in `http_service.dart` for example you can look `login` function, in there we pass `standart.dart` class to the generics class to, which mean we want the result of the http request to that class model.
5. Call `http_service.dart` class anywhere you want to do http request.