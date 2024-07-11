import UIKit
import SnapKit


class EventTableViewCell: UITableViewCell {
    var name: String = ""
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with event: EventModel) {
        self.name = event.name
        nameLabel.text = name
    }
    
    lazy var containerView: UIButton = {
        let b = UIButton()
        b.backgroundColor = .tertiarySystemFill
        b.layer.cornerRadius = 16
        b.isEnabled = false
        return b
    }()
    
    lazy var nameLabel: UILabel = {
        let l = UILabel()
        l.textColor = .label
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        return l
    }()
    
    lazy var badgeImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "checkmark.seal.fill")
        view.contentMode = .scaleAspectFit
        view.tintColor = .systemBlue
        return view
    }()
    
    lazy var chevronImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "chevron.right")
        view.contentMode = .scaleAspectFit
        view.tintColor = .gray.withAlphaComponent(0.5)
        return view
    }()
    
    
    private func setupUI() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.top.equalToSuperview().inset(7)
            make.height.equalTo(60)
        }
        
        containerView.addSubview(badgeImageView)
        badgeImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.bottom.equalToSuperview().inset(10)
            make.width.equalTo(35)
        }
        
        containerView.addSubview(chevronImageView)
        chevronImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
            make.height.equalTo(18)
            make.width.equalTo(18)
        }
        
        containerView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(badgeImageView.snp.trailing).offset(10)
            make.trailing.equalTo(chevronImageView.snp.leading).inset(10)
        }
    }
}
