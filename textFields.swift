//
//  textFields.swift
//  SoberMe
//
//  Created by Cameron Laury on 2/27/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import UIKit

class textFields: UITextField {

    override func draw(_ rect: CGRect) {
        SoberMeStyleKit.drawTextFIeld(frame: self.bounds, resizing: .aspectFit)
    }

}
