import UIKit
import SnapKit

final class InfoList: UIView, UITableViewDataSource, UITableViewDelegate {
    lazy var data: [String: String] = [:]
    
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
    }
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .white
        tv.sectionHeaderTopPadding = 0
        tv.dataSource = self
        tv.delegate = self
        tv.separatorStyle = .singleLine
        tv.rowHeight = UITableView.automaticDimension
        return tv
    }()

    private func setupUI() {
        layer.cornerRadius = 17
        clipsToBounds = true
        
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StandardCell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "StandardCell")
        
        let keys = Array(data.keys)
        let values = Array(data.values)
        
        cell.backgroundColor = .tertiarySystemFill
        cell.textLabel?.text = keys[indexPath.row]
        cell.detailTextLabel?.text = values[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15, weight: .light)
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
