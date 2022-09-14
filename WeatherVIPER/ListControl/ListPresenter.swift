//
//  ListPresenter.swift
//  Super easy dev
//
//  Created by Артур Кондратьев on 07.09.2022
//

protocol ListPresenterProtocol: AnyObject {
    func viewDidLoaded()
    func didLoad(weather: WeatherData)
    func didSelectCity(city: WeatherData)
    func didTapAddButton()
}

class ListPresenter {
    weak var view: ListViewProtocol?
    var router: ListRouterProtocol
    var interactor: ListInteractorProtocol
    
    var citys = ["Красная поляна", "Сочи", "Москва"]

    init(interactor: ListInteractorProtocol, router: ListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension ListPresenter: ListPresenterProtocol {
    
    func viewDidLoaded() {
        interactor.loadAllWeathers(citys: citys)
    }
    
    func didLoad(weather: WeatherData) {
        view?.showWeather(weater: weather)
    }
    
    func didSelectCity(city: WeatherData) {
        router.showDetail(city: city)
    }
    
    func didTapAddButton() {
        print("did tap add button")
    }
}
