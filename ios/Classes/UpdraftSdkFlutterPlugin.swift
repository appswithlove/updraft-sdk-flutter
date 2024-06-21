import Flutter
import UIKit
import Updraft

public class UpdraftSdkFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "updraft_sdk_flutter", binaryMessenger: registrar.messenger())
    let instance = UpdraftSdkFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "initNativeSdk":
      initNativeSdk(call, result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func initNativeSdk(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
          guard let arguments = call.arguments as? [String: Any], !arguments.isEmpty else {
              result(FlutterError(code: "101", message: "Arguments is null or empty", details: nil))
              return
          }

          guard let sdkKey = arguments["sdkKey"] as? String else {
              result(FlutterError(code: "102", message: "sdkKey can not be empty. Please check your UpdraftSettings. Current settings is \(arguments)", details: nil))
              return
          }

          guard let appKey = arguments["appKey"] as? String else {
              result(FlutterError(code: "102", message: "appKey can not be empty. Please check your UpdraftSettings. Current settings is \(arguments)", details: nil))
              return
          }

          Updraft.shared.start(sdkKey: sdkKey, appKey: appKey)

          let baseUrl = arguments["baseUrl"] as? String
          if (baseUrl != nil) {
              Updraft.shared.baseUrl = baseUrl
          }

          print("success")

          result("")
      }
}
