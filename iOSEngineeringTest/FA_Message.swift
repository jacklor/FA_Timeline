//
//  FA_Message.swift
//  iOSEngineeringTest
//
//  Created by Pierre Laurac on 11/7/16.
//  Copyright © 2016 FrontApp. All rights reserved.
//

import Foundation

class FA_Message {
  
  init(dict: Dictionary<String,Any>) {
    self.content_loaded = dict["content_loaded"] as! Bool
    self.blurb = dict["blurb"] as! String
    self.body = dict["body"] as! String
  }
  
  var content_loaded: Bool!
  var blurb: String!
  var body: String!
    
  var cellHeight: Float! = 0.0
}
