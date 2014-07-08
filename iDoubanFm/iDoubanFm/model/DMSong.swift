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
    let length:Float
    let subtype:String
    let public_time:String
    let sid:Int
    let aid:Int
    let sha256:String
    let kbps:Int
    let albumtitle:String
    var like:Bool
    init (picture:String,album:String,ssid:String,artist:String,url:String,company:String,title:String,rating_avg:Float,length:Float,subtype:String,public_time:String,sid:Int,aid:Int,sha256:String,kbps:Int,albumtitle:String,like:Bool){
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
        self.aid = aid
        self.sha256 = sha256
        self.kbps = kbps
        self.albumtitle = albumtitle
        self.like = like
    }

}