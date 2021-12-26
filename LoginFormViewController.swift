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
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWasShown),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        navigationController?.navigationBar.isHidden = false
    }

    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue)
            .cgRectValue
            .size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        ScrollViewLoginPage.contentInset = contentInsets
        ScrollViewLoginPage.scrollIndicatorInsets = contentInsets
        UIView.animate(withDuration: 1) {
            self.ScrollViewLoginPage.constraints
                .first(where: { $0.identifier == "keyboardShown" })?
                .priority = .required
            self.ScrollViewLoginPage.constraints
                .first(where: { $0.identifier == "keyboardHide" })?
                .priority = .defaultHigh
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        ScrollViewLoginPage.contentInset = contentInsets
        UIView.animate(withDuration: 1) {
            self.ScrollViewLoginPage.constraints
                .first(where: { $0.identifier == "keyboardShown" })?
                .priority = .defaultHigh
            self.ScrollViewLoginPage.constraints
                .first(where: { $0.identifier == "keyboardHide" })?
                .priority = .required
            self.view.layoutIfNeeded()
        }
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
