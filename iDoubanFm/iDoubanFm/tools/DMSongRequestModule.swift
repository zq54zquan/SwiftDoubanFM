//
//  DMSongRequestModule.swift
//  iDoubanFm
//
//  Created by zhou quan on 7/10/14.
//  Copyright (c) 2014 zquan. All rights reserved.
//

import Foundation
class DMSongRequestModule : DMBaseRequestModuel {
    init() {
        super.init(successHandle: {(result: AnyObject?) -> Void in
            //http://www.douban.com/j/app/radio/people?app_name=radio_desktop_mac&version=100&user_id=45551691&expire=1412396713&token=885672e1ea&sid=536024&h=%7C%3As%7C536024%3As&channel=1&type=s
            }, errorHandler: {(error: NSError!) -> Void in
                
            });
    }
}