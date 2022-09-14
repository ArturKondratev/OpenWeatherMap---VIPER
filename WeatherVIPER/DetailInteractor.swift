//
//  DetailInteractor.swift
//  Super easy dev
//
//  Created by Артур Кондратьев on 13.09.2022
//

protocol DetailInteractorProtocol: AnyObject {
    func getCurrentWether() -> WeatherData
}

class DetailInteractor: DetailInteractorProtocol {
    weak var presenter: DetailPresenterProtocol?
    
    let currentWether: WeatherData
    
    init(city: WeatherData){
        self.currentWether = city
    }
    
    func getCurrentWether() -> WeatherData {
        return currentWether
    }
}
