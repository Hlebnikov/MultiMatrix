//
//  MatrixTableViewCell.swift
//  MultiMatrix
//
//  Created by Александр on 01.04.17.
//  Copyright © 2017 IceRockDev. All rights reserved.
//

import UIKit

class MatrixTableViewCell: UITableViewCell {
    
    static let xibName = "MatrixTableViewCell"
    static let letters = ["A", "B", "C", "D", "E", "F", "G", "H"]
    
    @IBOutlet weak var matrixNameLabel: UILabel!
    @IBOutlet weak var firstDimTextField: UITextField!
    @IBOutlet weak var secondDimTextField: UITextField!

    func configWithParams(indexPath: IndexPath) {
        if indexPath.row > 0 {
            firstDimTextField.isUserInteractionEnabled = false
        }
        
        matrixNameLabel.text = "Матрица \(MatrixTableViewCell.letters[indexPath.row])"
    }

}
