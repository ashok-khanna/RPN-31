/*
 
 Handle previous operation (to display and also to allow its reversal)
 
 
 */

struct LastRegister {
    
    var lastX = 0.0
    var lastY = 0.0
    var lastOperator = ""
    var unaryAction = false
    var displayText = ""
    
    mutating func updateLastDisplayAfterOperation(){
    
    let lRegisterFormatter = MyNumberFormatter(true)
        
    let lastXString = lRegisterFormatter.string(lastX)
    let lastYString = lRegisterFormatter.string(lastY)
    
        
    switch lastOperator {
        
        case "+":
            displayText = lastYString + " " + lastOperator + " " + lastXString
        case "−":
            displayText = lastYString + " " + lastOperator + " " + lastXString
        case "X":
            displayText = lastYString + " x " + lastXString
        case "DIV":
            displayText = lastYString + " " + "÷" + " " + lastXString
        case "π":
            displayText = "π"
        case "x!":
            displayText = lastXString + "!"
        case "√x":
            displayText = "√" + lastXString
        case "x√y":
            displayText = lastXString + " " + "√" + " " + lastYString
        case "1/x":
            displayText = "1 ÷ " + lastXString
        case "% ∆":
            displayText = "% change  of " + lastYString + " to " + lastXString
        case "e ᵡ":
            displayText = "e ^ " + lastXString
        case "y ᵡ":
            displayText = lastYString + " ^ " + lastXString
        case "2 ᵡ":
            displayText = "2 ^ " + lastXString
        case "10 ᵡ":
            displayText = "10 ^ " + lastXString
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
        case "IRR":
            displayText = "Internal Rate of Return"
        case "NPV":
            displayText = "Net Present Value"
        case "D→R":
            displayText = lastXString + " Degrees → Radians"
        case "R→D":
            displayText = lastXString + " Radians → Degrees"
        case "DICE":
            displayText = "Dice Roll"
        case "RAND":
            displayText = "Random Number in [0,1]"
        case "PDF":
            displayText = "Std Normal PDF of " + lastXString
        case "CDF":
            displayText = "Std Normal CDF of " + lastYString
        case "e":
            displayText = "Euler's Constant"
        case "MEAN":
            displayText = "Mean"
        case "SDEV":
            displayText = "Standard Deviation"
        case "CASHF":
            displayText = "Cashflows Added"
        case "NPR":
            displayText = "Permuations (n = " + lastYString + ", r = " + lastXString + ")"
        case "NCR":
            displayText = "Combinations (n = " + lastYString + ", r = " + lastXString + ")"
        case "SIN":
            displayText = "sin(" + lastYString + ")"
        case "COS":
            displayText = "cos(" + lastYString + ")"
        case "TAN":
            displayText = "tan(" + lastYString + ")"
        case "ASIN":
            displayText = "asin(" + lastYString + ")"
        case "ACOS":
            displayText = "acos(" + lastYString + ")"
        case "ATAN":
            displayText = "atan(" + lastYString + ")"
        case "SINH":
            displayText = "sinh(" + lastYString + ")"
        case "COSH":
            displayText = "cosh(" + lastYString + ")"
        case "TANH":
            displayText = "tanh(" + lastYString + ")"
        case "%":
            displayText = lastXString + " %  of " + lastYString
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
                    
                if stackRegisters.count > 0 {
                    stackRegisters[0] = lastRegister.lastX
                }
               } else {
                if stackRegisters.count > 0 {
                    stackRegisters.removeFirst()
                }
                    stackRegisters.insert(lastRegister.lastY, at: 0)
                    stackRegisters.insert(lastRegister.lastX, at: 0)
               }
               stackAutoLift = false
               clearLastRegisters()
            
           }
    
       }
    
    
}
