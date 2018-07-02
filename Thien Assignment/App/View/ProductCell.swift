//
//  ProductCell.swift
//  Thien Assignment
//

import UIKit
import Kingfisher

class ProductCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Setup
    func setup(item: Product) {
        self.thumbnailImageView.kf.setImage(with: URL(string: item.image))
        self.titleLabel.text = item.title
        self.priceLabel.text = item.price
    }
}
