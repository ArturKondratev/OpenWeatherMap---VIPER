//
//  DetailViewController.swift
//  Super easy dev
//
//  Created by Артур Кондратьев on 13.09.2022
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    func showCurrentWether(city: WeatherData)
    
}

class DetailViewController: UIViewController {
    // MARK: - Public
    var presenter: DetailPresenterProtocol?
    var wether: WeatherData?
    
    @IBOutlet weak var conditionLable: UILabel!
    @IBOutlet weak var cityNameLable: UILabel!
    @IBOutlet weak var temperatureLable: UILabel!
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        presenter?.viewDidLoaded()
    }
}

// MARK: - Private functions
private extension DetailViewController {
    func initialize() {
    }
    
    static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "MMM d / HH:mm"
        return df
    }()
    
    func dataConverter(dateNSD: Double) -> String {
        let date = Date(timeIntervalSince1970: dateNSD)
        let stringDate = DetailViewController.dateFormatter.string(from: date)
        return stringDate
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Ощущается как"
            cell.detailTextLabel?.text = String(format: "%.0f", (wether?.main.feelsLike)!) + " ºC"
        case 1:
            cell.textLabel?.text = "Максимальная температура"
            cell.detailTextLabel?.text = String(format: "%.0f", (wether?.main.temp_max)!) + " ºC"
        case 2:
            cell.textLabel?.text = "Минимальная температура"
            cell.detailTextLabel?.text = String(format: "%.0f", (wether?.main.temp_min)!) + " ºC"
        case 3:
            cell.textLabel?.text = "Давление"
            cell.detailTextLabel?.text = (wether?.main.pressure.description)! + " мм рт.ст"
        case 4:
            cell.textLabel?.text = "Влажность"
            cell.detailTextLabel?.text = (wether?.main.humidity.description)! + " %"
        case 5:
            cell.textLabel?.text = "Ветер"
            cell.detailTextLabel?.text = (wether?.wind.speed!.description)! + " м/с"
        case 6:
            cell.textLabel?.text = "Восход солнца"
            cell.detailTextLabel?.text = dataConverter(dateNSD: (wether?.sys.sunrise)!)
        case 7:
            cell.textLabel?.text = "Заход солнца"
            cell.detailTextLabel?.text = dataConverter(dateNSD: (wether?.sys.sunset)!)
        default:
            cell.textLabel?.text = "Load data"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


// MARK: - DetailViewProtocol
extension DetailViewController: DetailViewProtocol {
    func showCurrentWether(city: WeatherData) {
        self.wether = city
        DispatchQueue.main.async {
            self.cityNameLable.text = city.name
            self.date.text = self.dataConverter(dateNSD: city.dt)
            self.conditionLable.text = DataSource.weatherIDs[city.weather[0].id]
            self.temperatureLable.text = String(format: "%.0f",city.main.temp) + " ºC"
        }
    }
}
