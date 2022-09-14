//
//  WeatherData.swift
//  WeatherVIPER
//
//  Created by Артур Кондратьев on 13.09.2022.
//

import Foundation

struct WeatherData: Codable {
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let dt: Double
    let sys: Sys
    let name: String
}

struct Coord: Codable {
    let lon: Double
    let lat: Double
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
    
    enum MainKeys: String, CodingKey {
        case temp
        case feels_like
        case temp_min
        case temp_max
        case pressure
        case humidity
    }
}
struct Wind: Codable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}

struct Sys: Codable {
    let sunrise: Double
    let sunset: Double
    
}

