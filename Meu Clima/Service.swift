//
//  Service.swift
//  Meu Clima
//
//  Created by Jobson Batista on 10/13/24.
//
import Foundation

struct City {
    let lat: String
    let lon: String
    let name: String
}

class Service {
    
    // configuracoes da API do OpenWeathermap
    private let BASE_URL: String = "https://api.openweathermap.org/data/3.0/onecall"
    private let API_KEY: String = "60a2437743d6a0ec2d2a5f1f20d1e43c"
    
    private let session = URLSession.shared // Usando um Singleton
    
    func fetchData(city: City, _ completion: @escaping (ForecastResponse?) -> Void) {
        let urlString: String = "\(BASE_URL)?lat=\(city.lat)&lon=\(city.lon)&appid=\(API_KEY)&units=metric"
        guard let url = URL(string: urlString) else { return }
        let task = session.dataTask(with: url) { data, response, error in
            
            guard let data else {
                completion(nil)
                return
            }
            
            do {
                let forecastResponse = try JSONDecoder().decode(ForecastResponse.self, from: data)
                completion(forecastResponse)
            } catch {
                print("ERRO: \(error)")
                completion(nil)
            }
            
        }
        task.resume()
    }
    
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let forecastResponse = try? JSONDecoder().decode(ForecastResponse.self, from: jsonData)

// MARK: - ForecastResponse
struct ForecastResponse: Codable {
    let current: Forecast
    let hourly: [Forecast]
    let daily: [DailyForecast]
}

// MARK: - Forecast
struct Forecast: Codable {
    let dt: Int
    let temp: Double
    let humidity: Int
    let windSpeed: Double
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case dt, temp, humidity
        case windSpeed = "wind_speed"
        case weather
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - DailyForecast
struct DailyForecast: Codable {
    let dt: Int
    let temp: Temp
    let weather: [Weather]
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}
