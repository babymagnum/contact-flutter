# Flutter wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
-dontwarn io.flutter.embedding.**
-dontwarn com.appsflyer.**
-keep public class com.google.firebase.messaging.FirebaseMessagingService {
  public *;
}
-ignorewarnings
#-keep class androidx.lifecycle.DefaultLifecycleObserver
-keep class androidx.lifecycle.** { *; }