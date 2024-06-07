//
//  HomeListsModel.swift
//  DemoAppLists_Kupendiran
//
//  Created by Kupendiran Alagarsamy on 06/06/24.
//

import Foundation
import ObjectMapper

private let NAME = "name"
private let ALPHA_TWO_CODE = "alpha_two_code"
private let WEB_PAGES = "web_pages"
private let COUNTRY = "country"
private let STATE_PROVIENCE = "state-province"

class NoticeModel: Mappable{
    
    internal var name:String?
    internal var alpha_two_code:String?
    internal var web_pages:[String]?
    internal var country:String?
    internal var state_province:String?
    
    required init?(map:Map) {
        mapping(map: map)
    }
    
    func mapping(map:Map){
        name <- map[NAME]
        alpha_two_code <- map[ALPHA_TWO_CODE]
        web_pages <- map[WEB_PAGES]
        country <- map[COUNTRY]
        state_province <- map[STATE_PROVIENCE]
    }
}


/*
class HomeListsModel {
    
    var mainData: [HomeListsData]?
    var mainDataCount: Int?
    
    init(response: [[String: Any]]?) {
        self.mainData = [HomeListsData]()
        if let items = response {
            for item in items {
                let itemValue = HomeListsData(response: item)
                self.mainData?.append(itemValue)
            }//for End,,,,,
            
            mainDataCount = response?.count as? Int
            
        }//items if End,,,,,
        
    }
    
    
}


class HomeListsData {
    //Topic Variables
    var name: String?
    var alpha_two_code: String?
    var web_pages: String?
    var country: String?
    var state_province: String?
    
    init(response: [String: Any]) {
        
        self.name = dataValidation(data: response["name"] as AnyObject)
        self.alpha_two_code = dataValidation(data: response["alpha_two_code"] as AnyObject)
        self.web_pages = dataValidation(data: response["web_pages"] as AnyObject)
        self.country = dataValidation(data: response["country"] as AnyObject)
        self.state_province = dataValidation(data: response["state-province"] as AnyObject)
        
        //let extraSpaceRemoveText_1 = title.replacingOccurrences(of: "\n", with: " ")
        //self.topic_title = extraSpaceRemoveText_1
        
    }
    
}
*/
