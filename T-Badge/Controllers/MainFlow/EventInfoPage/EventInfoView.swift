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
        scrollView.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        
        let infoList = InfoList()
        infoList.configure(data: [
            "Описание": event.description,
            "Место": event.place,
            "Сроки": "\(event.start) - \(event.end)"
        ])
        
        scrollView.addSubview(infoList)
        
        infoList.snp.makeConstraints({ make in
            make.top.equalToSuperview()
            make.width.equalToSuperview().inset(17)
            make.centerX.equalToSuperview()
        })
        
        scrollView.addSubview(qrCodeContainer)
        qrCodeContainer.snp.makeConstraints({ make in
            make.top.equalTo(infoList.snp.bottom).offset(17)
            make.width.height.equalTo(170)
            make.centerX.equalToSuperview()
        })
        
        qrCodeContainer.addSubview(qrCodeImageView)
        qrCodeImageView.snp.makeConstraints({ make in
            make.width.height.equalTo(150)
            make.center.equalToSuperview()
        })
    }
}
