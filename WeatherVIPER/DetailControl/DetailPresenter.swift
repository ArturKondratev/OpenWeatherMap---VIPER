//
//  DetailPresenter.swift
//  Super easy dev
//
//  Created by Артур Кондратьев on 13.09.2022
//

protocol DetailPresenterProtocol: AnyObject {
    func viewDidLoaded()
}

class DetailPresenter {
    weak var view: DetailViewProtocol?
    var router: DetailRouterProtocol
    var interactor: DetailInteractorProtocol

    init(interactor: DetailInteractorProtocol, router: DetailRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension DetailPresenter: DetailPresenterProtocol {
    func viewDidLoaded() {
        let currentWether = interactor.getCurrentWether()
        view?.showCurrentWether(city: currentWether)
    }
}
