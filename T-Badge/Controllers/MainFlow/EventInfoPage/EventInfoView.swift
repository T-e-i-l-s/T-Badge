import UIKit
import SnapKit

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
        
        let containerView = UIView()
        containerView.backgroundColor = .red
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        
        let infoList = InfoList()
        infoList.configure(data: [
            "Описание": event.description,
            "Место": event.place,
            "Сроки": "\(event.start) - \(event.end)"
        ])
        containerView.addSubview(infoList)
        infoList.snp.makeConstraints({ make in
            make.top.bottom.leading.trailing.equalToSuperview()
        })
        
//        containerView.addSubview(qrCodeContainer)
//        qrCodeContainer.snp.makeConstraints({ make in
//            make.top.equalTo(containerView.snp.bottom).offset(17)
//            make.centerX.bottom.equalToSuperview().inset(17)
//            make.width.height.equalTo(120)
//            make.bottom.equalToSuperview().inset(14)
//        })
//        
//        qrCodeContainer.addSubview(qrCodeImageView)
//        qrCodeImageView.snp.makeConstraints({ make in
//            make.width.height.equalTo(100)
//            make.center.equalToSuperview()
//        })
    }

}

