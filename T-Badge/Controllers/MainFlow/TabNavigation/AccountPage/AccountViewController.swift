import UIKit
import SnapKit

// MARK: - View Controller
final class AccountViewController: UIViewController {
    override func loadView() {
        super.loadView()
        view = AccountView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
    }
}
