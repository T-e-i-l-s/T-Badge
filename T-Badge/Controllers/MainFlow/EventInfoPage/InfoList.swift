import UIKit
import SnapKit

final class InfoList: UIView, UITableViewDataSource, UITableViewDelegate {
    lazy var data: [String: String] = [:]
    
    private var tableViewHeightConstraint: Constraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(data: [String: String]) {
        self.data = data
        tableView.reloadData()
        // Обновляем высоту таблицы после перезагрузки данных
        DispatchQueue.main.async {
            self.updateTableViewHeight()
        }
    }
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.sectionHeaderTopPadding = 0
        tv.dataSource = self
        tv.delegate = self
        tv.separatorStyle = .singleLine
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 44
        tv.isScrollEnabled = false
        return tv
    }()
    
    private func setupUI() {
        layer.cornerRadius = 17
        clipsToBounds = true
        
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            self.tableViewHeightConstraint = make.height.equalTo(0).constraint
        }
    }
    
    private func updateTableViewHeight() {
        tableView.layoutIfNeeded()
        let height = tableView.contentSize.height
        tableViewHeightConstraint?.update(offset: height - 14)
        self.layoutIfNeeded()
        self.superview?.layoutIfNeeded()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StandardCell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "StandardCell")
        
        let keys = Array(data.keys)
        let values = Array(data.values)
        
        cell.selectionStyle = .none
        cell.isEditing = false
        cell.backgroundColor = .tertiarySystemFill
        cell.textLabel?.text = keys[indexPath.row]
        cell.detailTextLabel?.text = values[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        cell.textLabel?.textColor = .secondaryLabel
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
}
