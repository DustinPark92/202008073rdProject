//
//  ViewController.swift
//  202008073rdProject
//
//  Created by Dustin on 2020/08/07.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    var defaults = UserDefaults.standard


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow

        
        fetchControl()
        

        
        
    }
    

    
    
    func fetchControl() {
        let token = defaults.string(forKey: "token")
        let status = defaults.string(forKey: "userStatus")
        
        let url = "http://192.168.0.2:32769/tweets"
        let header : HTTPHeaders = ["Authorization" : "Bearer \(token!)"]
        
        
        AF.request(url, method: .get,headers: header ).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }


}

