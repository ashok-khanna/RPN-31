import Foundation

extension Calculator {
        
    mutating func processOperation(_ operation: String){
                        
            stackAutoLift = true
            
            var unaryAction = false
            
            let xRegister = stackRegisters[0]
            let yRegister = stackRegisters[1]
            
            var xRegisterNew: Double
            
        switch operation {
                
            case "+":
                xRegisterNew = yRegister + xRegister
            case "-":
                xRegisterNew = yRegister - xRegister
            case "X":
                xRegisterNew = yRegister * xRegister
            case "DIV":
                xRegisterNew = yRegister / xRegister
            case "CHS":
                xRegisterNew = -1 * xRegister
                stackAutoLift = true // CHS is not an operation that should trigger stackautolift (removed this)
                unaryAction = true
                
            case "EE":
                xRegisterNew = yRegister * pow(10.0, Double(xRegister))
            case "√x":
                xRegisterNew = sqrt(xRegister)
                unaryAction = true
            case "x√y":
                xRegisterNew = pow(yRegister, 1.0 / xRegister)
            case "1/x":
                xRegisterNew = 1 / xRegister
                unaryAction = true
            case "%":
                xRegisterNew = yRegister * xRegister / 100
            case "% ∆":
                xRegisterNew = (xRegister - yRegister) / yRegister
            case "% T":
                xRegisterNew = xRegister / (yRegister + xRegister)
            case "e^x":
                xRegisterNew = exp(xRegister)
                unaryAction = true
            case "ln x":
                xRegisterNew = log(xRegister)
                unaryAction = true
            case "y^x":
                xRegisterNew = pow(yRegister, xRegister)
                
            case "x!":
                xRegisterNew = tgamma(xRegister + 1)
                unaryAction = true
            case "log10 x":
                xRegisterNew = log(xRegister)/log(10.0)
                unaryAction = true
            case "log x":
                xRegisterNew = log(xRegister)/log(2.0)
                unaryAction = true

            case "SIN":
                xRegisterNew = sin(yRegister)
                unaryAction = true
            case "COS":
                xRegisterNew = cos(yRegister)
                unaryAction = true
            case "TAN":
                xRegisterNew = tan(yRegister)
                unaryAction = true
            case "ASIN":
                xRegisterNew = asin(yRegister)
                unaryAction = true
            case "ACOS":
                xRegisterNew = acos(yRegister)
                unaryAction = true
            case "TAN":
                xRegisterNew = atan(yRegister)
                unaryAction = true
            case "π":
                xRegisterNew = Double.pi
                unaryAction = true
            case "D→R":
                xRegisterNew = Double.pi * yRegister / 180.0
                unaryAction = true
            case "R→D":
                xRegisterNew = 180.0 * yRegister / Double.pi
                unaryAction = true
            default:
                return
            }
            
            lastRegister.lastX = xRegister
            lastRegister.lastY = yRegister
            lastRegister.lastOperator = operation
            lastRegister.unaryAction = unaryAction
            lastRegister.updateLastDisplayAfterOperation()
            
            if !unaryAction {
                dropStackRegistersAfterBinaryOperation()
            }
            
        amendStackRegister(value: xRegisterNew, at: 0)
            
        if operation != "CHS" {
                xRegisterDecimals = 0
            }
            
            isNewNumberEntry = true
            
        }
    

        
}



    
    
    

    

