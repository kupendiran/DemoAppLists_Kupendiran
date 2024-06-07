//
//  CoreDataHandler.swift
//

import Foundation
import UIKit
import CoreData




//MARK: Add lists Start,,,,,
func core_DataContext_AddLists(name: String?, state:String?, country: String?, country_code: String?, web_pages: [String]?) {
    let addEntity = AppListsEntity(context: Constants.coreDataContext)
    addEntity.name = name
    addEntity.state_province = state
    addEntity.country = country
    addEntity.alpha_two_code = country_code
    addEntity.web_pages = web_pages
    do {
        try Constants.coreDataContext.save()
    } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
    }
}
//MARK: Add lists End,,,,,

//MARK: Core - Fetch All kind of datas functionalities Start,,,,,
func core_DataContext_fetch_AllDatas() -> [AppListsEntity]? {
    //MARK: - Core Data Initialise
    var items:[AppListsEntity]?
    do {
        items = try Constants.coreDataContext.fetch(AppListsEntity.fetchRequest())
        return items
    } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
        return items
    }
    //print(self.items!)
}
//MARK: Core - Fetch All kind of datas functionalities End,,,,,

//MARK: CORE - Delete All Datas From Given Particular Entity Start,,,,,
func core_DataContext_delete_AllDatasFromGivenParticularEntity(entityName: String) {
    let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entityName)
    let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
    do {
        try Constants.coreDataContext.execute(deleteRequest)
    } catch let error as NSError {
        // TODO: handle the error
        print("Could not delete All===>> \(error), \(error.userInfo)")
    }
}
//MARK: CORE - Delete All Datas From Given Particular Entity End,,,,,
