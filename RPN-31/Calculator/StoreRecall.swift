/*
 
 Add-on for store / recall of values. This is an extension of DataRouter and not Calculator since it does not relate to computation
 and therefore should not be included in the Calculator Struct as to limit its complexity.
 
 
 */

import SwiftUI

extension DataRouter {
    
    func exitStoreRecallMode() { // Exit Store/Recall mode. Reset color digit buttons - based on defined color scheme
        storeRecall = false
        
        for i in 1...9 {
            digitColorArray[i] = myColors.mainButtonColor
            digitHighlightArray[i] = myColors.mainShortPressColor
            digitBrightArray[i] = myColors.mainLongPressColor
        }
    

    }
    
    func startStoreRecallMode() { // Enter Store/Recall mode. Check if there are non-zero values in storage registers and then color those according to the color scheme
        
        storeRecall = true
        
        for i in 1...9 {
            digitHighlightArray[i] = myColors.storeRecallHighlightColor
            digitBrightArray[i] = myColors.storeRecallHighlightColor
        }
        
        if defaults.double(forKey: "1") != 0.0 {
            digitColorArray[1] = myColors.storeRecallMainColor
            digitBrightArray[1] = myColors.deleteHighlightColor

        }
        
        if defaults.double(forKey: "2") != 0.0 {
            digitColorArray[2]  = myColors.storeRecallMainColor
            digitBrightArray[2] = myColors.deleteHighlightColor

        }
        
        if defaults.double(forKey: "3") != 0.0 {
            digitColorArray[3]  = myColors.storeRecallMainColor
            digitBrightArray[3] = myColors.deleteHighlightColor

        }
        
        if defaults.double(forKey: "4") != 0.0 {
            digitColorArray[4]  = myColors.storeRecallMainColor
            digitBrightArray[4] = myColors.deleteHighlightColor

        }
        
        if defaults.double(forKey: "5") != 0.0 {
            digitColorArray[5]  = myColors.storeRecallMainColor
            digitBrightArray[5] = myColors.deleteHighlightColor

        }
        
        if defaults.double(forKey: "6") != 0.0 {
            digitColorArray[6]  = myColors.storeRecallMainColor
            digitBrightArray[6] = myColors.deleteHighlightColor

        }
        
        if defaults.double(forKey: "7") != 0.0 {
            digitColorArray[7]  = myColors.storeRecallMainColor
            digitBrightArray[7] = myColors.deleteHighlightColor

        }
        
        if defaults.double(forKey: "8") != 0.0 {
            digitColorArray[8]  = myColors.storeRecallMainColor
            digitBrightArray[8] = myColors.deleteHighlightColor

        }
        
        if defaults.double(forKey: "9") != 0.0 {
            digitColorArray[9]  = myColors.storeRecallMainColor
            digitBrightArray[9] = myColors.deleteHighlightColor

        }
        
        
    }
    
    func processStoreRecall(_ storageKey: String) { // If there is no value in the storage, store your number there. Otherwise recall its value (this is on short press)
        
        if defaults.double(forKey: storageKey) == 0.0 {
            
            if calculator.stackRegisters.count > 0 {
                defaults.set(calculator.stackRegisters[0], forKey: storageKey)
            }
            

        } else {
            
            if calculator.stackAutoLift {
                calculator.liftStackRegisters()
                calculator.stackAutoLift = false
             }
            
            if calculator.stackRegisters.count > 0 {
                calculator.stackRegisters[0] = defaults.double(forKey: storageKey)
            } else {
                calculator.stackRegisters.insert(defaults.double(forKey: storageKey), at: 0)
            }
            
        }
        
        
        calculator.isNewNumberEntry = true
        exitStoreRecallMode()
        
    }
    
    func longPressStoreRecall(_ storageKey: String){ // If there is no value in the storage, store your number there. Otherwise clear the storage register (this is on long press)
        
        if defaults.double(forKey: storageKey) == 0.0 {
            
            if calculator.stackRegisters.count > 0 {
                     defaults.set(calculator.stackRegisters[0], forKey: storageKey)
            }
        
        } else {
            defaults.set(0.0, forKey: storageKey)

        }
    }
    

}
