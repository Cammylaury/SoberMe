//
//  LogoAndNameView.swift
//  SoberMe
//
//  Created by Cameron Laury on 3/2/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import UIKit

@IBDesignable
class LogoAndNameView: UIImageView {

    override func draw(_ rect: CGRect) {
        SoberMeStyleKit.drawLogo(frame: self.bounds, resizing: .aspectFit)
    }
}
