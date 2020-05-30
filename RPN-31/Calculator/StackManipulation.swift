import Foundation
import UIKit
import SwiftUI

extension Calculator {
    
   
    mutating func liftStackRegisters(){ // Keep X and copy rest up
        
        if stackRegisters.count > 0 {
            stackRegisters.insert(stackRegisters[0], at: 0)
        } else {
            stackRegisters.append(0.0)
        }
    }
    
    mutating func dropStackRegistersOneAtATime(){
        
        if stackRegisters.count > 0 {
           stackRegisters.removeFirst()
        }
    }
    
    mutating func dropStackRegistersAfterBinaryOperation(){
        if stackRegisters.count > 0 {
           stackRegisters.removeFirst()
        }
        if stackRegisters.count > 0 {
           stackRegisters.removeFirst()
        }
    }
    
    mutating func clearStack(){
        
        stackRegisters = [Double]()
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
        
        stackAutoLift = false
        
        if stackRegisters.count > 0 {
            if clearMode {
                stackRegisters.remove(at: 0)
            } else {
                
                stackRegisters[0] = 0.0
                clearMode = true
                
            }
        }
        
        xRegisterDecimals = 0
        xRegisterEntryFormatter.minimumFractionDigits = 0
        xRegisterEntryFormatter.maximumFractionDigits = 0
        
        clearLastRegisters()
        
    }
    
    mutating func swapXY(){
        
        if stackRegisters.count > 1 {
            
            let xRegister = stackRegisters[0]
            let yRegister = stackRegisters[1]
            
            stackRegisters[0] = yRegister
            stackRegisters[1] = xRegister
            
            clearLastRegisters()

        }


    }
    
    func copyToClipboard(){
        
        if stackRegisters.count > 0 {
            UIPasteboard.general.string = String(stackRegisters[0])
        }
        
    }
    
    mutating func pasteFromClipboard(){
        if let myString = UIPasteboard.general.string {
            if let xRegisterNew = Double(myString) {
                if xRegisterNew != 0.0 {
                
                    if stackRegisters.count > 0 {
                        stackRegisters[0] = xRegisterNew
                    } else {
                        stackRegisters.insert(xRegisterNew, at: 0)
                    }
                isNewNumberEntry = true
                clearLastRegisters()
                print("hello")
            }
            }
        }
    }
    
}


