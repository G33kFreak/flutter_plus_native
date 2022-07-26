import Flutter
import UIKit

public class SwiftPluginExamplePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "plugin_example", binaryMessenger: registrar.messenger())
    let instance = SwiftPluginExamplePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }
    
  private var controller: UIViewController? {
      return UIApplication.shared.keyWindow?.rootViewController
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch call.method {
      case "doNativeStuff":
          result("Something native has been done")
      case "showSomeNativeStuff":
          let alert = UIAlertController(title: nil, message: "This is a native alert!", preferredStyle: .alert)
          let defaultAction = UIAlertAction(title: "Got it!", style: .default){
              _ in result(nil)
          }
          alert.addAction(defaultAction)
          
          guard let controller = controller else {
              result(FlutterError(code: "UNAVAILABLE", message: "Native alert is unavailable", details: nil))
              return
          }
          
          controller.present(alert, animated: true)
      default:
          result(FlutterMethodNotImplemented)
      }
  }
}
