//
//  signInBtn.swift
//  SoberMe
//
//  Created by Cameron Laury on 2/24/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import UIKit

@IBDesignable
class signInBtn: UIButton {
    
    override func draw(_ rect: CGRect) {
        SoberMeStyleKit.drawSignInBtn(frame: self.bounds, resizing: .aspectFit)
    }
    
}
