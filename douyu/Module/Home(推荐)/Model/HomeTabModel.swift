//
//  HomeTabModel.swift
//  douyu
//
//  Created by James on 2021/8/15.
//

import Foundation

struct HomeTabModel : Codable {
    var topConf : [HomeTopConf]
    var siteConf :[HomeSiteConf]
}



struct HomeTopConf : Codable {
    var name : String
    var type : String
    var tabId : String
    var isSel : String
}


struct HomeSiteConf : Codable {
    var type : String
    var img : String
    var isCtrl : Int
}
