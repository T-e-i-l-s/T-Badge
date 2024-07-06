import UIKit
import SnapKit

// MARK: - View Controller
final class LoginViewController: UIViewController {
    private lazy var rootView = view as! LoginView
    
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
        // TODO: Add Login Logic
    }
    
    @objc func openSignInController() {
        let signInVC = SignInController()
        signInVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(signInVC, animated: true)
    }
}
