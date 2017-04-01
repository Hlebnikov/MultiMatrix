//
//  MatrixDimensionsTableViewController.swift
//  MultiMatrix
//
//  Created by Александр on 01.04.17.
//  Copyright © 2017 IceRockDev. All rights reserved.
//

import UIKit

class MatrixDimensionsTableViewController: UITableViewController {
    
    var matrixCount = 0
    
    var dimensions: [[Int]] = [[]]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: MatrixTableViewCell.xibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "matrixCell")
        
        tableView.estimatedRowHeight = 75
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return matrixCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matrixCell", for: indexPath) as! MatrixTableViewCell

        // Configure the cell...
        cell.configWithParams(indexPath)
        cell.textFieldDelegate = self
        
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? ResultsViewController {
            dimensions = inputData()
            print(dimensions)
            nextVC.dimensions = dimensions
        }
    }
 
    func inputData() -> [[Int]]{
        var out: [[Int]] = []
        for i in 0..<matrixCount{
            let cell = tableView.cellForRow(at: IndexPath(row: i, section: 0)) as! MatrixTableViewCell
            let first = Int(cell.firstDimTextField.text!)
            let second = Int(cell.secondDimTextField.text!)
            let dimension = [first, second]
            out.append(dimension as! [Int])
        }
        return out
    }
}

extension MatrixDimensionsTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            if let nextField = self.view.viewWithTag(textField.tag + 1) as? UITextField {
                nextField.becomeFirstResponder()
            }
            return false
        }
        
        if textField.tag % 2 == 1{
            if let nextField = self.view.viewWithTag(textField.tag + 2) as? UITextField {
                nextField.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
            }
        }
        return false
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag % 2 == 1 {
            if let nextTextField = self.view.viewWithTag(textField.tag + 1) as? UITextField {
                nextTextField.text = textField.text! + string
            }
        }
        return true
    }
}
