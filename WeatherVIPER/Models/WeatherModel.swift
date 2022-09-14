////
////  WeatherModel.swift
////  WeatherVIPER
////
////  Created by Артур Кондратьев on 07.09.2022.
////
//
//import Foundation
//
//struct WeatherResponse: Decodable {
//    let list: WeatherModel
//}
//
//struct WeatherModel: Decodable {
//    var cityName: String?
//    var dt: Double
//    var temp: Double
//    var pressure: Double
//    var humidity: Int
//    var weatherName: String
//    var weatherIcon: String
//    var windSpeed: Double
//    var windDegrees: Double
//
//    enum CodingKeys: String, CodingKey {
//        case dt
//        case main
//        case weather
//        case wind
//    }
//    enum MainKeys: String, CodingKey {
//        case temp
//        case pressure
//        case humidity
//    }
//    enum WeatherKeys: String, CodingKey {
//        case main
//        case icon
//    }
//    enum WindKeys: String, CodingKey {
//        case speed
//        case deg
//    }
//
//    init(from decoder: Decoder) throws {
//        
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        self.dt = try values.decode(Double.self, forKey: .dt)
//
//        let mainValues = try values.nestedContainer(keyedBy: MainKeys.self, forKey: .main)
//        self.temp = try mainValues.decode(Double.self, forKey: .temp)
//        self.pressure = try mainValues.decode(Double.self, forKey: .pressure)
//        self.humidity = try mainValues.decode(Int.self, forKey: .humidity)
//
//        var weatherValues = try values.nestedUnkeyedContainer(forKey: .weather)
//        let firstWeatherValues = try weatherValues.nestedContainer(keyedBy: WeatherKeys.self)
//        self.weatherName = try firstWeatherValues.decode(String.self, forKey: .main)
//        self.weatherIcon = try firstWeatherValues.decode(String.self, forKey: .icon)
//
//        let windValues = try values.nestedContainer(keyedBy: WindKeys.self, forKey: .wind)
//        self.windSpeed = try windValues.decode(Double.self, forKey: .speed)
//        self.windDegrees = try windValues.decode(Double.self, forKey: .deg)
//    }
//
//}
