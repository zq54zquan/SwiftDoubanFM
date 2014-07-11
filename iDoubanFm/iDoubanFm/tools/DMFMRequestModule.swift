//
//  DMFMRequestModule.swift
//  iDoubanFm
//
//  Created by zhou quan on 7/10/14.
//  Copyright (c) 2014 zquan. All rights reserved.
//

import Foundation
func requestDM() {
    showCookies();
   
    DMRequest.shareInstance.getRequestWithHost(FMDOMAIN, path:nil, param: nil, successHandle: {(_:AnyObject?) -> Void in
        showCookies()
        }, errorHandler:{(_:NSError!)->Void in
        showCookies()
    });
}

func showCookies() {
     println("-------------------")
    var cookies = NSHTTPCookieStorage.sharedHTTPCookieStorage().cookies
    for cookie in cookies {
        if cookie as? NSHTTPCookie {
            println(cookie.properties);
        }
    }
}