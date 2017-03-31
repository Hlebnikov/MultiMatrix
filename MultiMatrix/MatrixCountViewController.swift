//
//  MatrixCountViewController.swift
//  MultiMatrix
//
//  Created by Александр on 01.04.17.
//  Copyright © 2017 IceRockDev. All rights reserved.
//

import UIKit

private let segueID = "toMatrixDimensions"

class MatrixCountViewController: UIViewController {
    
    let minDimension = 2
    
    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        picker.delegate = self
        picker.dataSource = self
        
        picker.selectRow(4, inComponent: 0, animated: false)
    }

    @IBAction func onNext(_ sender: Any) {
        performSegue(withIdentifier: segueID, sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? MatrixDimensionsTableViewController{
            destinationVC.matrixCount = picker.selectedRow(inComponent: 0) + minDimension
        }
    }
 

}

extension MatrixCountViewController: UIPickerViewDataSource {
    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 6
    }
}

extension MatrixCountViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row + minDimension)
    }
}
