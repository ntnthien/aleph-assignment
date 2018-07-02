//
//  HomeViewController.swift
//  Thien Assignment
//
//  Created by Do Nguyen on 7/1/18.
//  Copyright © 2018 Zincer. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import MaterialComponents

class HomeViewController: UIViewController {
    
    // MARK: - Views
    private let appBar = MDCAppBar()
    private let reuseIdentifier = "productCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var AndroidTabVersion: UIButton!
    @IBOutlet weak var appleTabButton: UIButton!
    @IBOutlet weak var tabUnderlineView: UIView!
    var viewModel: ProductViewModel!
    private let disposeBag = DisposeBag()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        self.setupAppBar()
        self.viewModel = ProductViewModel()
        self.setupCollectionView()
    }
    
    // MARK: - Setup
    
    // AppBar Setup
    func setupAppBar() {
        // Add the appBar controller and views
        self.addChildViewController(appBar.headerViewController)
        self.navigationItem.title = ApplicationScheme.Constants.appName
        self.appBar.addSubviewsToParent()
        
        // Add Bar items
        self.setupLeftBarButton()
        self.setupRightBarButton()
    }
    
    func setupLeftBarButton() {
        let barButton = UIBarButtonItem(title:"", style: .done, target: self, action: nil)
        let image = UIImage(named: MDCIcons.pathFor_ic_more_horiz())
        barButton.image = image
        barButton.tintColor = .white
        appBar.navigationBar.leftBarButtonItem = barButton
    }
    
    func setupRightBarButton() {
        let barButton = UIBarButtonItem(title:"", style: .done, target: self, action: nil)
        let image = UIImage(named: MDCIcons.pathFor_ic_color_lens())
        barButton.image = image
        barButton.tintColor = .white
        appBar.navigationBar.rightBarButtonItem = barButton
    }
    
    
    func setupCollectionView() {
        viewModel.getAppleProducts()
        
        self.viewModel.productsObservable.bind(to: self.collectionView.rx.items) { collectionView, index, item in
            
            let indexPath = IndexPath(row: index, section: 0)
            
            if let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as? ProductCell {
                cell.setup(item: item)
                return cell
            } else {
                return UICollectionViewCell()
            }
            }.disposed(by: disposeBag)
    }

}

