//
//  MyNumberFormatter.swift
//  RPN-31
//
//  Created by Ashok Khanna on 24/5/20.
//  Copyright © 2020 Ashok Khanna. All rights reserved.
//

import Foundation
import SwiftUI

enum NumberFormatMode {
    
    case science
    case decimal
    case special
    
}

struct MyNumberFormatter {
    let defaults = UserDefaults.standard

    var scientificFormatter = NumberFormatter()
    var decimalFormatter = NumberFormatter()
    var mode: NumberFormatMode
    var smallNumber = 0.00000001
    var largeNumber = 999999999999.9
    
    var relevantModeIsDecimals: Bool
    
    let defaultDecimals = 4
    let defaultSigDigits = 6
    
    var maximumFractionDigits: Int
    var maximumSignificantDigits: Int
    
    init() {
         
        decimalFormatter.numberStyle = .decimal
        scientificFormatter.numberStyle = .scientific
        
         if defaults.integer(forKey: "decimals") == 0 {
             decimalFormatter.maximumFractionDigits = defaultDecimals
             maximumFractionDigits = defaultDecimals

         } else {
                decimalFormatter.maximumFractionDigits = defaults.integer(forKey: "decimals")
                maximumFractionDigits = defaults.integer(forKey: "decimals")

         }
         
         if defaults.integer(forKey: "sigDigits") == 0 {
                scientificFormatter.maximumSignificantDigits = defaultSigDigits
                maximumSignificantDigits = defaultSigDigits
             
         } else {
                scientificFormatter.maximumSignificantDigits = defaults.integer(forKey: "sigDigits")
                maximumSignificantDigits = defaults.integer(forKey: "sigDigits")
         }
         
         switch defaults.string(forKey: "displayMode") {
         case "DECIMAL":
             mode = .decimal
             relevantModeIsDecimals = true
         case "SCIENCE":
             mode = .science
             relevantModeIsDecimals = false
         case "SPECIAL":
             mode = .special
             relevantModeIsDecimals = true

         default:
             mode = .special
             relevantModeIsDecimals = true

         }
        
    }
    
    mutating func setDecimals(_ decimals: Int){
        maximumFractionDigits = decimals
        defaults.set(decimals, forKey: "decimals")
    }
    
    mutating func setSigDigits(_ sigDigits: Int){
        maximumSignificantDigits = sigDigits
        defaults.set(sigDigits, forKey: "sigDigits")
    }
    
    mutating func rebuild(){
        
        if defaults.integer(forKey: "decimals") == 0 {
            decimalFormatter.maximumFractionDigits = defaultDecimals
            maximumFractionDigits = defaultDecimals

        } else {
               decimalFormatter.maximumFractionDigits = defaults.integer(forKey: "decimals")
               maximumFractionDigits = defaults.integer(forKey: "decimals")

        }
        
        if defaults.integer(forKey: "sigDigits") == 0 {
               scientificFormatter.maximumSignificantDigits = defaultSigDigits
               maximumSignificantDigits = defaultSigDigits
            
        } else {
               scientificFormatter.maximumSignificantDigits = defaults.integer(forKey: "sigDigits")
               maximumSignificantDigits = defaults.integer(forKey: "sigDigits")
        }
        
        switch defaults.string(forKey: "displayMode") {
        case "DECIMAL":
            mode = .decimal
            relevantModeIsDecimals = true
        case "SCIENCE":
            mode = .science
            relevantModeIsDecimals = false
        case "SPECIAL":
            mode = .special
            relevantModeIsDecimals = true

        default:
            mode = .special
            relevantModeIsDecimals = true

        }
        
    }
    
    func string(_ number: Double) -> String {
        
        if number == 0.0 {
            return String(0)
        }
        
        switch mode {
            
        case .special:

            if abs(number) > smallNumber && abs(number) < largeNumber {

                return decimalFormatter.string(from: NSNumber(value: number)) ?? ""
            } else {

                return scientificFormatter.string(from: NSNumber(value: number)) ?? ""
            }

        case .science:
            return scientificFormatter.string(from: NSNumber(value: number)) ?? ""
            
        case .decimal:
            return decimalFormatter.string(from: NSNumber(value: number)) ?? ""
            
        }
        
    }
}


