//
//  ListViewController.swift
//  WeatherVIPER
//
//  Created by Артур Кондратьев on 07.09.2022
//

import UIKit

protocol ListViewProtocol: AnyObject {
    func showWeather(weater: WeatherData)
}

class ListViewController: UIViewController {
    
    // MARK: - Public
    var presenter: ListPresenterProtocol?
    var weather: [WeatherData] = []
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    @IBAction func addCityButton(_ sender: Any) {
        presenter?.didTapAddButton()
    }
}

// MARK: - Private functions
private extension ListViewController {
    
    func initialize() {
        tableView.dataSource = self
        tableView.delegate = self
        
        presenter?.viewDidLoaded()
        
        let tempImageView = UIImageView(image: UIImage(named: "back_weather"))
        tempImageView.frame = self.tableView.frame
        self.tableView.backgroundView = tempImageView
    }
}

// MARK: - ListViewProtocol
extension ListViewController: ListViewProtocol {
    
    func showWeather(weater: WeatherData) {
        self.weather.append(weater)
        DispatchQueue.main.async {
            self.tableView.insertRows(at: [IndexPath(row: self.weather.count - 1, section: 0)], with: .automatic)
        }
    }
}

// MARK: - Table view data source
extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                     for: indexPath) as? ListViewCell
        else {
            return UITableViewCell()
        }
        cell.configure(city: weather[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectCity(city: weather[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
