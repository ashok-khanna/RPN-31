import Foundation
import UIKit

extension Calculator {
    
   
    mutating func liftStackRegisters(){ // Keep X and copy rest up
        stackRegisters.insert(stackRegisters[0], at: 0)
    }
    
    mutating func dropStackRegistersOneAtATime(){
        stackRegisters.removeFirst()
        stackRegisters.append(0.0) // Prevents reducing function below minimum 5 elements required at all times
    }
    
    mutating func dropStackRegistersAfterBinaryOperation(){
        stackRegisters.removeFirst()
        stackRegisters.removeFirst()
        stackRegisters.insert(0.0, at: 0)
        stackRegisters.append(0.0) // Prevents reducing function below minimum 5 elements required at all times
    }
    
    mutating func clearStack(){
        
        stackRegisters = [Double]()
        stackRegisters.append(0.0)
        stackRegisters.append(0.0)
        stackRegisters.append(0.0)
        stackRegisters.append(0.0)
        stackRegisters.append(0.0)
        
        isNewNumberEntry = true
        stackAutoLift = false // User does not expect this behaviour when accessing calculator for first time
        
    }
    
    mutating func clearLastRegisters(){
        
        lastRegister.lastX = 0.0
        lastRegister.lastY = 0.0
        lastRegister.lastOperator = ""
        lastRegister.unaryAction = false
        lastRegister.displayText = ""
        
    }
    
    mutating func processEnter(){
        
        isNewNumberEntry = true // Adding digits after enter key should be creating a new number
        stackAutoLift = false
        liftStackRegisters()
        clearLastRegisters()
        
    }
    
    mutating func clearLast(){
        
        if stackRegisters[0] == 0.0 {
            if stackRegisters[1] == 0.0 {
                if stackRegisters[2] == 0.0 {
                    
                    if stackRegisters[3] == 0.0 {
                        
                        if stackRegisters[4] == 0.0 {
                            dropStackRegistersOneAtATime()
                        } else {
                            stackRegisters[4] = 0.0
                            dropStackRegistersOneAtATime()
                        }
                    } else {
                        stackRegisters[3] = 0.0
                        dropStackRegistersOneAtATime()
                    }
                    
                } else {
                    stackRegisters[2] = 0.0
                    dropStackRegistersOneAtATime()
                }
            } else {
                stackRegisters[1] = 0.0
                dropStackRegistersOneAtATime()
            }
        } else {
            stackRegisters[0] = 0.0
        }
        
        clearLastRegisters()
        
    }
    
    mutating func swapXY(){
        
        let xRegister = stackRegisters[0]
        let yRegister = stackRegisters[1]
        
        stackRegisters[0] = yRegister
        stackRegisters[1] = xRegister
                
        clearLastRegisters()

    }
    
    func copyToClipboard(){
        UIPasteboard.general.string = String(stackRegisters[0])
    }
    
    mutating func pasteFromClipboard(){
        if let myString = UIPasteboard.general.string {
            if let xRegisterNew = Double(myString) {
                if xRegisterNew != 0.0 {
                stackRegisters[0] = xRegisterNew
                isNewNumberEntry = true
                clearLastRegisters()
                print("hello")
            }
            }
        }
    }
    
}
