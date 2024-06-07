//
//  HomePresenter.swift
//  DemoAppLists_Kupendiran
//
//  Created by Kupendiran Alagarsamy on 06/06/24.
//

import Foundation
import UIKit

class HomePresenter:ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingNotice() {
        interactor?.fetchNotice()
    }
    
    func showDetailsPageController(model: NoticeModel, navigationController: UINavigationController) {
        router?.pushToMovieScreen(model: model, navigationConroller:navigationController)
    }

}

extension HomePresenter: InteractorToPresenterProtocol{
    
    func noticeFetchedSuccess(noticeModelArray: Array<NoticeModel>) {
        view?.showNotice(noticeArray: noticeModelArray)
    }
    
    func noticeFetchFailed() {
        view?.showError()
    }
    
    
}
