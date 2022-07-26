package com.example.fluttertoandroid

import android.app.Application
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

object AppFlutterEngines {
    const val FLUTTER_ENGINE_1 = "my_engine_1"
}

class ApplicationInit : Application() {
    lateinit var flutterEngine : FlutterEngine

    override fun onCreate() {
        super.onCreate()

        flutterEngine = FlutterEngine(this)

        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        FlutterEngineCache.getInstance().put(AppFlutterEngines.FLUTTER_ENGINE_1, flutterEngine);
    }
}