
import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: "open.browser/channel", binaryMessenger: controller.binaryMessenger)
        
        channel.setMethodCallHandler { (call, result) in
            if call.method == "openBrowser", let args = call.arguments as? [String: Any], let urlString = args["url"] as? String, let url = URL(string: urlString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                result(nil)
            } else {
                result(FlutterError(code: "UNAVAILABLE", message: "Cannot open browser", details: nil))
            }
        }
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
