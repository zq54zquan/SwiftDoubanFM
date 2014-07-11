//
//  DMSongRequestModule.swift
//  iDoubanFm
//
//  Created by zhou quan on 7/10/14.
//  Copyright (c) 2014 zquan. All rights reserved.
//

import Foundation
class DMSongRequestModule : DMBaseRequestModuel {
    var handleSongs:((Array<DMSong>?)->Void)?
    var handleError:((NSError)->Void)?
    init() {
        super.init(successHandle: {(result: AnyObject?) -> Void in
            if let resultDic = result as? NSDictionary {
                if let songsDicArray = resultDic["song"] as? NSArray {
                    var songs:Array<DMSong> = [];
                    for songDic in songsDicArray {
                        if songDic as? NSDictionary {
                            print(songDic)
                            var song = DMSong(songDic: songDic as NSDictionary)
                            songs.append(song);
                        }
                    }
                    if self.handleSongs {
                        self.handleSongs!(songs)
                    }
                }
            }
            }, errorHandler: {(error: NSError!) -> Void in
                if self.handleError {
                    self.handleError!(error);
                }
            });
    }
}