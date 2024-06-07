//
//  HomeInteractor.swift
//  DemoAppLists_Kupendiran
//
//  Created by Kupendiran Alagarsamy on 06/06/24.
//

import Foundation
import Alamofire
import ObjectMapper

class HomeInteractor: PresenterToInteractorProtocol{
    var presenter: InteractorToPresenterProtocol?
    
    func fetchNotice() {
        if checkNetwork() {//CHECK NETWORK if START,,,,,
            AF.request(Constants.API.API_NOTICE_LIST, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { response in
                
                if(response.response?.statusCode == 200){
                    if (response.result as AnyObject?) != nil {
                        if let jsonValue = response.value as AnyObject? {
                            //print("jsonValue: \(jsonValue)")
                            //
                            core_DataContext_delete_AllDatasFromGivenParticularEntity(entityName: "AppListsEntity")
                            //
                            let arrayResponse = jsonValue as? [[String : Any]] //["notice_list"]
                            let arrayObject = Mapper<NoticeModel>().mapArray(JSONArray: arrayResponse!)
                            
                            arrayObject.enumerated().forEach { (index, element) in
                                //
                                core_DataContext_AddLists(name: element.name, state: element.state_province, country: element.country, country_code: element.alpha_two_code, web_pages: element.web_pages)
                                //
                            }
                            
                            self.presenter?.noticeFetchedSuccess(noticeModelArray: arrayObject)
                        }
                    } else {
                        do {
                            let items = core_DataContext_fetch_AllDatas()
                            if items!.count > 0 {
                                var resultData:[[String : Any]]? = [[String : Any]]()
                                items?.enumerated().forEach { (index, element) in
                                    //
                                    let name = dataValidation(data: element.name as AnyObject)
                                    let state_province = dataValidation(data: element.state_province as AnyObject)
                                    let country = dataValidation(data: element.country as AnyObject)
                                    let alpha_two_code = dataValidation(data: element.alpha_two_code as AnyObject)
                                    let web_pages:[String]? = element.web_pages as [String]?
                                    let val:[String : Any] = ["name":name, "state-province":state_province, "country":country, "alpha_two_code":alpha_two_code, "web_pages":web_pages!]
                                    resultData?.append(val)
                                }
                                updateMainQueue {
                                    let arrayObj = Mapper<NoticeModel>().mapArray(JSONArray: resultData!)
                                    self.presenter?.noticeFetchedSuccess(noticeModelArray: arrayObj)
                                }
                            } else {
                                self.presenter?.noticeFetchFailed()
                            }
                        }//DO End,,,,,
                    }
                } else {
                    self.presenter?.noticeFetchFailed()
                }
            })
            
        } else {//CHECK NETWORK if END else START,,,,, 
            do {
                let items = core_DataContext_fetch_AllDatas()
                if items!.count > 0 {
                    var resultData:[[String : Any]]? = [[String : Any]]()
                    items?.enumerated().forEach { (index, element) in
                        //
                        let name = dataValidation(data: element.name as AnyObject)
                        let state_province = dataValidation(data: element.state_province as AnyObject)
                        let country = dataValidation(data: element.country as AnyObject)
                        let alpha_two_code = dataValidation(data: element.alpha_two_code as AnyObject)
                        let web_pages:[String]? = element.web_pages as [String]?
                        let val:[String : Any] = ["name":name, "state-province":state_province, "country":country, "alpha_two_code":alpha_two_code, "web_pages":web_pages!]
                        resultData?.append(val)
                    }
                    updateMainQueue {
                        let arrayObj = Mapper<NoticeModel>().mapArray(JSONArray: resultData!)
                        self.presenter?.noticeFetchedSuccess(noticeModelArray: arrayObj)
                    }
                } else {
                    self.presenter?.noticeFetchFailed()
                }
            }//DO End,,,,,
        }//CHECK NETWORK else END,,,,,
        
    }
    
    
}



/*
 catch {
    print("Could not fetch.")
}
 */


/*AF.request(Constants.API.API_NOTICE_LIST).response{ response in
    print("Response: \(response)")
    
    if(response.response?.statusCode == 200){
        if let json = response.result as AnyObject? {
            let arrayResponse = json as! NSArray //["notice_list"]
            let arrayObject = Mapper<NoticeModel>().mapArray(JSONArray: arrayResponse as! [[String : Any]]);
            self.presenter?.noticeFetchedSuccess(noticeModelArray: arrayObject)
        }
    } else {
        self.presenter?.noticeFetchFailed()
    }
}
 */

/*switch response.result {
    case .success:
        //let resJSON = JSON(response.value)
        
    case .failure(let error):
        print("error==>>", error)
        self.presenter?.noticeFetchFailed()
}//switch End,,,,,
*/
