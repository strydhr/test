//
//  RoundEdgeButton.swift
//  Strydhr
//
//  Created by Satyia Anand on 02/04/2018.
//  Copyright © 2018 Satyia Anand. All rights reserved.
//

import UIKit

class RoundEdgeButton: UIButton {
    override func awakeFromNib() {
        setupView()
    }
    func setupView(){
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }
}
