//
//  FA_MessageCell.swift
//  iOSEngineeringTest
//
//  Created by Jack Lor on 12/17/16.
//  Copyright © 2016 FrontApp. All rights reserved.
//

import Foundation
import UIKit

class FA_MessageCell: UITableViewCell {
    
    @IBOutlet weak var blurbLabel: UILabel!
    @IBOutlet weak var bodyWebView: UIWebView!
    
    override func awakeFromNib() {
        self.bodyWebView!.scrollView.isScrollEnabled = false
    }
}
