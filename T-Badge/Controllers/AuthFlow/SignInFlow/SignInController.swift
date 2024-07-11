import Foundation
import UIKit

// MARK: - View Controller
final class SignInController: UIViewController {
    private lazy var rootView = view as! SignInView
    private let authManager: AuthManager
    private let updateAuth: () -> Void
    
    init(authManager: AuthManager, updateAuth: @escaping () -> Void) {
        self.authManager = authManager
        self.updateAuth = updateAuth
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = SignInView(frame: .zero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.acceptButton.addTarget(self, action: #selector(acceptButtonClick), for: .touchUpInside)
        
        title = "Регистрация"
    }
    
    @objc func acceptButtonClick () {
        
        
        let name = rootView.nameTextField.text ?? ""
        let username = rootView.usernameTextField.text ?? ""
        let password = rootView.passwordTextField.text ?? ""
        
        loadingStart()
        AuthStubs().createAccount(name: name, username: username, password: password, result: { [weak self] token in
            DispatchQueue.main.async {
                
                if token != nil {
                    self?.loadingFinish()
                    self?.authManager.changeStatus(.auth, token: token)
                    self?.updateAuth()
                } else {
                    self?.showAlert()
                }
            }
        })
    }
    
    private func showAlert() {
        let ac = UIAlertController(title: "Ошибка регистрации", message: "Придумайте другие данные", preferredStyle: .alert)
        let submitAction = UIAlertAction(title: "Понятно", style: .default) { [weak self] action in
            self?.loadingFinish()
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    private func loadingStart() {
        UIView.animate(withDuration: 0.2) {
            self.rootView.nameTextField.alpha = 0
            self.rootView.passwordTextField.alpha = 0
            self.rootView.usernameTextField.alpha = 0
        } completion: { done in
            self.rootView.spinner.startAnimating()
        }
        rootView.acceptButton.isEnabled = false
    }
    
    private func loadingFinish() {
        rootView.spinner.stopAnimating()
        UIView.animate(withDuration: 0.2) {
            self.rootView.nameTextField.alpha = 1
            self.rootView.passwordTextField.alpha = 1
            self.rootView.usernameTextField.alpha = 1
        }
        rootView.acceptButton.isEnabled = true
    }
    
}
