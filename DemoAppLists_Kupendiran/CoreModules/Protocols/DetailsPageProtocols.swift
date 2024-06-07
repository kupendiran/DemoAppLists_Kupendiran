//
//  DetailsPageProtocols.swift
//  DemoAppLists_Kupendiran
//
//  Created by Kupendiran Alagarsamy on 06/06/24.
//

import Foundation
import UIKit

protocol DetailsPage_ViewToPresenterProtocol: class{
    
    var view: DetailsPage_PresenterToViewProtocol? {get set}
    var interactor: DetailsPage_PresenterToInteractorProtocol? {get set}
    var router: DetailsPage_PresenterToRouterProtocol? {get set}
    func showLists_PageController(navigationController:UINavigationController)

}

protocol DetailsPage_PresenterToViewProtocol: class{
    func showSelectedNotice(noticeModel:NoticeModel)
}

protocol DetailsPage_PresenterToInteractorProtocol: class {
    var presenter:DetailsPage_InteractorToPresenterProtocol? {get set}
}

protocol DetailsPage_PresenterToRouterProtocol: class {
    static func createDetailsVcModule()-> DetailsVC
    func pushToListsScreen(navigationConroller:UINavigationController)
}

protocol DetailsPage_InteractorToPresenterProtocol: class {
    
}
