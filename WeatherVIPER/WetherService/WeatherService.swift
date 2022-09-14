//
//  WeatherService.swift
//  WeatherVIPER
//
//  Created by Артур Кондратьев on 07.09.2022.
//

import UIKit
import CoreLocation

// MARK: - Request Method

fileprivate enum TypeMethods: String {
    case currentWether = "/data/2.5/weather"
    case getFiveDay = "/data/2.5/forecast"
}

fileprivate enum TypeRequest: String {
    case get = "GET"
    case post = "POST"
}

class WeatherService {
    
    // MARK: - Error
    enum ServiceError: Error {
        case requestError(Error)
        case parseError(Error)
    }
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()
    private let scheme = "https"
    private let host = "api.openweathermap.org"
    private let appid = "72965576fb92c60c88c041120952d468"
    private let decoder = JSONDecoder()
    
    func getCurrentWeather(city: String, completionHandler: @escaping (WeatherData) -> Void) {
        
        getCoordinate(city: city) { coordinate, error in
            guard let coordinate = coordinate, error == nil else { return }
            
            self.fetchCurrentWeather( latitude: coordinate.latitude, longtitude: coordinate.longitude) { weather in
                completionHandler(weather)
            }
        }
    }
    
    private func fetchCurrentWeather(latitude: Double, longtitude: Double, completionHandler: @escaping (WeatherData) -> Void ) {
        
        let params: [String: String] = [ "lat" : "\(latitude)"   ,
                                         "lon" : "\(longtitude)" ]
        
        let url = configureUrl(method: .currentWether,
                               httpMethod: .get,
                               params: params)
        print(url)
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let result = try self.decoder.decode(WeatherData.self, from: data)
                completionHandler(result)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}

private func getCoordinate (city: String, complition: @escaping (_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
    CLGeocoder().geocodeAddressString(city) { (placemark, error) in
        complition(placemark?.first?.location?.coordinate, error)
    }
}

// MARK: - Private
private extension WeatherService {
    
    private func configureUrl(method: TypeMethods,
                      httpMethod: TypeRequest,
                      params: [String: String]) -> URL {
        
        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "appid", value: appid))
        queryItems.append(URLQueryItem(name: "units", value: "metric"))
        queryItems.append(URLQueryItem(name: "lang", value: "ru"))
        
        for (param, value) in params {
            queryItems.append(URLQueryItem(name: param, value: value))
        }
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = method.rawValue
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            fatalError("URL is invalid")
        }
        return url
    }
}
