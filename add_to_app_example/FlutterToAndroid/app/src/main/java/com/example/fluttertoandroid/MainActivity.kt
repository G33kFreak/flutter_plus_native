package com.example.fluttertoandroid

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Button
import io.flutter.embedding.android.FlutterActivity;


class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val flutterWithWarmUpBtn = findViewById<Button>(R.id.flutter_with_warm_up)
        val flutterWithoutWarmUpBtn = findViewById<Button>(R.id.flutter_without_warm_up)

        flutterWithWarmUpBtn.setOnClickListener(View.OnClickListener {
            pushWithWarmUp()
        })
        flutterWithoutWarmUpBtn.setOnClickListener(View.OnClickListener {
            pushWithoutWarmUp()
        })
    }

    private fun pushWithWarmUp(){
        startActivity(
            FlutterActivity.withCachedEngine(AppFlutterEngines.FLUTTER_ENGINE_1).build(this)
        )
    }

    private fun pushWithoutWarmUp() {
        startActivity(
            FlutterActivity.createDefaultIntent(this)
        )
    }
}