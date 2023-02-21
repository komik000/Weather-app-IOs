//
//  WeatherTableViewCollectionViewCell.swift
//  FirstSnapKit
//
//  Created by Yessimkhan Zhumash on 11.11.2022.
//

import UIKit
import SnapKit

final class TableViewCellWithCollectionView: UITableViewCell {
    
    
    lazy private var actualWeatherCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.CollectionViewCell)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
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
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true

        actualWeatherCollectionView.dataSource = self
        actualWeatherCollectionView.delegate = self
        
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

// MARK: - Collection View Data Source and Delegate Methods

extension TableViewCellWithCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = actualWeatherCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.CollectionViewCell, for: indexPath) as! CollectionViewCell
        return cell
    }
}

//extension TableViewCellWithCollectionView: UICollectionViewDelegate {
//    
//    
//    
//}

extension TableViewCellWithCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 115)
    }
    
}

// MARK: - Setup Views and Constraints

private extension TableViewCellWithCollectionView {
    
    func setupViews() {
        contentView.addSubview(backgroundBlurEffectView)
        contentView.addSubview(actualWeatherCollectionView)
    }
    
    func setupConstraints() {
        actualWeatherCollectionView.snp.makeConstraints {
            make in
            make.edges.equalToSuperview().inset(10)
        }
    }
}


