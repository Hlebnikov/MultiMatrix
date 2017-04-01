//
//  MatrixTableViewCell.swift
//  MultiMatrix
//
//  Created by Александр on 01.04.17.
//  Copyright © 2017 IceRockDev. All rights reserved.
//

import UIKit

class MatrixTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    static let xibName = "MatrixTableViewCell"
    static let letters = ["A", "B", "C", "D", "E", "F", "G", "H"]
    
    var textFieldDelegate: UITextFieldDelegate? {
        didSet{
            firstDimTextField.delegate = textFieldDelegate
            secondDimTextField.delegate = textFieldDelegate
        }
    }
    
    @IBOutlet weak var matrixNameLabel: UILabel!
    @IBOutlet weak var firstDimTextField: UITextField!
    @IBOutlet weak var secondDimTextField: UITextField!

    func configWithParams(_ indexPath: IndexPath) {
        matrixNameLabel.text = "Матрица \(MatrixTableViewCell.letters[indexPath.row])"
        firstDimTextField.tag = 2 * indexPath.row
        secondDimTextField.tag = 2 * indexPath.row + 1
    }
}
