//
//  WeatherManager.swift
//  FirstSnapKit
//
//  Created by Yessimkhan Zhumash on 11.11.2022.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, with:WeatherModel)
    func didFailWithError(error: Error)
}


struct WeatherManager {
    
    var delegate:WeatherManagerDelegate?
    func fetchRequest() {
        let link = "https://api.openweathermap.org/data/2.5/weather?lat=43.25654&lon=76.92848&units=metric&appid=f6bc5da88091b6ba9f7a2152ac152ce8"
        
        guard let URL = URL(string: link) else {return}
        let task = URLSession.shared.dataTask(with: URL) { data,response,error in
            if let data = data , error == nil {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(WeatherData.self, from: data)
                    let cityName = decodedData.name
                    let temp = decodedData.main.temp
                    let desc = decodedData.weather[0].description
                    let hTemp = decodedData.main.temp_max
                    let lTemp = decodedData.main.temp_min
                    let weatherModel = WeatherModel(cityName: cityName, temp: temp, desc: desc, hTemp: hTemp, lTemp: lTemp)
                    delegate?.didUpdateWeather(self, with: weatherModel)
//                    print("\(cityName) \(temp) \(desc) \(hTemp) \(lTemp)")
                } catch {
                    print("Nothing has been retrieved! \(error)")
                    return
                }
            } else {
                print("Nothing has been retrieved! \(String(describing: error))")
            }
        }
        task.resume()
    }
}

