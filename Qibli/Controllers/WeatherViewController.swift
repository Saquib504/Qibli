//
//  ViewController.swift
//  Qibli
//
//  Created by Mohd Saquib on 23/06/25.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
//    @IBOutlet weak var descriptionLabel: UILabel!
    
    var weatherManager = WeatherManager()
    let locationManager  = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Search",
            attributes: [
                .foregroundColor: UIColor { _ in UIColor.black }
            ]
        )
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        weatherManager.delegate = self
        searchTextField.delegate = self
    }

    @IBAction func locationPressed(_ sender: Any) {
        locationManager.requestLocation()
        
    }
    
}

//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.trimmingCharacters(in: .whitespaces).isEmpty {
            return true
        } else {
            textField.placeholder = "Type Something!"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
}

//MARK: WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.cityLabel.text = weather.cityName
            if let symbolImage = UIImage(systemName: weather.conditionName) {
                self.conditionImageView.image = symbolImage
            } else {
                self.conditionImageView.image = UIImage(systemName: "questionmark.circle") // Fallback image
            }
            print("🌡️ Temp: \(weather.temperature), Icon: \(weather.conditionName)")
            let baseSymbolName = weather.conditionName.firstIndex(of: ".").map {
                String(weather.conditionName[..<$0])
            } ?? weather.conditionName
        }
    }
    func didFailWithError(error: any Error) {
        print("Decoding Error : \(error)")
    }
}

//MARK: - CLLocationManagerDelegate

 extension WeatherViewController: CLLocationManagerDelegate {
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         if let location = locations.last {
             let lat = location.coordinate.latitude
             let lon = location.coordinate.longitude
             weatherManager.fetchWeather(latitude: lat, longitude: lon)
         }
     }
     func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
         //Notifes user that location permission was not given and asks for it.
         if let clError = error as? CLError, clError.code == .denied {
             print("❌ Location access denied.")
             DispatchQueue.main.async {
                 // Optional: Show alert to user
                 let alert = UIAlertController(
                     title: "Location Access Denied",
                     message: "Please enable location access in Settings to get weather for your current location.",
                     preferredStyle: .alert
                 )
                 alert.addAction(UIAlertAction(title: "OK", style: .default))
                 self.present(alert, animated: true)
             }
         } else {
             print("Location error: \(error)")
         }
     }

}
