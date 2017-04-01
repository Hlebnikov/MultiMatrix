//
//  ResultsViewController.swift
//  MultiMatrix
//
//  Created by Александр on 01.04.17.
//  Copyright © 2017 IceRockDev. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    var dimensions: [[Int]]?

    override func viewDidLoad() {
        super.viewDidLoad()

        let mm = MatrixMulti(dimensions: dimensions!)
        print(mm.resultsTable)
        printResults(mm.resultsTable)
    }
    
    func printResults(_ resultTable: [[Int]]) {
        let c = dimensions!.count
        println("T= \(resultTable[0][c-1]) \n")
    }
    
    func println(_ string: String) {
        textView.text.append(string)
    }


}
