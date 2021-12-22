//
//  LoginFormViewController.swift
//  vkApp_AndreiNosov
//
//  Created by Andrei Nosov on 16.12.2021.
//


import UIKit


class LoginPageViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    @IBAction func loginButtonAction(_ sender: Any) {
    }
    

    
    @IBOutlet weak var ScrollViewLoginPage: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hideKeyboard = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))

        ScrollViewLoginPage?.addGestureRecognizer(hideKeyboard)
        loginButton.backgroundColor = .systemGray6
        loginButton.layer.cornerRadius = 5
        // * делегаты для переноса фокуса на следующее поле ввода
        self.emailField.delegate = self
        self.passwordField.delegate = self
   
    }

    override func viewWillAppear(_ animated: Bool) {
      
    }


    
   
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // Проверяем данные
        let checkResult = checkUserData()
        // Если данные не верны, покажем ошибку
        if !checkResult {
            showLoginError()
        }
        // Вернем результат
        return checkResult
    }
    
    func checkUserData() -> Bool {
        guard let login = emailField.text,
              let password = passwordField.text else { return false }
        if login == "" && password == "" {
            return true
        } else {
            return false
        }
    }
    
    
    func showLoginError() {
        // Создаем контроллер
        let alter = UIAlertController(title: "Error", message: "Incorrect password or/and email", preferredStyle: .alert)
        // Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        // Добавляем кнопку на UIAlertController
        alter.addAction(action)
        // Показываем UIAlertController
        present(alter, animated: true, completion: nil)
    }
    
    
    // MARK: - Functions

    
    // клик по любому месту scrollView для скрытия клавиатуры
    @objc func hideKeyboard(){
        ScrollViewLoginPage.endEditing(true)
    }
    

    
    
    
    
}
