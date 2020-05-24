import Foundation


struct LastRegister {
    
    var lastX = 0.0
    var lastY = 0.0
    var lastOperator = ""
    var unaryAction = false
    var displayText = ""
    var lRegisterFormatter = NumberFormatter()
    
    init(){
        lRegisterFormatter.numberStyle = .decimal
        lRegisterFormatter.maximumFractionDigits = 5
    }
    
    
    mutating func updateLastDisplayAfterOperation(){
    
    
    let lastXString = lRegisterFormatter.string(from: NSNumber(value: lastX)) ?? ""
    let lastYString = lRegisterFormatter.string(from: NSNumber(value: lastY)) ?? ""
    
        
    switch lastOperator {
        
        case "+":
            displayText = lastYString + " " + lastOperator + " " + lastXString
        case "−":
            displayText = lastYString + " " + lastOperator + " " + lastXString
        case "x":
            displayText = lastYString + " " + lastOperator + " " + lastXString
        case "DIV":
            displayText = lastYString + " " + "÷" + " " + lastXString
        case "x!":
            displayText = lastXString + "!"
        case "√x":
            displayText = "√" + lastXString
        case "x√y":
            displayText = lastXString + " " + "√" + " " + lastYString
        case "1/x":
            displayText = "1 ÷ " + lastXString
        case "% Δ":
            displayText = "% change  of (" + lastXString + " - " + lastYString + ")"
        case "e^x":
            displayText = "e ^ " + lastXString
        case "EE":
            displayText = lastYString + "e" + lastXString
        case "ln x":
            displayText = "ln(" + lastXString + ")"
        case "log10 x":
            displayText = "log10(" + lastXString + ")"
        case "log2 x":
            displayText = "log2(" + lastXString + ")"
        case "y^x":
            displayText = lastYString + " " + "^" + " " + lastXString
        case "TRIG":
            switch lastXString {
            case "1":
                displayText = "sin(" + lastYString + ")"
            case "2":
                displayText = "cos(" + lastYString + ")"
            case "3":
                displayText = "tan(" + lastYString + ")"
            case "4":
                displayText = "asin(" + lastYString + ")"
            case "5":
                displayText = "acos(" + lastYString + ")"
            case "6":
                displayText = "atan(" + lastYString + ")"
            case "7":
                displayText = "π"
            case "8":
                displayText = "D→R"
            case "9":
                displayText = "R→D"
            default:
                return
            }
            
        case "sin x":
            displayText = "sin(" + lastYString + ")"
        case "cos x":
            displayText = "cos(" + lastYString + ")"
        case "tan x":
            displayText = "tan(" + lastYString + ")"
        case "asin x":
            displayText = "asin(" + lastYString + ")"
        case "acos x":
            displayText = "acos(" + lastYString + ")"
        case "atan x":
            displayText = "atan(" + lastYString + ")"
        default:
            if unaryAction {
               displayText = lastOperator + "  " + lastXString
            } else {
               displayText = lastYString + "  " + lastOperator + "  " + lastXString
            }
    }
    
}

}


extension Calculator {
    
    mutating func reverseOperation(){
           
        if lastRegister.lastOperator != "" {
               
            if lastRegister.unaryAction {
                    stackRegisters[0] = lastRegister.lastX
               } else {
                    stackRegisters.removeFirst()
                    stackRegisters.insert(lastRegister.lastY, at: 0)
                    stackRegisters.insert(lastRegister.lastX, at: 0)
               }
               stackAutoLift = false
               clearLastRegisters()
            
           }
    
       }
    
    
}
