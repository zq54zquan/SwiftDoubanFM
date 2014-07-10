//
//  DMLoginRequest.swift
//  iDoubanFm
//
//  Created by zhou quan on 7/8/14.
//  Copyright (c) 2014 zquan. All rights reserved.
//

import Foundation

class DMLoginRequestModule : DMBaseRequestModuel{
    var handleUser:((_:DMUser)->Void)?
    var handleError:((_:NSError)->Void)?
    
    init() {
        super.init(successHandle: {(result: AnyObject?) -> Void in
            let resultDic = result as NSDictionary
            if resultDic.valueForKey("err") as NSString == "ok" {
                var user = DMUser(name: resultDic["user_name"] as NSString, email: resultDic["email"] as NSString, user_id: resultDic["user_id"] as NSString, token: resultDic["token"] as NSString, expire: Int32(resultDic["expire"].integerValue));
                if self.handleUser {
                    self.handleUser!(user);
                }
            }
            }, errorHandler: {(error: NSError!) -> Void in
                println(error.localizedDescription);
                if self.handleError {
                    self.handleError!(error);
                }
        })
    }
}