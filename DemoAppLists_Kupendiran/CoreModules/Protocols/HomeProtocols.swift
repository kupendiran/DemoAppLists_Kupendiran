//
//  HomeProtocols.swift
//  DemoAppLists_Kupendiran
//
//  Created by Kupendiran Alagarsamy on 06/06/24.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingNotice()
    func showDetailsPageController(model: NoticeModel, navigationController:UINavigationController)

}

protocol PresenterToViewProtocol: class{
    func showNotice(noticeArray:Array<NoticeModel>)
    func showError()
}

protocol PresenterToRouterProtocol: class {
    static func createListsModule()-> ListsVC
    func pushToMovieScreen(model: NoticeModel, navigationConroller:UINavigationController)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchNotice()
}

protocol InteractorToPresenterProtocol: class {
    func noticeFetchedSuccess(noticeModelArray:Array<NoticeModel>)
    func noticeFetchFailed()
}
