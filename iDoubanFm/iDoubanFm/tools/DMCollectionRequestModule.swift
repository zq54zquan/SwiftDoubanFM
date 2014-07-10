//
//  DMCollectionRequestModule.swift
//  iDoubanFm
//
//  Created by zhou quan on 7/10/14.
//  Copyright (c) 2014 zquan. All rights reserved.
//

import Foundation
class DMCollectionRequestModule:DMBaseRequestModuel {
    var handleCollections:((_:Array<DMCollection>?)->Void)?
    var handleError:((_:NSError)->Void)?
    
    init() {
        super.init(successHandle: {(result: AnyObject?) -> Void in
            println(result)
            var cookies = NSHTTPCookieStorage.sharedHTTPCookieStorage().cookiesForURL(NSURL(string: FMDOMAIN))
            println(cookies)

            if let resultDic = result as? NSDictionary {
                if resultDic["status"] {
                    var collections : Array<DMCollection> = []
                    var data = resultDic["data"] as NSDictionary
                    
                    for collectionDic in data["chls"] as Array<NSDictionary> {
                        var collection  = DMCollection(initDic: collectionDic as NSDictionary)
                        collections.append(collection);
                    }
                    self.handleCollections!(collections);
                }
            }
            
            
            }, errorHandler: {(error: NSError!) -> Void in
                self.handleError!(error)
            });
    }
}