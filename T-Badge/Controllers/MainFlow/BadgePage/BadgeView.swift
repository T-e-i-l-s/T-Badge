import UIKit
import SnapKit

// Будем потом подгружать из апи
struct SampleBadge {
    let name = "ЛШПИ"
    let start = "01.07.2024"
    let end = "12.07.2024"
}

final class BadgeView: UIView {
    lazy var event = SampleEvent()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    lazy var qrCodeImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "qr")
        return iv
    }()
    
    lazy var nameLabel: UILabel = {
        let l = UILabel()
        l.text = "Пропуск на событие: \(event.name)"
        l.textColor = .label
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return l
    }()
    
    lazy var timelineLabel: UILabel = {
        let l = UILabel()
        l.text = "Действителен с \(event.start) до \(event.end)"
        l.textColor = .secondaryLabel
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 19, weight: .regular)
        return l
    }()
    
    
    private func setupUI() {
        backgroundColor = .systemBackground
        
        addSubview(qrCodeImageView)
        addSubview(nameLabel)
        addSubview(timelineLabel)
        
        qrCodeImageView.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(10)
            make.width.height.equalTo(self.snp.width).inset(20)
        })
        nameLabel.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(qrCodeImageView.snp.bottom).offset(10)
        })
        timelineLabel.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
        })
    }
}
