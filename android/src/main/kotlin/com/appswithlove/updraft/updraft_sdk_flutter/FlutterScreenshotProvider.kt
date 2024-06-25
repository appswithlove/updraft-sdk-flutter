package com.appswithlove.updraft.updraft_sdk_flutter

import android.app.Activity
import android.graphics.Bitmap
import com.appswithlove.updraft.presentation.DefaultScreenshotProvider
import com.appswithlove.updraft.presentation.ScreenshotProvider
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.renderer.FlutterRenderer

class FlutterScreenshotProvider(
    private val flutterRenderer: FlutterRenderer,
) : ScreenshotProvider {

    private val defaultScreenshotProvider = DefaultScreenshotProvider()

    override fun getBitmap(activity: Activity): Bitmap? {
        return if (activity is FlutterActivity || activity is FlutterFragmentActivity) {
            flutterRenderer.bitmap
        } else {
            defaultScreenshotProvider.getBitmap(activity)
        }
    }
}