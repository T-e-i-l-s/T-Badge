import UIKit
import SnapKit

// MARK: - View Controller
final class AccountViewController: UIViewController {
    
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
        view = AccountView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.badge.minus"), style: .plain, target: self, action: #selector(logoutButtonTap))
    }
    
    @objc private func logoutButtonTap() {
        authManager.changeStatus(.notAuth)
        updateAuth()
    }
    
}
