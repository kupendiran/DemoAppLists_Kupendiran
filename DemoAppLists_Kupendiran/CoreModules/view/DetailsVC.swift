//
//  DetailsVC.swift
//  DemoAppLists_Kupendiran
//
//  Created by Kupendiran Alagarsamy on 06/06/24.
//

import UIKit

class DetailsVC: UIViewController {
    
    var presentor:DetailsPage_ViewToPresenterProtocol?
    var SelectedModel:NoticeModel?
    
    
    
    @IBOutlet weak var lbl_Name: UILabel!
    @IBOutlet weak var lbl_State: UILabel!
    @IBOutlet weak var lbl_CountryName: UILabel!
    @IBOutlet weak var lbl_CountryCode: UILabel!
    @IBOutlet weak var lbl_WebLink: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //
        self.showSelectedNotice(noticeModel: SelectedModel!)
        //
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func refreshIconBtn_Pressed(_ sender: UIButton) {
        Constants.AppDatas.APP_LIST_API_WANT_TO_CALL = true
        presentor?.showLists_PageController(navigationController: navigationController!)
    }
    
    //MARK: Back action using navigation
    @IBAction func backIconBtn_Pressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension DetailsVC:DetailsPage_PresenterToViewProtocol{
    
    func showSelectedNotice(noticeModel:NoticeModel) {
        print("SelectedModel_Name===>>", dataValidation(data: noticeModel.name as AnyObject))
        
        self.lbl_Name.text = dataValidation(data: noticeModel.name as AnyObject)
        let state = dataValidation(data: noticeModel.state_province as AnyObject)
        if state != "" {
            self.lbl_State.text = "State : " + state
        } else {
            self.lbl_State.text = "State : --"
        }
        self.lbl_CountryName.text = dataValidation(data: noticeModel.country as AnyObject)
        self.lbl_CountryCode.text = dataValidation(data: noticeModel.alpha_two_code as AnyObject)
        
        if noticeModel.web_pages?.count != 0 {
            let newWebLink1 = dataValidation(data: noticeModel.web_pages?[0] as AnyObject)
            self.lbl_WebLink.text = newWebLink1
        } else {
            self.lbl_WebLink.text = ""
        }
        
    }
    
}
