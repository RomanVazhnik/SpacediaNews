//
//  WebViewController.swift
//  Spacedia
//
//  Created by Роман Важник on 13/09/2019.
//  Copyright © 2019 Александр Б. All rights reserved.
//


import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var webView: WKWebView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var url: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Wiki"
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        setupWebView()
    }
    
    private func setupWebView() {
        webView.navigationDelegate = self
        let request = URLRequest(url: self.url)
        self.webView.load(request)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
}
