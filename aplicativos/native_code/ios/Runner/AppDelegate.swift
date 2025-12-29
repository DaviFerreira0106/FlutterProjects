import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller : FlutterViewController = window!.rootViewController as! FlutterViewController
      
      let nativeChannel = FlutterMethodChannel(name: "davi.com.br/native_code", binaryMessenger: controller.binaryMessenger)
      
      nativeChannel.setMethodCallHandler({
          (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          
          guard call.method == "calcSum" else{
              result(FlutterMethodNotImplemented)
              return
          }
          
          if let args = call.arguments as? [String : Any],
             let a = args["a"] as? Int,
             let b = args["b"] as? Int {
              result(a + b)
          } else {
              result(-1)
          }
      })
      
      GeneratedPluginRegistrant.register(with: self)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
