package com.example.customkotlinswift

import android.os.Bundle
import android.view.View
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import com.example.customkotlinswift.databinding.ActivitySecondBinding


class SecondActivity : AppCompatActivity() {
    lateinit var activitySecondBinding: ActivitySecondBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        activitySecondBinding = ActivitySecondBinding.inflate(layoutInflater)
        val view: View = activitySecondBinding.getRoot()
        setContentView(view)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }


        activitySecondBinding.textView.setOnClickListener {
            finish()
        }
    }
}