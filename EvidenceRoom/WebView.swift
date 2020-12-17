import Foundation
import SwiftUI
import WebKit
//import MobileVLCKit

struct WebView: UIViewRepresentable {
    
    var url: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
    }
    
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<WebView>) {}

}

//struct VLCView: UIViewRepresentable {
//    
//    var url: String
//    
//    let vlcPlayer = VLCMediaPlayer()
//    
//    func makeUIView(context: Context) ->  UIView {
//        let view = UIView()
//        view.backgroundColor = .red
//        guard let url = URL(string: url) else {
//            return view
//        }
//        
//        vlcPlayer.drawable = view
//        
//        let media = VLCMedia(url: url)
//        vlcPlayer.media = media
//        vlcPlayer.play()
//        view.backgroundColor = .gray
//        
//        return view
//    }
//    
//    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<VLCView>) {}
//}
