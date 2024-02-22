import Flutter
import UIKit
import AmazonIVSPlayer

public class IvsPlayer2Plugin: NSObject, FlutterPlugin, IVSPlayer.Delegate {
    private var player: IVSPlayer?
    private var playerView: IVSPlayerView?

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "ivs_player2", binaryMessenger: registrar.messenger())
        let instance = IvsPlayer2Plugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        case "playStream":
            guard let args = call.arguments else {
                return
            }
            if let myArgs = args as? [String: Any],
               let url = myArgs["url"] as? String {
                playStream(url: url)
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }

   private func playStream(url: String) {
    player = IVSPlayer()
    player?.delegate = self
    playerView = IVSPlayerView(frame: UIScreen.main.bounds)
    playerView?.player = player
    playerView?.backgroundColor = .black // 背景色を黒に設定
    player?.load(URL(string: url)!)
    
    if let window = UIApplication.shared.windows.first {
        window.addSubview(playerView!)
    }
}

    public func player(_ player: IVSPlayer, didChangeState state: IVSPlayer.State) {
    if state == .ready {
        print("Player ready")
        player.play()
    }
}

public func player(_ player: IVSPlayer, didFailWithError error: Error) {
    print("Player error: \(error.localizedDescription)")
}

}