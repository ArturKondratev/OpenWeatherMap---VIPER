//
//  DetailModuleBuilder.swift
//  Super easy dev
//
//  Created by Артур Кондратьев on 13.09.2022
//

import UIKit

class DetailModuleBuilder {
    static func build(city: WeatherData) -> DetailViewController {
        
        let interactor = DetailInteractor(city: city)
        let router = DetailRouter()
        let presenter = DetailPresenter(interactor: interactor, router: router)
        
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
