import UIKit
import SnapKit

final class HomeView: UIView, UITableViewDataSource, UITableViewDelegate {
    lazy var eventsList: [EventModel] = [] {
        didSet {
            tableView.reloadData()
            updateEmptyView()
        }
    }
    
    weak var viewController: HomeViewController?
    
    lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.sectionHeaderTopPadding = 0
        tv.dataSource = self
        tv.delegate = self
        tv.separatorStyle = .none
        tv.register(EventTableViewCell.self, forCellReuseIdentifier: "EventTableViewCell")
        tv.rowHeight = UITableView.automaticDimension
        return tv
    }()
    
    lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "Здесь пока пусто"
        label.textAlignment = .center
        label.textColor = .gray
        label.isHidden = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        backgroundColor = .systemBackground
        
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(emptyLabel)
        emptyLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        addSubview(spinner)
        spinner.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        updateEmptyView()
    }
    
    private func updateEmptyView() {
        emptyLabel.isHidden = !eventsList.isEmpty
    }

    @objc private func dismissKeyboard() {
        self.endEditing(true)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as? EventTableViewCell else {
            return UITableViewCell()
        }
        
        let event = eventsList[indexPath.row]
        cell.configure(with: event)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewController?.openEventInfo(id: indexPath.row)
    }
}
