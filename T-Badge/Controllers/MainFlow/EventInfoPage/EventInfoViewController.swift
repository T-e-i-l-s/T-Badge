import UIKit
import SnapKit

// MARK: - View Controller
final class EventInfoViewController: UIViewController {
    private lazy var rootView = view as! EventInfoView
    
    override func loadView() {
        super.loadView()
        view = EventInfoView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = rootView.event.name
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
