//
//  ViewController.swift
//  DemoAppLists_Kupendiran
//
//  Created by Kupendiran Alagarsamy on 06/06/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    
    @IBAction func StartedBtnPressed(_ sender: UIButton) {
        Constants.AppDatas.APP_LIST_API_WANT_TO_CALL = true
        let movieModue = HomeRouter.createListsModule()
        self.navigationController?.pushViewController(movieModue,animated: true)
        
    }
    
}





//let registerVC = instantiateVC(storyboardName: Constants.Storyboard.Name.MAIN, storyboardId: "ListsVC") as! ListsVC
//self.navigationController?.pushViewController(registerVC, animated: true)
