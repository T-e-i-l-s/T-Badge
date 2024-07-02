//
//  BadgeViewController.swift
//  Super easy dev
//
//  Created by vanyaluk on 01.07.2024
//

import UIKit

// MARK: - View Protocol
protocol BadgeViewProtocol: AnyObject {
    
}

// MARK: - View Controller
final class BadgeViewController: UIViewController {
    
    // UI
    
    var presenter: BadgePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoaded()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
    }
}

// MARK: - View Protocol Realization
extension BadgeViewController: BadgeViewProtocol {
    
}
