////
////  Model.swift
////  WeatherVIPER
////
////  Created by Артур Кондратьев on 07.09.2022.
////
//
//import Foundation
//import UIKit
//
//struct WeatherResponse: Decodable {
//    let list: [WeatherModel]
//}
//
//struct WeatherModel: Decodable {
//    let cityName: String
//    let date: Double
//    let main: MainValue
//    let weather: WeatherValue
//    let wind: WindValue
//}
//
//    enum ListKeys: String, CodingKey {
//        case cityName
//        case date = "dt"
//        case main
//        case weather
//        case wind
//    }
//
//struct MainValue: Decodable {
//    let temp: Double
//    let feelsLike: Double
//    let tempMin: Double
//    let tempMax: Double
//    let pressure: Double
//    let humidity: Int
//
//    enum MainKeys: String, CodingKey {
//        case temp
//        case feelsLike = "feels_like"
//        case tempMin = "temp_min"
//        case tempMax = "temp_max"
//        case pressure
//        case humidity
//    }
//}
//
//struct WeatherValue: Decodable {
//    let main: String
//    let description: String
//    let icon: String
//
//    enum WeatherKeys: String, CodingKey {
//        case main
//        case description
//        case icon
//    }
//}
//
//struct WindValue: Decodable {
//    let speed: Double
//
//    enum WindKeys: String, CodingKey {
//        case speed
//    }
//}
//
