package com.appswithlove.updraft.updraft_sdk_flutter

import com.appswithlove.updraft.Settings

object SettingsExtensions {

    fun fromMap(map: Map<String, Any>): Settings {
        val sdkKey = map["sdkKey"] as? String
        val appKey = map["appKey"] as? String

        if (sdkKey.isNullOrEmpty()) {
            throw UpdraftException("sdkKey can not be empty. Please check your UpdraftSettings. Current settings is $map")
        }

        if (appKey.isNullOrEmpty()) {
            throw UpdraftException("appKey can not be empty. Please check your UpdraftSettings. Current settings is $map")
        }

        val baseUrl = map["baseUrl"] as? String
        return Settings().apply {
            this.sdkKey = sdkKey
            this.appKey = appKey
            showFeedbackAlert = true
            if (baseUrl != null) {
                this.baseUrl = baseUrl
            }
            logLevel = Settings.LOG_LEVEL_ERROR
        }
    }
}