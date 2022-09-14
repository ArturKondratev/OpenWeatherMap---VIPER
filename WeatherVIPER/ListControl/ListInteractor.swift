//
//  ListInteractor.swift
//  Super easy dev
//
//  Created by Артур Кондратьев on 07.09.2022
//

protocol ListInteractorProtocol: AnyObject {
    func loadAllWeathers(citys: [String])
    func loadWeatherForCity(city: String)
    
}

class ListInteractor: ListInteractorProtocol {
    
    weak var presenter: ListPresenterProtocol?
    let wetherService = WeatherService()
    
    func loadAllWeathers(citys: [String]) {
        
        for city in citys {
            wetherService.getCurrentWeather(city: city) { weather in
                self.presenter?.didLoad(weather: weather)
            }
        }
    }
    
    func loadWeatherForCity(city: String) {
        
        
    }
    
    
}
