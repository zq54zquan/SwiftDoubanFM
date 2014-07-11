//
//  DMSong.swift
//  iDoubanFm
//
//  Created by zhou quan on 6/27/14.
//  Copyright (c) 2014 zquan. All rights reserved.
//

import Foundation
class DMSong {
    let picture:String
    let album:String
    let ssid:String
    let artist:String
    let url:String
    let company:String
    let title:String
    let rating_avg:Float
    let length:Int
    let subtype:String
    let public_time:String
    let sid:Int
    let aid:Int
    let sha256:String
    let kbps:Int
    let albumtitle:String
    var like:Bool
    init (songDic:NSDictionary){
        var aid = (songDic["aid"] as? NSString)?.integerValue
        var album = songDic["album"] as String
        var albumtitle = songDic["albumtitle"] as String
        var artist = songDic["artist"] as String
        var company = songDic["company"] as String
        var kbps = (songDic["kbps"] as NSString).integerValue
        var length = (songDic["length"] as NSNumber).integerValue
        var like = (songDic["like"] as NSNumber).integerValue != 0
        var picture = songDic["picture"] as String
        var public_time = songDic["public_time"] as String
        var rating_avg = (songDic["rating_avg"] as NSNumber).floatValue;
        var sha256 = songDic["sha256"] as String
        var sid = (songDic["sid"] as NSString).integerValue
        var songlists_count = (songDic["songlists_count"] as NSNumber).integerValue
        var ssid = songDic["ssid"] as String
        var subtype = songDic["subtype"] as String
        var title = songDic["title"] as String
        var url = songDic["url"] as String
        
        self.picture = picture
        self.album = album
        self.ssid = ssid
        self.url = url
        self.company = company
        self.artist = artist
        self.title = title
        self.rating_avg = rating_avg
        self.length = length
        self.subtype = subtype
        self.public_time = public_time
        self.sid = sid
        self.aid = aid!
        self.sha256 = sha256
        self.kbps = kbps
        self.albumtitle = albumtitle
        self.like = like
    }

}