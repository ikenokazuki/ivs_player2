package jp.ikebun.ivs_player2

import android.app.Activity
import android.view.View
import android.widget.FrameLayout
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.plugin.common.PluginRegistry.ViewDestroyListener
import io.flutter.plugin.common.PluginRegistry
import com.amazonaws.ivs.player.Player
import com.amazonaws.ivs.player.Player.State
import com.amazonaws.ivs.player.PlayerView
import android.net.Uri
import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin
import android.util.DisplayMetrics



class IvsPlayer2Plugin: FlutterPlugin, MethodCallHandler, ActivityAware {
    private var activity: Activity? = null
    private lateinit var channel : MethodChannel
    private var player: Player? = null
    private lateinit var context: Context
    private var playerView: PlayerView? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "ivs_player2")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
        playerView = PlayerView(context)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        activity = null
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "playStream") {
            val url = call.argument<String>("url")
            playerView?.let{
              it.setControlsEnabled(false)
              it.
              it.player?.let{
                it.load(Uri.parse(url))
                 val displayMetrics = DisplayMetrics()
                 activity?.windowManager?.defaultDisplay?.getRealMetrics(displayMetrics)
                 val screenHeight = displayMetrics.heightPixels
                 val screenWidth = displayMetrics.widthPixels
                 
                 val params = FrameLayout.LayoutParams(screenWidth, screenHeight)
                 activity?.addContentView(playerView, params)

              }
            }
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
        player?.release()
    }
        
        
    }
