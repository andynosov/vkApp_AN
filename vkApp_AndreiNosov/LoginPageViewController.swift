//
//  ViewController.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 12.12.2021.
//

import UIKit

class LoginPageViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func loginButtonAction(_ sender: Any) {
        print ("successfully log in")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

