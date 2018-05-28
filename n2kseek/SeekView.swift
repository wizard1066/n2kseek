//
//  SeekView.swift
//  n2kseek
//
//  Created by localuser on 28.05.18.
//  Copyright © 2018 cqd.ch. All rights reserved.
//

import UIKit

class SeekView: UIView {

    var backgroundImage: UIImage? {didSet { setNeedsDisplay() } }
    
    override func draw(_ rect: CGRect) {
        backgroundImage?.draw(in: rect)
    }

}
