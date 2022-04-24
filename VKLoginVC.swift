//
//  LoginFormVC.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 16.12.2021.
//


import Foundation
import UIKit
import WebKit

final class VKLoginVC: UIViewController {
   
    
    @IBOutlet weak var webView: WKWebView!{
        didSet{
            webView.navigationDelegate = self
        }
    }
    
    
    
    @IBAction func unlogin(_ segue: UIStoryboardSegue) {
        Session.instance.token = ""
        Session.instance.userId = 0
        let dataStore = WKWebsiteDataStore.default()
        dataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            records.forEach {
                if $0.displayName.contains("vk") {
                    dataStore.removeData(
                        ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(),
                        for: [$0]) { [weak self] in
                        guard
                            let self = self,
                            let url = self.urlComponents.url
                        else {
                            return
                        }
                        self.webView.load(URLRequest(url: url))
                        
                    }
                }
            }
        }
    }
        
    private var urlComponents: URLComponents = {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "oauth.vk.com"
        urlConstructor.path = "/authorize"
        urlConstructor.queryItems = [
            URLQueryItem(name: "client_id", value: "8080582"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "friends,photos,groups"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.131")
        ]
            return urlConstructor
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard
            let url = urlComponents.url
        else { return }
        
        webView.load(URLRequest(url: url))
    }
    }

extension VKLoginVC: WKNavigationDelegate {
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationResponse: WKNavigationResponse,
        decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard
            let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment
        
            else { return decisionHandler(.allow) }
            
            let parameters = fragment
                .components(separatedBy: "&")
                .map{ $0.components(separatedBy: "=") }
                .reduce([String: String]()) { partialResult, params  in
                    var dict = partialResult
                    let key = params[0]
                    let value = params[1]
                    dict[key] = value

                    return dict
                }
            
            //получаем из словаря токен и uid
            guard
                let token = parameters["access_token"],
                let userIDString = parameters["user_id"],
                let userID = Int(userIDString)
            else {
                return decisionHandler(.allow)
            }
            
            Session.instance.token = token
            Session.instance.userId = userID
            
            performSegue(withIdentifier: "successfullLogIn", sender: nil)
            
            decisionHandler(.cancel)
                
    }
}
