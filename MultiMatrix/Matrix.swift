//
//  Matrix.swift
//  MultiMatrix
//
//  Created by Александр on 01.04.17.
//  Copyright © 2017 IceRockDev. All rights reserved.
//

import Foundation

class MatrixMulti {
    
    var dimensions = [[Int]]()
    
    var resultsTable = [[Int]]()
    
    init(dimensions: [[Int]]) {
        self.dimensions = dimensions
        resultsTable = Array(repeating: Array(repeating: 0, count: dimensions.count), count: dimensions.count)
        fillTable()
    }
    
    private func fillTable() {
        for i in 1..<dimensions.count {
            for p in 0..<dimensions.count-i {
                let k = p+i
                resultsTable[p][k] = minIntensity(p: p, k: k)
            }
        }
    }
    
    private func minIntensity(p: Int, k: Int) -> Int{
        guard p<=k else { return 0}

        var results = [Int]()
        for i in p..<k {
            results.append(resultsTable[p][i] + resultsTable[i+1][k] + dimensions[p][0]*dimensions[i][1]*dimensions[k][1])
        }
        return results.min()!
    }
}
