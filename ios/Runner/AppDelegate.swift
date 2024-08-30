import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller = window?.rootViewController as! FlutterViewController

    // Channel for calculating the square
    let squareChannel = FlutterMethodChannel(
      name: "com.example.customkotlinswift/square",
      binaryMessenger: controller.binaryMessenger)

    squareChannel.setMethodCallHandler {
      (call: FlutterMethodCall, result: @escaping FlutterResult) in
      if call.method == "getSquare" {
        if let args = call.arguments as? [String: Any],
          let number = args["number"] as? Int
        {
          result(self.getSquare(number: number))
        } else {
          result(
            FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid arguments", details: nil))
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    // Channel for starting a new view controller
    let activityChannel = FlutterMethodChannel(
      name: "com.example.customkotlinswift/activity",
      binaryMessenger: controller.binaryMessenger)

    activityChannel.setMethodCallHandler {
      (call: FlutterMethodCall, result: @escaping FlutterResult) in
      if call.method == "startNewActivity" {
        self.startNewActivity()
        result("Activity Started")
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func getSquare(number: Int) -> Int {
    return number * number
  }
  //    private func startNewActivity() {
  //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //        guard let newViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
  //            print("Could not instantiate view controller with identifier 'SecondViewController'")
  //            return
  //        }
  //
  //        newViewController.modalPresentationStyle = .fullScreen
  //        window?.rootViewController?.present(newViewController, animated: true, completion: nil)
  //    }
  private func startNewActivity() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard
      let newViewController = storyboard.instantiateViewController(
        withIdentifier: "SecondViewController") as? SecondViewController
    else {
      print("Could not instantiate view controller with identifier 'SecondViewController'")
      return
    }

    // Embed SecondViewController in a UINavigationController
    let navigationController = UINavigationController(rootViewController: newViewController)
    navigationController.modalPresentationStyle = .fullScreen
    window?.rootViewController?.present(navigationController, animated: true, completion: nil)
  }
  //    private func startNewActivity() {
  //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //        let newViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
  //        window?.rootViewController?.present(newViewController, animated: true, completion: nil)
  //    }
}
