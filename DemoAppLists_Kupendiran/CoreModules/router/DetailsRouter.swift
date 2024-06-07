//
//  DetailsRouter.swift
//  DemoAppLists_Kupendiran
//
//  Created by Kupendiran Alagarsamy on 06/06/24.
//

import Foundation
import UIKit

class DetailsRouter:DetailsPage_PresenterToRouterProtocol, DetailsPage_InteractorToPresenterProtocol, DetailsPage_ViewToPresenterProtocol {
    
    var view: DetailsPage_PresenterToViewProtocol?
    
    var interactor: DetailsPage_PresenterToInteractorProtocol?
    
    var router: DetailsPage_PresenterToRouterProtocol?
    
    func showLists_PageController(navigationController: UINavigationController) {
        router?.pushToListsScreen(navigationConroller:navigationController)
    }
    
    
    static func createDetailsVcModule() -> DetailsVC {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        
        let presenter: DetailsPage_ViewToPresenterProtocol & DetailsPage_InteractorToPresenterProtocol = DetailsRouter()
        let interactor: DetailsPage_PresenterToInteractorProtocol = DetailsInteractor()
        let router:DetailsPage_PresenterToRouterProtocol = DetailsRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func pushToListsScreen(navigationConroller navigationController:UINavigationController) {
        navigationController.popViewController(animated: true)
        //let movieModue = HomeRouter.createListsModule()
        //navigationController.pushViewController(movieModue,animated: true)
        
    }
    
}

