//
//  WebView.swift
//  News App
//
//  Created by Anna on 18.07.17.
//  Copyright © 2017 Anna. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webNews: UIWebView!
    
    var url = URL(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webNews.loadRequest(URLRequest(url: url!))
    }




}
