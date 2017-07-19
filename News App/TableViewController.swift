//
//  TableViewController.swift
//  News App
//
//  Created by Anna on 18.07.17.
//  Copyright © 2017 Anna. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var requestResultsArray = [RequestResult]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestResultsArray = getData()
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return requestResultsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("CustomCell", owner: self, options: nil)?.first as! CustomCell
        
        // limit label length with 100 symbols
        var description = requestResultsArray[indexPath.row].description
        let nsString = description as NSString
        if nsString.length > 100
        {
            description = nsString.substring(with: NSRange(location: 0, length: nsString.length > 100 ? 100 : nsString.length))
        }
        let index = description.index(description.startIndex, offsetBy: 97)
        let range = index...description.index(before: description.endIndex)
        description.replaceSubrange(range, with: "...")
        
        // String -> Date -> String
        let date = requestResultsArray[indexPath.row].publishedAt
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let publishedAt = dateFormatter.date(from: date)!
        dateFormatter.dateFormat = "dd-MMM HH:mm"
        dateFormatter.locale = tempLocale // reset the locale
        let createDate = dateFormatter.string(from: publishedAt)
       
        
        cell.titleLabel.text = requestResultsArray[indexPath.row].title
        cell.descriptionLabel.text = description
        cell.picture.image = requestResultsArray[indexPath.row].image
        cell.timeLabel.text = createDate

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Segue", sender: self)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let destViewController = segue.destination as! WebViewController
        
        let selectedRowIndex = self.tableView.indexPathForSelectedRow
        
        destViewController.url = requestResultsArray[(selectedRowIndex?.row)!].url

    }
    

}
