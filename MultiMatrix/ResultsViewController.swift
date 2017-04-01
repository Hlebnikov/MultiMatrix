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
        println("T= \(resultTable[0][c-1])")
        println("=========")
        for i in 1..<c {
            for p in 0..<c-i {
                let k = p+i
                println("M\(p+1)*M\(k+1) = \(resultTable[p][k])")
            }
            println("")
        }
    }
    
    func println(_ string: String) {
        textView.text.append(string + "\n")
    }


}
