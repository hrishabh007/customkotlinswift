package com.example.customkotlinswift

import android.content.Intent
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val SQUARE_CHANNEL = "com.example.customkotlinswift/square"
    private val ACTIVITY_CHANNEL = "com.example.customkotlinswift/activity"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Square channel
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, SQUARE_CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getSquare") {
                val number = call.argument<Int>("number") ?: 0
                val square = getSquare(number)
                result.success(square)
            } else {
                result.notImplemented()
            }
        }

        // Activity channel
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, ACTIVITY_CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "startNewActivity") {
                startNewActivity()
                result.success("Activity Started")
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getSquare(number: Int): Int {
        return number * number
    }

    private fun startNewActivity() {
        val intent = Intent(this, SecondActivity::class.java)
        startActivity(intent)
    }
}