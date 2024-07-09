import UIKit
import SnapKit

// MARK: - View Controller
final class LoginViewController: UIViewController {
    private lazy var rootView = view as! LoginView
    
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
        super.loadView()
        view = LoginView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.acceptButton.addTarget(self, action: #selector(loginButtonClick), for: .touchUpInside)
        rootView.createAccountButton.addTarget(self, action: #selector(openSignInController), for: .touchUpInside)
        
        title = "Вход"
    }

    @objc func loginButtonClick() {
        let name = rootView.nameTextField.text ?? ""
        let password = rootView.passwordTextField.text ?? ""
        if (AuthStubs().checkAccess(name: name, password: password)) {
            authManager.changeStatus(.auth)
            updateAuth()
        } else {
            showAlert()
        }
    }
    
    private func showAlert() {
        let ac = UIAlertController(title: "Ошибка входа", message: "Неверный логин или пароль", preferredStyle: .alert)
        let submitAction = UIAlertAction(title: "Понятно", style: .default)
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    
    @objc func openSignInController() {
        let signInVC = SignInController(authManager: authManager, updateAuth: updateAuth)
        signInVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(signInVC, animated: true)
    }
}
