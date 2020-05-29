/*
 
 Calculator Class Notes
 
 Deleted buttons and register displays, so need to map these appropriate
 
 xRegisterDisplay.isUserInteractionEnabled = true
 sRegisterDisplay.isUserInteractionEnabled = true
 lRegisterDisplay.isUserInteractionEnabled = true
 yRegisterDisplay.isUserInteractionEnabled = true
 
 Long press time was set to 0.3
 
 Code for Button Coloring:
 
 let lightOrange = UIColor.orange.lighter(by: 25.0)
 let lighterOrange = UIColor.orange.lighter(by: 50.0)
 let lightRed = UIColor.red.lighter(by: 25.0)
 let translucentDarkGray = UIColor.init(white: 1.0 / 3.0, alpha: 0.5)
 let longHighlightColor = UIColor.orange.lighter(by: 25.0)
 
 let translucentOrange = UIColor.init(displayP3Red: 1.0, green: 0.5, blue: 0.0, alpha: 0.5)
 let translucentLightOrange = UIColor.init(displayP3Red: 1.0, green: 0.5, blue: 0.0, alpha: 0.75)
 let translucentLightGray = UIColor.init(white: 2.0 / 3.0, alpha: 0.5)
 let translucentLighterOrange = translucentLightOrange.lighter(by: 50.0)
 
 for case let button as CalculatorButton in self.subviews  {
     button.layer.cornerRadius = 10
     button.clipsToBounds = true
 }
 
 sRegisterDisplay.layer.cornerRadius = 8.75
 sRegisterDisplay.clipsToBounds = true
 
 Keep Number Formatting Seperate
 
 
 */

import Foundation


struct CalculatorButton {
    var digitValue: Double
    var digitString: String
    var operatorString: String
        
    init(digitValue: Double, digitString: String, operatorString: String){
        self.digitValue = digitValue
        self.digitString = digitString
        self.operatorString = operatorString
    }
    
}




struct Calculator {
    
    //MARK: Initialization
    
    //VERY IMPORTANT: Pressing most calculator functions leave the stack left in a state where it will automatically lift. The ENTER key (and CLx which clears the X register) leave the stack in state where it won't automatically lift when the next number is entered. In this case, when the next number is entered it will replace the X register. This may sound complicated but it's really simple and intuitive. The ENTER key copies the X register to Y so there is no reason for the stack to automatically lift when you key the next number. You also wouldn't want the stack to lift after a CLx because that would just insert a zero into the stack. You rarely need to think about this - the calculator just does the right thing.
    
    // Only after an operation is completed AND user has not left the screen should stackAutoLift be set to true. When this occurs entering a new number after an operation results in autolift
    
    // Determine whether entering a digit is for a new number or the existing. Not saved in userdefaults as we want a new entry every time the app is started from scratch.
    
    var isNewNumberEntry: Bool = true
    var stackAutoLift: Bool = false // User does not expect this behaviour when accessing calculator for first time
    var clearMode = false
    
    var stackRegisters = [Double]() // = [0.0, 0.0, 0.0, 0.0, 0.0] // Ensure there is at least five values here to allow for easy displaying of X and Y registers and the three stack registers
    var xRegisterDecimals: Int = 0

    var lastRegister = LastRegister()
    
    var showFunction: Bool = false
    var functionText: String = ""

    var xRegisterEntryFormatter = NumberFormatter()
    
    init(){
        
        xRegisterEntryFormatter.numberStyle = .decimal
        
    }

              
}
