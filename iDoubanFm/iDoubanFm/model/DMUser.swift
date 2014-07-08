//
//  DMUser.swift
//  iDoubanFm
//
//  Created by zhou quan on 7/8/14.
//  Copyright (c) 2014 zquan. All rights reserved.
//

import Foundation
class DMUser {
    var user_name:String?
    var email:String?
    var user_id:String?
    var token:String?
    var expire:Int32
    
    init(name:String,email:String,user_id:String,token:String,expire:Int32) {
        self.user_name = name
        self.email = email
        self.user_id = user_id
        self.token = token
        self.expire = expire;
    }
}