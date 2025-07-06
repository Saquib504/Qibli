//
//  WeatherData.swift
//  Qibli
//
//  Created by Mohd Saquib on 24/06/25.
//

import Foundation
struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    let wind: Wind
}

struct Main: Decodable {
    let temp: Double
    let feels_like: Double
    let ground_level: Int?
    let humidity: Int
    let pressure: Int
    let sea_level: Int?
}

struct Weather: Decodable {
    let id: Int
    let description: String
}

struct Wind: Decodable {
    let speed: Double
    let deg: Int
}
