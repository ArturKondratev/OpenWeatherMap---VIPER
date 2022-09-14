//
//  ListViewCell.swift
//  WeatherVIPER
//
//  Created by Артур Кондратьев on 07.09.2022.
//

import UIKit

class ListViewCell: UITableViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var condition: UILabel!
    @IBOutlet weak var temperatyre: UILabel!
    
    static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "HH.mm"
        return df
    }()
    
    func configure(city: WeatherData) {
        let date = Date(timeIntervalSince1970: city.dt)
        let stringDate = ListViewCell.dateFormatter.string(from: date)
        
        self.icon.image = UIImage(named: city.weather[0].icon)
        self.cityName.text = city.name
        self.condition.text = DataSource.weatherIDs[city.weather[0].id]
        self.temperatyre.text = String(format: "%.0f",city.main.temp) + " ºC"
    
    }
    
}
