package com.appswithlove.updraft.updraft_sdk_flutter

import android.app.Application
import com.appswithlove.updraft.Updraft
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** UpdraftSdkFlutterPlugin */
class UpdraftSdkFlutterPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    private var flutterPluginBinding: FlutterPlugin.FlutterPluginBinding? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        this.flutterPluginBinding = flutterPluginBinding
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "updraft_sdk_flutter")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "initNativeSdk") {
            initNativeSdk(call, result)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        this.flutterPluginBinding = null
        channel.setMethodCallHandler(null)
    }

    private fun initNativeSdk(call: MethodCall, result: Result) {
        val application = flutterPluginBinding?.applicationContext as? Application
        if (application == null) {
            result.error("100", "Wrong initialisation state", null)
            return
        }

        val args = call.arguments() as Map<String, Any>? ?: mapOf()
        if (args.isEmpty()) {
            result.error("101", "Arguments is null or empty", null)
            return
        }

        try {
            val settings = SettingsExtensions.fromMap(args)
            Updraft.initialize(application, settings)
            Updraft.getInstance()?.start()
            result.success("")
        } catch (e: Exception) {
            result.error("102", e.message, e)
        }
    }
}