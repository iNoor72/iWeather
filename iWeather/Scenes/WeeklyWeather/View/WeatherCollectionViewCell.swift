//
//  WeatherCollectionViewCell.swift
//  iWeather
//
//  Created by Noor Walid on 31/05/2021.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherTemp: UILabel!
    @IBOutlet weak var weatherStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
