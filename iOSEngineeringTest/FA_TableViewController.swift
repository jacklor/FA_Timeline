//
//  FA_TableViewController.swift
//  iOSEngineeringTest
//
//  Created by Pierre Laurac on 11/7/16.
//  Copyright © 2016 FrontApp. All rights reserved.
//

import Foundation
import UIKit

class FA_TableViewController: UITableViewController, UIWebViewDelegate {
  
  fileprivate let messageCellIdentifier = "messageCell"
  
  fileprivate var messages: [FA_Message] = []
  
  override func viewDidLoad() {
    getConversation()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages.count
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let message = self.messages[indexPath.row]
        if (!message.content_loaded)
        {
            let constraintRect = CGSize(width: self.tableView.frame.width - 16.0, height: .greatestFiniteMagnitude)
            let boundingBox = message.blurb.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 17)], context: nil)
            return boundingBox.height + 6.0
        }
        return CGFloat(message.cellHeight)
    }
    
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: FA_MessageCell = tableView.dequeueReusableCell(withIdentifier: messageCellIdentifier, for: indexPath) as! FA_MessageCell
    let message = self.messages[indexPath.row]
    cell.blurbLabel?.text = message.blurb
    cell.blurbLabel?.isHidden = message.content_loaded
    cell.bodyWebView?.isHidden = !message.content_loaded
    cell.bodyWebView?.loadHTMLString(message.body, baseURL: nil)
    cell.bodyWebView?.tag = indexPath.row
    return cell
  }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let message = self.messages[indexPath.row]
        
        message.content_loaded = !message.content_loaded;
        print(message.content_loaded)
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
  
  fileprivate func getConversation() {
    do {
      let pathToComposer = Bundle.main.path(forResource: "conversation", ofType: "json")
      let jsonData = try NSData(contentsOfFile: pathToComposer!) as Data
      let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! Dictionary<String, Any>
      let rawMessages = json["messages"] as! Array<Dictionary<String, Any>>
      rawMessages.forEach({ (message) in
        self.messages.append(FA_Message(dict: message))
      })
    } catch {}
  }
    
    

    func webViewDidFinishLoad(_ webView: UIWebView)
    {
        if (self.messages[webView.tag].cellHeight != 0.0)
        {
            return
        }
        
        self.messages[webView.tag].cellHeight = Float(webView.scrollView.contentSize.height)
        tableView.reloadRows(at: [NSIndexPath(row: webView.tag, section: 0) as IndexPath], with: .automatic)
    }
}
