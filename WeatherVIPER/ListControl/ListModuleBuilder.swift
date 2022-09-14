//
//  ListModuleBuilder.swift
//  Super easy dev
//
//  Created by Артур Кондратьев on 07.09.2022
//

import UIKit

class ListModuleBuilder {
    static func build() -> ListViewController {
        let interactor = ListInteractor()
        let router = ListRouter()
        let presenter = ListPresenter(interactor: interactor, router: router)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Main") as! ListViewController
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
