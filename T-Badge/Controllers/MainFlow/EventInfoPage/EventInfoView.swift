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
    
    lazy var dateTitle: UILabel = {
        let l = UILabel()
        l.text = "Сроки"
        l.textColor = .secondaryLabel
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return l
    }()
    
    lazy var dateLabel: UILabel = {
        let l = UILabel()
        l.text = "\(event.start) - \(event.end)"
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
        let iv = UIImageView()
        let image = UIImage(named: "qr")
        let tintedimage = image?.withRenderingMode(.alwaysTemplate)
        iv.image = tintedimage
        iv.tintColor = .label
        return iv
    }()
    
    private func setupUI() {
        backgroundColor = .systemBackground
        
        addSubview(scrollView)
        scrollView.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints({ make in
            make.leading.trailing.equalTo(self).inset(14)
            make.top.equalToSuperview()
        })
        
        containerView.addSubview(descriptionTitle)
        descriptionTitle.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview().inset(17)
            make.top.equalToSuperview().inset(17)
        })
        
        containerView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints({ make in
            make.top.equalTo(descriptionTitle.snp.bottom).offset(2)
            make.leading.trailing.equalToSuperview().inset(17)
        })
        
        containerView.addSubview(separatorView)
        separatorView.snp.makeConstraints({ make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().inset(17)
            make.height.equalTo(0.5)
        })
        
        containerView.addSubview(dateTitle)
        dateTitle.snp.makeConstraints({ make in
            make.top.equalTo(separatorView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(17)
        })
        
        containerView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints({ make in
            make.top.equalTo(dateTitle.snp.bottom).offset(2)
            make.leading.trailing.bottom.equalToSuperview().inset(17)
            make.bottom.equalToSuperview().inset(14)
        })
        
        scrollView.addSubview(qrCodeContainer)
        qrCodeContainer.snp.makeConstraints({ make in
            make.top.equalTo(containerView.snp.bottom).offset(17)
            make.centerX.bottom.equalToSuperview().inset(17)
            make.width.height.equalTo(120)
            make.bottom.equalToSuperview().inset(14)
        })
        
        qrCodeContainer.addSubview(qrCodeImageView)
        qrCodeImageView.snp.makeConstraints({ make in
            make.width.height.equalTo(100)
            make.center.equalToSuperview()
        })
    }
}
