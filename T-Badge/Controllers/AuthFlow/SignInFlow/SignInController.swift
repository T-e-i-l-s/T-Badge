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
                
                self?.loadingFinish()
                
                if token != nil {
                    self?.loadingFinish()
                    self?.authManager.changeStatus(.auth, token: token)
                } else {
                    self?.showAlert()
                }
            }
        })
    }
    
    private func showAlert() {
        let ac = UIAlertController(title: "Ошибка регистрации", message: "Придумайте другие данные", preferredStyle: .alert)
        let submitAction = UIAlertAction(title: "Понятно", style: .default)
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    private func loadingStart() {
        rootView.spinner.startAnimating()
        rootView.nameTextField.isHidden = true
        rootView.passwordTextField.isHidden = true
        rootView.usernameTextField.isHidden = true
        rootView.acceptButton.isEnabled = false
        navigationItem.backBarButtonItem?.isEnabled = false
    }
    
    private func loadingFinish() {
        rootView.spinner.stopAnimating()
        rootView.nameTextField.isHidden = false
        rootView.passwordTextField.isHidden = false
        rootView.usernameTextField.isHidden = false
        rootView.acceptButton.isEnabled = true
        navigationItem.backBarButtonItem?.isEnabled = true
    }
    
}
