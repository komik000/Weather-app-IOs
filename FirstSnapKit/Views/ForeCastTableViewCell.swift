//
//  ForeCastTableViewCell.swift
//  FirstSnapKit
//
//  Created by Yessimkhan Zhumash on 11.11.2022.
//

import UIKit
import SnapKit

class ForecastTableViewCell: UITableViewCell {
    
    
    lazy private var dayLabel: UILabel = {
        let label = UILabel()
        label.text = " Today"
        label.textColor = .white
        return label
    }()
    
    lazy private var conditionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "cloud")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        return imageView
    }()
    
    lazy private var degreeLowLabel: UILabel = {
        let label = UILabel()
        label.text = "10°"
        return label
    }()
    
    lazy private var rowLabel: UILabel = {
        let label = UILabel()
        label.text = "-------------------"
        return label
    }()
    
    lazy private var degreeHighLabel: UILabel = {
        let label = UILabel()
        label.text = "25°"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        changeLabelText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func changeLabelText() {
        let subviews = contentView.subviews
        for subview in subviews {
            if subview is UILabel {
                let currentLabel = subview as! UILabel
                currentLabel.textAlignment = .center
                currentLabel.textColor = .white
            }
        }
    }
 
}

// MARK: - Setup Views and Constraints

private extension ForecastTableViewCell {
    
    func setupViews() {
     
        contentView.addSubview(dayLabel)
        contentView.addSubview(conditionImageView)
        contentView.addSubview(degreeHighLabel)
        contentView.addSubview(rowLabel)
        contentView.addSubview(degreeLowLabel)
    }
    
    func setupConstraints() {
       
        dayLabel.snp.makeConstraints {
            make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.15)
        }

        conditionImageView.snp.makeConstraints {
            make in
            make.leading.equalTo(dayLabel.snp.trailing)
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.15)
        }

        degreeLowLabel.snp.makeConstraints {
            make in
            make.leading.equalTo(conditionImageView.snp.trailing)
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.1)
        }

        rowLabel.snp.makeConstraints {
            make in
            make.leading.equalTo(degreeLowLabel.snp.trailing)
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.50)
        }

        degreeHighLabel.snp.makeConstraints {
            make in
            make.top.bottom.trailing.equalToSuperview()
            make.leading.equalTo(rowLabel.snp.trailing)
        }
    }
}

