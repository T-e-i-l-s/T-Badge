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
        
        AuthStubs().createAccount(name: name, username: username, password: password, result: { [weak self] token in
            if let token = token {
                self?.authManager.changeStatus(.auth, token: token)
                self?.updateAuth()
            } else {
                self?.showAlert()
            }
        })
    }
    
    private func showAlert() {
        let ac = UIAlertController(title: "Ошибка входа", message: "Неверный логин или пароль", preferredStyle: .alert)
        let submitAction = UIAlertAction(title: "Понятно", style: .default)
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
}
