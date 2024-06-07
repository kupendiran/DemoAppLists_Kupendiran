//
//  DetailsPagePresenter.swift
//  DemoAppLists_Kupendiran
//
//  Created by Kupendiran Alagarsamy on 06/06/24.
//

import Foundation
import UIKit

class DetailsPagePresenter:DetailsPage_ViewToPresenterProtocol {
    
    var view: DetailsPage_PresenterToViewProtocol?
    
    var interactor: DetailsPage_PresenterToInteractorProtocol?
    
    var router: DetailsPage_PresenterToRouterProtocol?
    
    
    func showLists_PageController(navigationController: UINavigationController) {
        router?.pushToListsScreen(navigationConroller:navigationController)
    }

}



extension HomePresenter: DetailsPage_InteractorToPresenterProtocol{
    
    
}
