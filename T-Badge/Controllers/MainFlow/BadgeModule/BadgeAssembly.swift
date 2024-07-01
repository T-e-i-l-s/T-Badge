//
//  BadgeAssembly.swift
//  Super easy dev
//
//  Created by vanyaluk on 01.07.2024
//

import UIKit

final class BadgeAssembly {
    
    func assemble() -> BadgeViewController {
        let router = BadgeRouter()
        let viewController = BadgeViewController()
        let presenter = BadgePresenter(view: viewController, router: router)
        
        viewController.presenter = presenter
        router.viewController = viewController
        
        return viewController
    }
    
}
