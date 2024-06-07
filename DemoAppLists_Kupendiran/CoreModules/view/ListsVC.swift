//
//  ListsVC.swift
//  DemoAppLists_Kupendiran
//
//  Created by Kupendiran Alagarsamy on 06/06/24.
//

import UIKit
import ObjectMapper

class ListsVC: UIViewController {
    
    var presentor:ViewToPresenterProtocol?
    
    @IBOutlet weak var uiTableView: UITableView!
    var noticeArrayList:Array<NoticeModel> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        uiTableView.delegate = self
        uiTableView.dataSource = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if Constants.AppDatas.APP_LIST_API_WANT_TO_CALL == true {
            Constants.AppDatas.APP_LIST_API_WANT_TO_CALL = false
            showProgressIndicator(view: self.view)
            presentor?.startFetchingNotice()
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Back action using navigation
    @IBAction func backIconBtn_Pressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension ListsVC:PresenterToViewProtocol{
    
    func showNotice(noticeArray: Array<NoticeModel>) {

        self.noticeArrayList = noticeArray
        self.uiTableView.reloadData()
        hideProgressIndicator(view: self.view)
        
    }
    
    func showError() {

        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching data!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}

extension ListsVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeArrayList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeListsCell", for: indexPath) as! HomeListsCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.name.text = noticeArrayList[indexPath.row].name
        let stateName = noticeArrayList[indexPath.row].state_province
        if stateName != nil {
            cell.state.text = stateName
        } else {
            cell.state.text = "--"
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedModel = noticeArrayList[indexPath.row]
        
        presentor?.showDetailsPageController(model: selectedModel, navigationController: navigationController!)

    }
    
    
}

class HomeListsCell:UITableViewCell{
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var state: UILabel!
    
}



