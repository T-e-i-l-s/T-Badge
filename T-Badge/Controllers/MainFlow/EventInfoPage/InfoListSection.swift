import UIKit
import SnapKit

class InfoListSection: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, text: String) {
        sectionTitle.text = title
        sectionText.text = text
    }
    
    lazy var sectionTitle: UILabel = {
        let l = UILabel()
        l.text = "Название"
        l.textColor = .secondaryLabel
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return l
    }()
    
    lazy var sectionText: UILabel = {
        let l = UILabel()
        l.text = "Тут будет основной текст"
        l.textColor = .label
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return l
    }()
    
    private func setupUI() {
        backgroundColor = .tertiarySystemFill
        
        addSubview(sectionTitle)
        sectionTitle.snp.makeConstraints({ make in
            make.leading.trailing.top.equalToSuperview().inset(17)
        })
        
        addSubview(sectionText)
        sectionText.snp.makeConstraints({ make in
            make.leading.trailing.bottom.equalToSuperview().inset(17)
            make.top.equalTo(sectionTitle.snp.bottom).offset(2)
        })
    }
}
