import UIKit
import SnapKit

protocol HeaderViewDelegate {
    func didUpdateHeaderView(with model : WeatherModel)
}

final class WeatherTableViewHeaderView: UITableViewHeaderFooterView {
    var weatherManager: WeatherManager?
    
    lazy private var cityLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy private var degreeLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 90)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy private var weatherLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy private var highLowLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        changeAllTextColor(with: .white)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeAllTextColor(with color: UIColor) {
        let subviews = contentView.subviews
        
        for subview in subviews {
            if subview is UILabel {
                let currentLabel = subview as! UILabel
                currentLabel.textColor = UIColor.white
            }
        }
    }
   
}

extension WeatherTableViewHeaderView:WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, with model: WeatherModel) {
        DispatchQueue.main.async {
            self.cityLabel.text = model.cityName
            self.degreeLabel.text = " \(Int(model.temp))°"
            self.weatherLabel.text = model.desc
            self.highLowLabel.text = "H:\(Int(model.hTemp))° L:\(Int(model.lTemp))°"
            
        }
       
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}

// MARK: - Setup Views and Constraints

private extension WeatherTableViewHeaderView {
    
    func setupViews() {
        addSubview(cityLabel)
        addSubview(degreeLabel)
        addSubview(weatherLabel)
        addSubview(highLowLabel)
    }
    
    func setupConstraints() {
        cityLabel.snp.makeConstraints {
            make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(degreeLabel.snp.top)
        }
        
        degreeLabel.snp.makeConstraints {
            make in
            make.center.equalToSuperview()
        }
        
        weatherLabel.snp.makeConstraints {
            make in
            make.top.equalTo(degreeLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        highLowLabel.snp.makeConstraints {
            make in
            make.top.equalTo(weatherLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
}
