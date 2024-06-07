//
//  HomeRouter.swift
//  DemoAppLists_Kupendiran
//
//  Created by Kupendiran Alagarsamy on 06/06/24.
//

import Foundation
import UIKit

class HomeRouter:PresenterToRouterProtocol{
    
    static func createListsModule() -> ListsVC {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "ListsVC") as! ListsVC
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = HomePresenter()
        let interactor: PresenterToInteractorProtocol = HomeInteractor()
        let router:PresenterToRouterProtocol = HomeRouter()
        
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
    
    func pushToMovieScreen(model: NoticeModel, navigationConroller navigationController:UINavigationController) {
        
        let movieModue = DetailsRouter.createDetailsVcModule()
        movieModue.SelectedModel = model
        navigationController.pushViewController(movieModue,animated: true)
        
    }
    
}
