
import Foundation
import SwiftUI

extension DataRouter {
    
    func exitStoreRecallMode() {
        storeRecall = false
        
        // Reset digit buttons
        
        for i in 1...9 {
            digitColorArray[i] = digitButtonColor
            digitHighlightArray[i] = lightButtonColor
            digitBrightArray[i] = brightButtonColor
        }
    

    }
    
    func startStoreRecallMode() {
        
        storeRecall = true
        
        // Check if there are non-zero values and then color those blue
        
        for i in 1...9 {
            digitHighlightArray[i] = Color(UIColor.blue.lighter(by: 25.0))
            digitBrightArray[i] = Color(UIColor.blue.lighter(by: 25.0))
        }
        
        if defaults.double(forKey: "1") != 0.0 {
            digitColorArray[1] = storeRecallHighlight
            digitBrightArray[1] = Color(UIColor.red)

        }
        
        if defaults.double(forKey: "2") != 0.0 {
            digitColorArray[2]  = storeRecallHighlight
            digitBrightArray[2] = Color(UIColor.red)

        }
        
        if defaults.double(forKey: "3") != 0.0 {
            digitColorArray[3]  = storeRecallHighlight
            digitBrightArray[3] = Color(UIColor.red)

        }
        
        if defaults.double(forKey: "4") != 0.0 {
            digitColorArray[4]  = storeRecallHighlight
            digitBrightArray[4] = Color(UIColor.red)

        }
        
        if defaults.double(forKey: "5") != 0.0 {
            digitColorArray[5]  = storeRecallHighlight
            digitBrightArray[5] = Color(UIColor.red)

        }
        
        if defaults.double(forKey: "6") != 0.0 {
            digitColorArray[6]  = storeRecallHighlight
            digitBrightArray[6] = Color(UIColor.red)

        }
        
        if defaults.double(forKey: "7") != 0.0 {
            digitColorArray[7]  = storeRecallHighlight
            digitBrightArray[7] = Color(UIColor.red)

        }
        
        if defaults.double(forKey: "8") != 0.0 {
            digitColorArray[8]  = storeRecallHighlight
            digitBrightArray[8] = Color(UIColor.red)

        }
        
        if defaults.double(forKey: "9") != 0.0 {
            digitColorArray[9]  = storeRecallHighlight
            digitBrightArray[9] = Color(UIColor.red)

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
