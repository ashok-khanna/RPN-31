
import Foundation
import SwiftUI

extension DataRouter {
    
    func exitStoreRecallMode() {
        storeRecall = false
        
        // Reset digit buttons
        
        for i in 1...9 {
            digitColorArray[i] = myColors.mainButton(darkMode)
            digitHighlightArray[i] = myColors.mainShortPress(darkMode)
            digitBrightArray[i] = myColors.mainLongPress(darkMode)
        }
    

    }
    
    func startStoreRecallMode() {
        
        storeRecall = true
        
        // Check if there are non-zero values and then color those blue
        
        for i in 1...9 {
            digitHighlightArray[i] = myColors.storeRecallHighlight(darkMode)
            digitBrightArray[i] = myColors.storeRecallHighlight(darkMode)
        }
        
        if defaults.double(forKey: "1") != 0.0 {
            digitColorArray[1] = myColors.storeRecall(darkMode)
            digitBrightArray[1] = myColors.deleteHighlight(darkMode)

        }
        
        if defaults.double(forKey: "2") != 0.0 {
            digitColorArray[2]  = myColors.storeRecall(darkMode)
            digitBrightArray[2] = myColors.deleteHighlight(darkMode)

        }
        
        if defaults.double(forKey: "3") != 0.0 {
            digitColorArray[3]  = myColors.storeRecall(darkMode)
            digitBrightArray[3] = myColors.deleteHighlight(darkMode)

        }
        
        if defaults.double(forKey: "4") != 0.0 {
            digitColorArray[4]  = myColors.storeRecall(darkMode)
            digitBrightArray[4] = myColors.deleteHighlight(darkMode)

        }
        
        if defaults.double(forKey: "5") != 0.0 {
            digitColorArray[5]  = myColors.storeRecall(darkMode)
            digitBrightArray[5] = myColors.deleteHighlight(darkMode)

        }
        
        if defaults.double(forKey: "6") != 0.0 {
            digitColorArray[6]  = myColors.storeRecall(darkMode)
            digitBrightArray[6] = myColors.deleteHighlight(darkMode)

        }
        
        if defaults.double(forKey: "7") != 0.0 {
            digitColorArray[7]  = myColors.storeRecall(darkMode)
            digitBrightArray[7] = myColors.deleteHighlight(darkMode)

        }
        
        if defaults.double(forKey: "8") != 0.0 {
            digitColorArray[8]  = myColors.storeRecall(darkMode)
            digitBrightArray[8] = myColors.deleteHighlight(darkMode)

        }
        
        if defaults.double(forKey: "9") != 0.0 {
            digitColorArray[9]  = myColors.storeRecall(darkMode)
            digitBrightArray[9] = myColors.deleteHighlight(darkMode)

        }
        
        
    }
    
    func processStoreRecall(_ storageKey: String) {
        
        if defaults.double(forKey: storageKey) == 0.0 {
            defaults.set(calculator.stackRegisters[0], forKey: storageKey)

        } else {
            
            if calculator.stackAutoLift {
                calculator.liftStackRegisters()
                calculator.stackAutoLift = false
             }
            
            calculator.stackRegisters[0] = defaults.double(forKey: storageKey)
        }
        
        
        calculator.isNewNumberEntry = true
        exitStoreRecallMode()
        
    }
    
    func longPressStoreRecall(_ storageKey: String){
        
        if defaults.double(forKey: storageKey) == 0.0 {
            defaults.set(calculator.stackRegisters[0], forKey: storageKey)

        } else {
            defaults.set(0.0, forKey: storageKey)

        }
    }
    

}
