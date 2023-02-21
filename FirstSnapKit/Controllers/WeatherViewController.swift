//
//  ViewController.swift
//  FirstSnapKit
//
//  Created by Yessimkhan Zhumash on 17.10.2022.
//

import UIKit
import SnapKit

final class WeatherViewController: UIViewController {
    private var weatherManager = WeatherManager()
    
    lazy private var sectionNames: [String] = ["Windy conditions from 3PM-5PM, with heavy snow expected at 6PM", "📆 7-day forecast"]
    
    lazy private var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sun")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy private var weatherTableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        let headerView = WeatherTableViewHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: (view.bounds.height)*0.34))
//        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.WeatherTableView)
//        tableView.register(WeatherTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: Constants.Identifiers.WeatherTableViewHeaderView)
//        tableView.backgroundColor = .systemPink
        tableView.tableHeaderView = headerView
        headerView.weatherManager = self.weatherManager
        tableView.backgroundColor = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        tableView.layer.cornerRadius = 20
//        tableView.layer.borderWidth = 2
//        tableView.backgroundView = UIImageView(image: UIImage(named: "eastman-childs-dflgPD3Gm6k-unsplash"))
//        tableView.bounces = false
//        tableView.isScrollEnabled = true
        return tableView
    }()
    
    lazy private var backgroundBlurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = .systemBlue
//        view.backgroundColor = UIColor(patternImage: UIImage(named: "eastman-childs-dflgPD3Gm6k-unsplash.jpg")!)
        
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
        weatherManager.delegate = (weatherTableView.tableHeaderView as! any WeatherManagerDelegate)
        setupViews()
        setupConstraints()
        weatherManager.fetchRequest()
    }
}

// MARK: - TableView DataSource and Delegate Methods

extension WeatherViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.WeatherTableView, for: indexPath) as! WeatherTableViewCell
//        cell.setText(with: "\(indexPath.row) is a number of this specific cell")
//        return cell
        switch indexPath.section {
        case 0: let cell = TableViewCellWithCollectionView()
            cell.backgroundColor = .clear
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 20
//            cell.addSubview(backgroundBlurEffectView)
//            backgroundBlurEffectView.snp.makeConstraints {
//                make in
//                make.edges.equalToSuperview()
//            }
            return cell
        case 1 : let cell = TableViewCellWithTableView()
            cell.backgroundColor = .clear
            
     
            return cell
        default:
            return UITableViewCell()
        }
//    case 1 : let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.WeatherTableView, for: indexPath) as! WeatherTableViewCell
        
//        cell.setText(with: "\(indexPath.row) is a number of this specific cell")
    }
}

extension WeatherViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionNames[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .white
        }
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section == 0 {
//            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.Identifiers.WeatherTableViewHeaderView) as! WeatherTableViewHeaderView
//            return view
//        }
//        return UITableViewHeaderFooterView()
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0 {
//            return 275
//        }
//        return 0
//    }
}

// MARK: - Setup Views and Constraints

private extension WeatherViewController {
    
    func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(weatherTableView)
    }
    
    func setupConstraints() {
        
        backgroundImageView.snp.makeConstraints {
            make in
            make.edges.equalToSuperview()
        }
        
        weatherTableView.snp.makeConstraints {
            make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(15)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(25)
        }
    }
}
