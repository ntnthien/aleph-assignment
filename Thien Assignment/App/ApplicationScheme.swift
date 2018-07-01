//
//  ApplicationScheme.swift
//  Thien Assignment
//
//  Created by Do Nguyen on 7/1/18.
//  Copyright © 2018 Zincer. All rights reserved.
//

import UIKit
import MaterialComponents

struct ApplicationScheme {
    
    struct Constants {
        static let appName = "Aleph-Labs"
    }
    
    private static var singleton = ApplicationScheme()
    
    static var shared: ApplicationScheme {
        return singleton
    }
    
    init() {
        self.buttonScheme.colorScheme = self.colorScheme
        self.buttonScheme.typographyScheme = self.typographyScheme
    }
    
    public let buttonScheme = MDCButtonScheme()
    
    public let colorScheme: MDCColorScheming = {
        let scheme = MDCSemanticColorScheme(defaults: .material201804)
        //TODO: Customize our app Colors after this line
        scheme.primaryColor =
            UIColor(red: 252.0/255.0, green: 184.0/255.0, blue: 171.0/255.0, alpha: 1.0)
        scheme.primaryColorVariant =
            UIColor(red: 68.0/255.0, green: 44.0/255.0, blue: 46.0/255.0, alpha: 1.0)
        scheme.onPrimaryColor =
            UIColor(red: 68.0/255.0, green: 44.0/255.0, blue: 46.0/255.0, alpha: 1.0)
        scheme.secondaryColor =
            UIColor(red: 254.0/255.0, green: 234.0/255.0, blue: 230.0/255.0, alpha: 1.0)
        scheme.onSecondaryColor =
            UIColor(red: 68.0/255.0, green: 44.0/255.0, blue: 46.0/255.0, alpha: 1.0)
        scheme.surfaceColor =
            UIColor(red: 255.0/255.0, green: 251.0/255.0, blue: 250.0/255.0, alpha: 1.0)
        scheme.onSurfaceColor =
            UIColor(red: 68.0/255.0, green: 44.0/255.0, blue: 46.0/255.0, alpha: 1.0)
        scheme.backgroundColor =
            UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        scheme.onBackgroundColor =
            UIColor(red: 68.0/255.0, green: 44.0/255.0, blue: 46.0/255.0, alpha: 1.0)
        scheme.errorColor =
            UIColor(red: 197.0/255.0, green: 3.0/255.0, blue: 43.0/255.0, alpha: 1.0)
        return scheme
    }()
    
    public let typographyScheme: MDCTypographyScheming = {
        let scheme = MDCTypographyScheme()
        //TODO: Add our custom fonts after this line
        let fontName = "AvenirNextCondensed-Regular"
        scheme.headline5 = UIFont(name: fontName, size: 24)!
        scheme.headline6 = UIFont(name: fontName, size: 20)!
        scheme.subtitle1 = UIFont(name: fontName, size: 16)!
        scheme.button = UIFont(name: fontName, size: 14)!
        return scheme
    }()
}
