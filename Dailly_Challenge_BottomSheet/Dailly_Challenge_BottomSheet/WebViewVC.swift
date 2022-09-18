//
//  WebViewVC.swift
//  Dailly_Challenge_BottomSheet
//
//  Created by Hertz on 9/18/22.
//

import UIKit
import WebKit

class WebViewVC: UIViewController {

    // 아이덴티파이어
    static let identifier = "WebViewVC"
    
    // 전역변수
    let webView = WKWebView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        webViewRequest()
    }
    
    func webViewRequest() {
        guard let url = URL(string: "https://www.apple.com/kr/") else { return }
        webView.load(URLRequest(url: url))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }

}
