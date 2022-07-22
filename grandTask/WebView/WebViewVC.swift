//
//  WebViewVC.swift
//  grandTask
//
//  Created by mac on 22/07/2022.
//

import UIKit
import WebKit

class WebViewVC: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    //MARK: - IBOutlet(s)
    @IBOutlet weak var webView: WKWebView!
    
    //MARK: - Variable(s)
    var urlString: String?
    
    
    //MARK: - Helper functions
    func setUI() {
        
        //Title for Screen
        title = "Website"

        //Confirm WebView Protocols
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        //Passing url to WebView
        guard let url = URL(string: urlString ?? "") else {return}
        let request = URLRequest(url: url)
        self.webView.load(request)
    }

}

//MARK: - VC Initializer
extension WebViewVC {
    static func instantiate() -> WebViewVC {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "WebViewVC") as! WebViewVC
        return vc
    }
}

extension WebViewVC: WKNavigationDelegate , WKUIDelegate {
    
}
