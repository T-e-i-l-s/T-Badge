import UIKit
final class EventInfoView: UIView {
    private let event: EventModel
    
    init(event: EventModel) {
        self.event = event
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        return sv
    }()
    
    lazy var containerView: UIView = {
        let v = UIView()
        v.backgroundColor = .tertiarySystemFill
        v.layer.cornerRadius = 17
        return v
    }()
        
    lazy var separatorView: UIView = {
        let v = UIView()
        v.backgroundColor = .secondarySystemFill
        return v
    }()
        
    lazy var descriptionTitle: UILabel = {
        let l = UILabel()
        l.text = "Описание"
        l.textColor = .secondaryLabel
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return l
    }()
        
    lazy var descriptionLabel: UILabel = {
        let l = UILabel()
        l.text = event.description
        l.textColor = .label
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return l
    }()
        
    lazy var startTitle: UILabel = {
        let l = UILabel()
        l.text = "Начало"
        l.textColor = .secondaryLabel
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return l
    }()
        
    lazy var startLabel: UILabel = {
        let l = UILabel()
        l.text = formatUnixTime(event.start)
        l.textColor = .label
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return l
    }()
    
    lazy var endTitle: UILabel = {
        let l = UILabel()
        l.text = "Конец"
        l.textColor = .secondaryLabel
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return l
    }()
        
    lazy var endLabel: UILabel = {
        let l = UILabel()
        l.text = formatUnixTime(event.end)
        l.textColor = .label
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return l
    }()
    
    lazy var mealTitle: UILabel = {
        let l = UILabel()
        l.text = "Питание"
        l.textColor = .secondaryLabel
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return l
    }()
        
    lazy var mealLabel: UILabel = {
        let l = UILabel()
        l.text = "Включено"
        l.textColor = .label
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return l
    }()
    
    lazy var wifiTitle: UILabel = {
        let l = UILabel()
        l.text = "WI-FI"
        l.textColor = .secondaryLabel
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return l
    }()
        
    lazy var wifiLabel: UILabel = {
        let l = UILabel()
        l.text = "Есть"
        l.textColor = .label
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return l
    }()
    
    lazy var qrCodeContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemFill
        view.layer.cornerRadius = 16
        view.layer.cornerCurve = .continuous
        view.clipsToBounds = true
        return view
    }()
    
    lazy var qrCodeImageView: UIImageView = {
        let currentTime = Date().timeIntervalSince1970
        let isEnabled = event.start <= Int64(currentTime) && event.end >= Int64(currentTime)
        
        let iv = UIImageView()
        let image = UIImage(named: isEnabled ? "enabledQR" : "disabledQR")
        let tintedimage = image?.withRenderingMode(.alwaysTemplate)
        iv.image = tintedimage
        iv.tintColor = .label
        return iv
    }()
    
    private func setupUI() {
        backgroundColor = .systemBackground
                
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
                
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self).inset(14)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().priority(.low) // Allow scrolling content
        }
                
        containerView.addSubview(descriptionTitle)
        descriptionTitle.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(17)
            make.top.equalToSuperview().inset(17)
        }
                
        containerView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionTitle.snp.bottom).offset(2)
            make.leading.trailing.equalToSuperview().inset(17)
        }
                
        let separator1 = UIView()
        separator1.backgroundColor = .secondarySystemFill
        containerView.addSubview(separator1)
        separator1.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().inset(17)
            make.height.equalTo(0.5)
        }
                
        containerView.addSubview(startTitle)
        startTitle.snp.makeConstraints { make in
            make.top.equalTo(separator1.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(17)
        }
                
        containerView.addSubview(startLabel)
        startLabel.snp.makeConstraints { make in
            make.top.equalTo(startTitle.snp.bottom).offset(2)
            make.leading.trailing.equalToSuperview().inset(17)
        }
                
        let separator2 = UIView()
        separator2.backgroundColor = .secondarySystemFill
        containerView.addSubview(separator2)
        separator2.snp.makeConstraints { make in
            make.top.equalTo(startLabel.snp.bottom).offset(10)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().inset(17)
            make.height.equalTo(0.5)
        }
                
        containerView.addSubview(endTitle)
        endTitle.snp.makeConstraints { make in
            make.top.equalTo(separator2.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(17)
        }
                
        containerView.addSubview(endLabel)
        endLabel.snp.makeConstraints { make in
            make.top.equalTo(endTitle.snp.bottom).offset(2)
            make.leading.trailing.equalToSuperview().inset(17)
        }
                
        let separator3 = UIView()
        separator3.backgroundColor = .secondarySystemFill
        containerView.addSubview(separator3)
            separator3.snp.makeConstraints { make in
            make.top.equalTo(endLabel.snp.bottom).offset(10)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().inset(17)
            make.height.equalTo(0.5)
        }
                
        containerView.addSubview(mealTitle)
        mealTitle.snp.makeConstraints { make in
            make.top.equalTo(separator3.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(17)
        }
                
        containerView.addSubview(mealLabel)
        mealLabel.snp.makeConstraints { make in
            make.top.equalTo(mealTitle.snp.bottom).offset(2)
            make.leading.trailing.equalToSuperview().inset(17)
        }
                
        let separator4 = UIView()
        separator4.backgroundColor = .secondarySystemFill
        containerView.addSubview(separator4)
        separator4.snp.makeConstraints { make in
            make.top.equalTo(mealLabel.snp.bottom).offset(10)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().inset(17)
            make.height.equalTo(0.5)
        }
        
        containerView.addSubview(wifiTitle)
        wifiTitle.snp.makeConstraints({ make in
            make.top.equalTo(separator4.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(17)
        })
                
        containerView.addSubview(wifiLabel)
        wifiLabel.snp.makeConstraints({ make in
            make.top.equalTo(wifiTitle.snp.bottom).offset(2)
            make.leading.trailing.bottom.equalToSuperview().inset(17)
        })
        
        scrollView.addSubview(qrCodeContainer)
        qrCodeContainer.snp.makeConstraints({ make in
            make.top.equalTo(containerView.snp.bottom).offset(17)
            make.width.height.equalTo(170)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(20) // Ensuring the scrollView content size
        })
        
        qrCodeContainer.addSubview(qrCodeImageView)
        qrCodeImageView.snp.makeConstraints({ make in
            make.width.height.equalTo(150)
            make.center.equalToSuperview()
        })
    }
    
    private func formatUnixTime(_ unixTime: Int64) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(unixTime))
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter.string(from: date)
    }
}
