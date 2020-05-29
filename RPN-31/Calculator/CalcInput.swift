import Foundation

extension Calculator {
    
    mutating func decimalInput(){ // No override of isNewNumberEntry because action depends on state of xRegister
        
        clearMode = false
        
        if isNewNumberEntry {
            if stackAutoLift {
                liftStackRegisters()
                stackAutoLift = false
                clearLastRegisters()
            }
            isNewNumberEntry = false
            
            if stackRegisters.count > 0 {
                    stackRegisters[0] = 0.0
            } else {
                stackRegisters.append(0.0)
            }
            

            xRegisterDecimals = 0
        }
        
        if xRegisterDecimals == 0 {
            xRegisterDecimals += 1
        }
        
    }
    
    mutating func processDigit(_ sender: CalculatorButton){
        
        clearMode = false
        
        if sender.digitString == "." {
            decimalInput()
        } else {
            if stackAutoLift {
                liftStackRegisters()
                stackAutoLift = false
                clearLastRegisters()
            }
            
            
            if stackRegisters.count > 0 {
                
                if isNewNumberEntry && stackRegisters[0] != 0.0 {
                    stackRegisters[0] = 0.0
                    isNewNumberEntry = false
                    xRegisterDecimals = 0
                }
                
                if isNewNumberEntry && stackRegisters[0] == 0.0 {
                    isNewNumberEntry = false
                    xRegisterDecimals = 0
                }
                
            } else {
                stackRegisters.append(0.0)
                isNewNumberEntry = false
                xRegisterDecimals = 0
            }
            
            var xRegisterNew: Double
            let xRegisterOld = stackRegisters[0]
            
            if  xRegisterDecimals == 0 {
                xRegisterNew = xRegisterOld * 10.0 + sender.digitValue
            } else if xRegisterDecimals > 0 {
                xRegisterNew = xRegisterOld + pow(10.0, -1.0 * Double(xRegisterDecimals)) * sender.digitValue
                xRegisterDecimals += 1
            } else {
                xRegisterNew = xRegisterOld
            }
            
            stackRegisters[0] = xRegisterNew

        }
        
        if xRegisterDecimals <= 1 {
            xRegisterEntryFormatter.minimumFractionDigits = 0
            xRegisterEntryFormatter.maximumFractionDigits = 0
        }
        else {
            xRegisterEntryFormatter.minimumFractionDigits = xRegisterDecimals - 1
            xRegisterEntryFormatter.maximumFractionDigits = xRegisterDecimals - 1
            
        }
        
    }
    
    
    mutating func deleteInput(){
        
        clearMode = false
        
        isNewNumberEntry = false //Adding digits after delete key should be editing same number
        stackAutoLift = false
        
        // Note that xRegisterDecimals = 0 or 1 for zero decimals (0 means decimal modification not invoked
        // while 1 is decimal modification invoked) and 2 for 1 decimal, 3 for 2 decimals and so on
        
        // Code for getting decimals if number is from result (since then it will have xRegisterDecimals = 0
        
        if stackRegisters.count == 0 {
            stackRegisters.append(0.0)
        }
        
        if xRegisterDecimals == 0 {
            xRegisterDecimals = 1
            for i in 0...4 {

                let truncateDecimals = (stackRegisters[0] * pow(10.0, Double(i))).truncatingRemainder(dividingBy: 1.0)

                if truncateDecimals == 0 {
                    break
                } else {
                    xRegisterDecimals += 1
                }
            }
            
        }
        
        if xRegisterDecimals <= 1 {
            
            stackRegisters[0] = Double(floor(stackRegisters[0]/10))
            
        } else if xRegisterDecimals > 1 {
            let intermediateX = floor(stackRegisters[0] * pow(10.0, Double(xRegisterDecimals - 2)))
            stackRegisters[0]  = Double(intermediateX / pow(10.0, Double(xRegisterDecimals - 2)))
            
            xRegisterDecimals = xRegisterDecimals - 1
        }
        
        if xRegisterDecimals <= 1 {
            xRegisterDecimals = 0
        }
        
        if xRegisterDecimals <= 1 {
            xRegisterEntryFormatter.minimumFractionDigits = 0
            xRegisterEntryFormatter.maximumFractionDigits = 0
        }
        else {
            xRegisterEntryFormatter.minimumFractionDigits = xRegisterDecimals - 1
            xRegisterEntryFormatter.maximumFractionDigits = xRegisterDecimals - 1
        }

        clearLastRegisters()
    }
    
    
    
    
}
