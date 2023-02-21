//
//  WeatherData.swift
//  WeatherAppCopy
//
//  Created by Балауса Косжанова on 09.11.2022.
//

import Foundation
struct WeatherData: Decodable {
    let weather:[Weather]
    let main: MainData
    let name: String
    
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
}
struct MainData: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}
//51.509865   -0.118092.
// https://api.openweathermap.org/data/2.5/weather?lat=51.509865&lon=-0.118092&appid=f55a8179c96e9cd83e8e2be187147eff
