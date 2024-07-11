import UIKit
import SnapKit

// MARK: - View Controller
final class HomeViewController: UIViewController {
    private lazy var rootView = view as! HomeView
    
    weak var accountViewController: AccountViewController?
    
    override func loadView() {
        super.loadView()
        view = HomeView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Главная"
        // Подгружаем данные
        requestEvents()
        // Рендерим ui
        rootView.viewController = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(requestCode))
    }
    
    @objc private func requestCode() {
        showInputModal()
    }
    
    private func showInputModal() {
        let ac = UIAlertController(title: "Введите код", message: "Код должен быть предоставлен организатором мероприятия", preferredStyle: .alert)
        ac.addTextField()

        let submitAction = UIAlertAction(title: "Войти", style: .default) { [unowned ac, weak self] _ in
            if let answer = ac.textFields![0].text {
                self?.addEvent(answer: answer)
            } else {
                print("empty text field at Home View Controller")
            }
        }

        ac.addAction(submitAction)

        present(ac, animated: true)
    }
    
    private func requestEvents() {
        startAnimation()
        
        guard let token = KeychainManager.shared.getKey() else {
            return
        }
        
        EventsStubs(authToken: token).getEvents(result: { [weak self] events in
            DispatchQueue.main.async {
                self?.stopAnimation()
                if let eventsList = events {
                    self?.rootView.eventsList = eventsList
                    self?.rootView.tableView.reloadData()
                }
            }
        })
    }
    
    public func openEventInfo(id: Int) {
        let vc = EventInfoViewController(event: rootView.eventsList[id])
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func addEvent(answer: String) {
        guard let token = KeychainManager.shared.getKey() else {
            return
        }
        startAnimation()
        EventsStubs(authToken: token).visitEvent(index: answer) { [weak self] res in
            if res {
                self?.accountViewController?.loadUserData()
                EventsStubs(authToken: token).getEvents(result: { events in
                    DispatchQueue.main.async {
                        self?.stopAnimation()
                        if let eventsList = events {
                            self?.rootView.eventsList = eventsList
                            self?.rootView.tableView.reloadData()
                        }
                    }
                })
            } else {
                DispatchQueue.main.async {
                    self?.stopAnimation()
                    self?.showAlert()
                }
            }
        }
    }

    
    private func showAlert() {
        let ac = UIAlertController(title: "Ошибка", message: "Неверный код", preferredStyle: .alert)
        let submitAction = UIAlertAction(title: "Понятно", style: .default)
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    private func startAnimation() {
        rootView.spinner.startAnimating()
        rootView.emptyLabel.alpha = 0
        rootView.tableView.alpha = 0
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    private func stopAnimation() {
        rootView.spinner.stopAnimating()
        navigationItem.rightBarButtonItem?.isEnabled = true
        UIView.animate(withDuration: 0.2) {
            self.rootView.emptyLabel.alpha = 1
            self.rootView.tableView.alpha = 1
        }
    }
}
