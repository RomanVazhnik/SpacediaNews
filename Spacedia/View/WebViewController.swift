//
//  WebViewController.swift
//  Spacedia
//
//  Created by Роман Важник on 13/09/2019.
//  Copyright © 2019 Александр Б. All rights reserved.
//


import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet var webView: WKWebView!
    
    var url: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
    }
    
    private func setupWebView() {
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
}
