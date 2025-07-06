//
//  WeatherModel.swift
//  Qibli
//
//  Created by Mohd Saquib on 24/06/25.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    
    //Computed properties that i made in use...
    
//    var temperatureString: String {
//        return String(format: "%.1f", temperature)
//    }
    var temperatureString: String {
        if temperature.isNaN || temperature.isInfinite {
            return "--"
        }
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200..<232:
            return "cloud.bolt.rain.fill"
        case 300..<321:
            return "cloud.drizzle.fill"
        case 500..<531:
            return "cloud.rain.fill"
        case 600..<622:
            return "cloud.snow.fill"
        case 701:
            return "cloud.fog.fill"
        case 711:
            return "smoke.fill"
        case 721:
            return "sun.haze.fill"
        case 731:
            return "sun.dust.fill"
        case 741:
            return "cloud.fog.fill"
        case 751:
            return "wind"
        case 761:
            return "sun.dust.fill"
        case 762:
            return "smoke.fill"
        case 771:
            return "cloud.heavyrain.fill"
        case 781:
            return "tornado"
        case 800:
            return "sun.max.fill"
        case 801..<804:
            return "cloud.fill"
        default:
            return "sun.max.fill"
        }
    }
}
