//
//  BadgePresenter.swift
//  Super easy dev
//
//  Created by vanyaluk on 01.07.2024
//

import UIKit

protocol BadgePresenterProtocol: AnyObject {
    func viewDidLoaded()
}

final class BadgePresenter {
    weak var view: BadgeViewProtocol?
    var router: BadgeRouterInput

    init(view: BadgeViewProtocol, router: BadgeRouterInput) {
        self.view = view
        self.router = router
    }
}

extension BadgePresenter: BadgePresenterProtocol {
    func viewDidLoaded() {
        // first setup view
    }
}
