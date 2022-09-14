//
//  ListRouter.swift
//  Super easy dev
//
//  Created by Артур Кондратьев on 07.09.2022
//

protocol ListRouterProtocol {
    func showDetail(city: WeatherData)
}

class ListRouter: ListRouterProtocol {
    
    weak var viewController: ListViewController?
    
    func showDetail(city: WeatherData) {
        let vc = DetailModuleBuilder.build(city: city)
        viewController?.present(vc, animated: true, completion: nil)
        
        
    }
}
