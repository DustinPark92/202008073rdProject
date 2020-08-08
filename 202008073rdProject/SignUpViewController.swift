//
//  SignUpViewController.swift
//  202008073rdProject
//
//  Created by Dustin on 2020/08/07.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import SwiftyJSON

enum UserStatus : Int{
    case signUp = 0 //회원가입
    case normal = 1// 메인 페이지로 연결
    
}

class SignUpViewController: UIViewController {
    
    //MARK : - Properties

    var usernameTextField = UITextField()
    var emailTextField = UITextField()
    var passwordTextField = UITextField()
    var signUpButton = UIButton()
    var defaults = UserDefaults.standard
    let box = UIView()
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(usernameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        configureTextField(tf: usernameTextField, placeholder: "닉네임")
        configureTextField(tf: emailTextField, placeholder: "이메일")
        configureTextField(tf: passwordTextField, placeholder: "패스워드")
        
//        view.addSubview(box)
//        box.snp.makeConstraints { make in
//            make.top.equalTo(view).offset(20)
//            make.left.equalTo(view).offset(20)
//            make.right.equalTo(view).offset(-20)
//            make.bottom.equalTo(view).offset(-20)
//        }
        
        
        
        usernameTextField.frame = CGRect(x: 20, y: 100, width: UIScreen.main.bounds.width - 40, height: 44)
        emailTextField.frame = CGRect(x: 20, y: 150, width: UIScreen.main.bounds.width - 40, height: 44)
        passwordTextField.frame = CGRect(x: 20, y: 200, width: UIScreen.main.bounds.width - 40, height: 44)
        
        view.addSubview(signUpButton)
        signUpButton.backgroundColor = .red
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)

        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(self.view).offset(-40)
            
        }
        
        signUpButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)

       
    }
    
    

    
    @objc func handleSignUp() {
        
        let param = [
            "username" : usernameTextField.text!,
            "email" : emailTextField.text!,
            "password" : passwordTextField.text!
        ]
        
        
        AF.request("http://192.168.0.2:32769/auth/local/register", method: .post,parameters: param).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                self.defaults.set(json["jwt"].stringValue, forKey: "token")
                self.defaults.set(UserStatus.normal.rawValue, forKey: "userStatus")
                
                
                //시작 화면을 없애고 여기서 시작한다. 
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = ViewController()
                
                
                
                
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    
    func configureTextField(tf : UITextField, placeholder: String) {
        
        tf.placeholder = placeholder
        tf.layer.borderColor = UIColor.green.cgColor
        tf.layer.borderWidth = 1
        tf.borderStyle = .none
 
    }
    



}
