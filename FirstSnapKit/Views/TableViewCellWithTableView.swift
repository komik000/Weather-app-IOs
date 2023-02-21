//
//  TableViewCellWithTableView.swift
//  FirstSnapKit
//
//  Created by Yessimkhan Zhumash on 11.11.2022.
//

import UIKit
import SnapKit

class TableViewCellWithTableView: UITableViewCell {
   
    

    lazy private var forecastTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.ForecastTableViewCell)
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
//        tableView.isScrollEnabled = false
        
        
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    lazy private var backgroundBlurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = contentView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 20
        
        forecastTableView.dataSource = self
        forecastTableView.delegate = self
        
        setupViews()
        setupConstraints()
    }
    

   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TableViewCellWithTableView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.ForecastTableViewCell, for: indexPath) as! ForecastTableViewCell
       
        cell.backgroundColor = .clear
        return cell
    }
}

extension TableViewCellWithTableView: UITableViewDelegate {
   
    

}

// MARK: - Setup Views and Constraints

private extension TableViewCellWithTableView {
    
    func setupViews() {
        contentView.addSubview(backgroundBlurEffectView)
        contentView.addSubview(forecastTableView)
    }
    
    func setupConstraints() {
       
        forecastTableView.snp.makeConstraints {
            make in
            make.edges.equalToSuperview().inset(10)
            
            
        }
    }
}

