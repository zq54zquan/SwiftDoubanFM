//
//  DMUser.swift
//  iDoubanFm
//
//  Created by zhou quan on 7/8/14.
//  Copyright (c) 2014 zquan. All rights reserved.
//

import Foundation
class DMUser {
    var user_name:NSString?
    var email:NSString?
    var user_id:NSString?
    var token:NSString?
    var expire:Int32
    
    init(name:NSString,email:NSString,user_id:NSString,token:NSString,expire:Int32) {
        self.user_name = name
        self.email = email
        self.user_id = user_id
        self.token = token
        self.expire = expire;
    }
}