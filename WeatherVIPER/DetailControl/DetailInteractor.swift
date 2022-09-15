//
//  DetailInteractor.swift
//  WeatherVIPER
//
//  Created by Артур Кондратьев on 13.09.2022
//

protocol DetailInteractorProtocol: AnyObject {
    func getCurrentWether() -> WeatherData
    func getWeather5days(lat: Double, lon: Double)
}

class DetailInteractor: DetailInteractorProtocol {
    weak var presenter: DetailPresenterProtocol?
    let wetherService = WeatherService()
    let currentWether: WeatherData
    
    init(city: WeatherData){
        self.currentWether = city
    }
    
    func getCurrentWether() -> WeatherData {
        return currentWether
    }
    
    func getWeather5days(lat: Double, lon: Double) {
        wetherService.fetch5day(latitude: lat, longtitude: lon, interval: 24) { wether in
            self.presenter?.wetherDidLoaded(wether: wether)
        }
    }
}
