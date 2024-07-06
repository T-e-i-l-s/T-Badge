import UIKit
import SnapKit

// Будем потом подгружать из апи
struct SampleEvent {
    let name = "ЛШПИ"
    let description = "Школа по программной инженерии является правопреемницей летней школы по разработке мобильных приложений. Обучение в школе проходит по двум направлениям: разработка и GameDev. В каждом направлении есть свои образовательные треки."
    let start = "01.07.2024"
    let end = "12.07.2024"
}

final class EventInfoView: UIView {
    lazy var event = SampleEvent()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    lazy var nameLabel: UILabel = {
        let l = UILabel()
        l.text = event.name
        l.textColor = .label
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return l
    }()
    
    lazy var descriptionLabel: UILabel = {
        let l = UILabel()
        l.text = event.description
        l.textColor = .label
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 19, weight: .regular)
        return l
    }()
    
    lazy var timelineLabel: UILabel = {
        let l = UILabel()
        l.text = "\(event.start) - \(event.end)"
        l.textColor = .secondaryLabel
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 19, weight: .regular)
        return l
    }()
    
    lazy var getBadgeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Получить пропуск", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        
        var configuration = UIButton.Configuration.filled()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)
        button.configuration = configuration
        
        return button
    }()

    
    private func setupUI() {
        backgroundColor = .systemBackground
        
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(timelineLabel)
        addSubview(getBadgeButton)
        
        nameLabel.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(10)
        })
        descriptionLabel.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
        })
        timelineLabel.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(5)
        })
        getBadgeButton.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(10)
        })
    }
}
