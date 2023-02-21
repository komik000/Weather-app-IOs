//
//  WeatherData.swift
//  FirstSnapKit
//
//  Created by Yessimkhan Zhumash on 11.11.2022.
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


//London  https://api.openweathermap.org/data/2.5/weather?lat=51.509865&lon=-0.118092&appid=f55a8179c96e9cd83e8e2be187147eff

// Almaty https://api.openweathermap.org/data/2.5/weather?lat=43.25654&lon=76.92848&units=metric&appid=f6bc5da88091b6ba9f7a2152ac152ce8

//Kaskelen https://api.openweathermap.org/data/2.5/weather?lat=43.20028&lon=76.62222&units=metric&appid=f6bc5da88091b6ba9f7a2152ac152ce8
