//
//  UIButton+Extension.swift
//  PokeLab
//
//  Created by Chau Vo on 8/14/16.
//  Copyright © 2016 Chau Vo. All rights reserved.
//

import UIKit

extension UIButton {

  func setDefaultBorder(width: CGFloat = 1, radius: CGFloat = 5, color: UIColor = UIColor(red: 8/255.0, green: 105/255.0, blue: 179/255.0, alpha: 1)) {
    layer.borderWidth = width
    layer.cornerRadius = radius
    layer.borderColor = color.CGColor
  }

  func clearDefaultBorder() {
    setDefaultBorder(0, radius: 0, color: UIColor.clearColor())
  }

}
