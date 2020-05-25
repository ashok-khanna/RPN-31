//  For code to switch views on potrait and landscape: https://stackoverflow.com/questions/57441654/swiftui-repaint-view-components-on-device-rotation
//  DataRouter.swift
//  TimeTracker
//
//  Created by Ashok Khanna on 8/5/20.
//  Copyright © 2020 Ashok Khanna. All rights reserved.
//


import Foundation
import SwiftUI


class DataRouter: ObservableObject {
    //MARK: Properties
    let defaults = UserDefaults.standard
    let defaultButtonList = ["EE", "√x", "1/x", "%", "% ∆", "e ᵡ", "ln x", "y ᵡ", "SIN", "COS", "TAN", "ASIN", "ACOS", "ATAN", "x!", "log10 x", "log2 x", "10 ᵡ", "2 ᵡ", "nPr", "nCr", "MEAN", "STDEV", "IRR", "NPV", "n", "i", "PV", "PMT", "FV", "DET", "π", "D→R", "R→D", "x√y", "e", "EXTRA1", "EXTRA2", "EXTRA3", "EXTRA4"]

    @Published var buttonList = [String]()
    @Published var altFunctions = false
    
    @Published var isPad: Bool
    @Published var landscape: Bool = false
    @Published var mySizes: MySizes

    @Published var darkMode:Bool = true
    @Published var myColors = MyColors()
    
    @Published var helpPage: Bool = false
    @Published var storeRecall: Bool = false

    @Published var numCols: CGFloat
    @Published var numRows: CGFloat
    @Published var rowUnits: CGFloat
    
    @Published var digitColorArray = [Color]()
    @Published var digitHighlightArray = [Color]()
    @Published var digitBrightArray = [Color]()
    
    @Published var digitFont = Font.title
    @Published var operatorFont = Font.headline
    @Published var captionFont = Font.caption
       
    // Set up Buttons (advance buttons, need to push this to read from user settings in future)
    @Published var zeroButton = CalculatorButton(digitValue: 0.0, digitString: "0", operatorString: "STORE/RECALL")
    @Published var oneButton = CalculatorButton(digitValue: 1.0, digitString: "1", operatorString: "EE")
    @Published var twoButton = CalculatorButton(digitValue: 2.0, digitString: "2", operatorString: "√x")
    @Published var threeButton = CalculatorButton(digitValue: 3.0, digitString: "3", operatorString: "1/x")
    @Published var fourButton = CalculatorButton(digitValue: 4.0, digitString: "4", operatorString: "%")
    @Published var fiveButton = CalculatorButton(digitValue: 5.0, digitString: "5", operatorString: "ADV")
    @Published var sixButton = CalculatorButton(digitValue: 6.0, digitString: "6", operatorString: "% ∆")
    @Published var sevenButton = CalculatorButton(digitValue: 7.0, digitString: "7", operatorString: "e ᵡ")
    @Published var eightButton = CalculatorButton(digitValue: 8.0, digitString: "8", operatorString: "ln x")
    @Published var nineButton = CalculatorButton(digitValue: 9.0, digitString: "9", operatorString: "y ᵡ")
    @Published var decimalButton = CalculatorButton(digitValue: 10.0, digitString: ".", operatorString: "HELP")
    
    // Set up number formatters
    @Published var displayFormatter = MyNumberFormatter()
            
    @Published var calculator = Calculator()
     
    init(_ isPad: Bool, mySizes: MySizes, numCols: CGFloat, numRows: CGFloat, _ fontStyle: Font, isLandscape: Bool) {
        
        self.isPad = isPad
        self.mySizes = mySizes
        self.digitFont = fontStyle
        
        self.numCols  = numCols
        self.numRows = numRows
        
        self.landscape = isLandscape
    
        self.rowUnits = numCols + (numCols + CGFloat(1)) * mySizes.gapWidth
        
        for _ in 0...10 {
            digitColorArray.append(myColors.mainButton(darkMode))
            digitHighlightArray.append(myColors.mainShortPress(darkMode))
            digitBrightArray.append(myColors.mainLongPress(darkMode))
        }
        
        let myButtonList = defaults.stringArray(forKey: "SavedButtonList") ?? [String]()
        
        if myButtonList.count < defaultButtonList.count {
            buttonList = defaultButtonList
        } else {
            buttonList = myButtonList
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(onViewWillTransition(notification:)), name: .my_onViewWillTransition, object: nil)

    }
    
    
    
    @objc func onViewWillTransition(notification: Notification) {
        guard let size = notification.userInfo?["size"] as? CGSize else { return }

        print("test")
        
        landscape = size.width > size.height
        
        print(landscape)
        
        if landscape {
            mySizes.makeLandscape()

        } else {
            mySizes.makePortrait()
            
        }
        
        rowUnits = numCols + (numCols + CGFloat(1)) * mySizes.gapWidth
        
        print(rowUnits)
    }
}
   
  
