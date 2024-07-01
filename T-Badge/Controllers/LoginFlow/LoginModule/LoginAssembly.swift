//
//  LoginAssembly.swift
//  Super easy dev
//
//  Created by vanyaluk on 01.07.2024
//

import UIKit

final class LoginAssembly {
    
    func assemble() -> LoginViewController {
        let router = LoginRouter()
        let viewController = LoginViewController()
        let presenter = LoginPresenter(view: viewController, router: router)
        
        viewController.presenter = presenter
        router.viewController = viewController
        
        return viewController
    }
    
}
