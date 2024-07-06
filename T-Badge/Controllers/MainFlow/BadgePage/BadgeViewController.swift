import UIKit
import SnapKit

// MARK: - View Controller
final class BadgeViewController: UIViewController {
    override func loadView() {
        super.loadView()
        view = BadgeView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Пропуск"
    }
}
