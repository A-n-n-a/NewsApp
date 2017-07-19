//
//  RequestResult.swift
//  News App
//
//  Created by Anna on 18.07.17.
//  Copyright © 2017 Anna. All rights reserved.
//

import Foundation
import UIKit

struct RequestResult {
    
    var title: String
    var description: String
    var url: URL
    var image: UIImage
    var publishedAt: String
    
    init(title: String, description: String, url: URL, image: UIImage, publishedAt: String) {
        self.title = title
        self.description = description
        self.url = url
        self.image = image
        self.publishedAt = publishedAt
    }
 
}
