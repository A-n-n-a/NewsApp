//
//  GlobalFunctions.swift
//  News App
//
//  Created by Anna on 18.07.17.
//  Copyright © 2017 Anna. All rights reserved.
//

import Foundation
import UIKit


func stringToImage(string: String) -> UIImage {
    let imageUrl = URL(string: string)!
    let data = NSData(contentsOf: imageUrl)
    let image = UIImage(data:data! as Data)!
    
    return image
    
}

func stringToURL(string: String) -> URL {
    
    let url = URL(string: string)!
    
    return url
    
}


// GET DATA

func getData() -> [RequestResult] {
    
    var resultArray = [RequestResult]()
    
    let searchUrl = URL(string: "https://newsapi.org/v1/articles?source=techcrunch&apiKey=8ab581555eb3460da3273a670b096ad9")
    
    do {
        
        let data = try Data(contentsOf: searchUrl!)
        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String: Any]
        let mainDictionary = json["articles"] as! [[String : Any]]
        
        for i in mainDictionary {
            
            let title = i["title"] as! String
            let description = i["description"] as! String
            let urlString = i["url"] as! String
            let url = stringToURL(string: urlString)
            let urlToImage = i["urlToImage"] as! String
            let image = stringToImage(string: urlToImage)
            let publishedAt = i["publishedAt"] as! String
            
            let result = RequestResult(title: title, description: description, url: url, image: image, publishedAt: publishedAt)
            resultArray.append(result)
            
        }
    }
    catch {
        print(error)
    }

    
    return resultArray
}


