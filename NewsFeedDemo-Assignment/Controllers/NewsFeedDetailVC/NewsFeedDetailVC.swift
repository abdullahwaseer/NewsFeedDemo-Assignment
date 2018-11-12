//
//  NewsFeedDetailVC.swift
//  NewsFeedDemo-Assignment
//
//  Created by M Abdullah Waseer on 08/11/2018.
//  Copyright © 2018 M Abdullah Waseer. All rights reserved.
//

import UIKit
import WebKit

class NewsFeedDetailVC: BaseVC {
    
    var webView: WKWebView!
    var currentUrlString : String?
    
    var articleAuthor : String?
    var articleTitle : String?

    
    override func loadView() {
        super.loadView()
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        //uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //setting up title and subtitle to be displayed in navigation bar
        setupNavigationTitle()
        
        //showing news feed detail by loading news feed url into webView
        loadRequestInWebView()
    }
    
    func setupNavigationTitle() {
        
        self.navigationItem.titleView = self.viewForTitle(title: self.articleAuthor!, subTitle: self.articleTitle!)
    }
    
    func loadRequestInWebView() {
        
        let myURL = URL(string: self.currentUrlString ?? "")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewsFeedDetailVC : WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    }
}


