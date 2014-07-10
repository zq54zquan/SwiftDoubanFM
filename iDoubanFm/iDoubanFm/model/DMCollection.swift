//
//  DMCollection.swift
//  iDoubanFm
//
//  Created by zhou quan on 7/10/14.
//  Copyright (c) 2014 zquan. All rights reserved.
//

import Foundation
class DMCollection {
    var song_to_start:NSString?
    var intro:NSString?
    var name:NSString?
    var song_num:Int?
    struct Creator {
        var url:NSString?
        var name:NSString?
        var id:NSString?
    }
    
    var creator:Creator?
    var collected:Bool
    var banner:NSString?
    var cover:NSString?
    var id:NSString?
    var hot_songs:Array<NSString>?
    
    init(initDic:NSDictionary?){
        self.collected = false;

        if initDic {
            var song_to_start = initDic!["song_to_start"] as? NSString
            var intro = initDic!["intro"] as? NSString
            var name = initDic!["name"] as? NSString
            var song_num = Int((initDic!["song_num"] as NSNumber).integerValue)
            var creatorDic = initDic!["creator"] as NSDictionary;
            var creator = Creator(url: creatorDic["url"] as? NSString, name: creatorDic["name"] as? NSString, id: creatorDic["id"] as? NSString)
            var collected = (initDic!["collected"] as NSString).isEqualToString("true")
            self.collected = collected
            var banner = initDic!["banner"] as? NSString
            var cover = initDic!["cover"] as? NSString
            var id = (initDic!["id"] as NSNumber).stringValue
            var hot_songs = initDic!["hot_songs"] as Array<String>
            self.song_to_start = song_to_start
            self.intro = intro
            self.name = name;
            self.song_num = song_num
            self.creator = creator
            self.banner = banner
            self.cover = cover
            self.id = id;
            self.hot_songs = hot_songs
        }
    }
}