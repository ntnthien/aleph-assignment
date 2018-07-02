//
//  ProductCell.swift
//  Thien Assignment
//

import UIKit
import Kingfisher
import MaterialComponents

extension Notification.Name {
    static let reloadProductCell = Notification.Name(
        rawValue: "reloadProductCell")
}

class ProductCell: MDCCardCollectionCell {
    
    var animated: Bool = false
    
    // MARK: - IBOutlets
    
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cornerRadius = 5.0
        NotificationCenter.default.addObserver(self, selector: #selector(reloadAnimation(notfication:)), name: .reloadProductCell, object: nil)

    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Setup
    func setup(item: Product) {
        self.thumbnailImageView.kf.setImage(with: URL(string: item.image))
        self.titleLabel.text = item.title
        self.priceLabel.text = item.price
    }
    
    
    @objc func reloadAnimation(notfication: NSNotification) {
        self.animated = false
    }

}
