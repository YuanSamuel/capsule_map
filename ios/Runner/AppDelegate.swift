import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyAnbzPjt3fexkl6Gs2G7SovS2OX-xN34HM");
    /*GMSPlacesClient.provideAPIKey("AIzaSyAnbzPjt3fexkl6Gs2G7SovS2OX-xN34HM");*/
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
