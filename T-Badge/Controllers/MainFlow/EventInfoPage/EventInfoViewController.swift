import UIKit
import SnapKit

// MARK: - View Controller
final class EventInfoViewController: UIViewController {
    private lazy var rootView = view as! EventInfoView
    private let event: EventModel
    
    init(event: EventModel) {
        self.event = event
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = EventInfoView(event: self.event)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = event.name
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
