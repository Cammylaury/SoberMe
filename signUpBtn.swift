//
//  signUpBtn.swift
//  SoberMe
//
//  Created by Cameron Laury on 2/27/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import UIKit

class signUpBtn: UIButton {
    
    override func draw(_ rect: CGRect) {
        SoberMeStyleKit.drawSignUpBtn(frame: self.bounds, resizing: .aspectFit)
    }

}
