//
//  UIImage.swift
//  ios-basic-network
//
//  Created by Tristan Richard on 05/04/2019.
//  Copyright © 2019 Tristan Richard. All rights reserved.
//

import UIKit

extension UIImage {
    
    static func emptyImage(with size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}
