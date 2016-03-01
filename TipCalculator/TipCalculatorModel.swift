//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Jonathan Chiam on 29/2/16.
//  Copyright © 2016 Jonathan Chiam. All rights reserved.
//

import Foundation

class TipCalculatorModel {
    
    var total: Double
    var taxPct: Double
    
    var subTotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPct(tipPct: Double) -> (tipAmt: Double, total: Double) {
        let tipAmt = subTotal * tipPct
        let finalTotal = subTotal + tipAmt
        return (tipAmt, finalTotal)
    }
    
    func returnPossibleTips() -> [Int : (tipAmt: Double, total: Double)] {
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        
        var retValue = [Int : (tipAmt: Double, total: Double)]()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip * 100)
            retValue[intPct] = calcTipWithTipPct(possibleTip)
        }
        
        return retValue
    }
}