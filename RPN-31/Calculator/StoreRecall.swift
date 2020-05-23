
import Foundation

extension DataRouter {
    
    func exitStoreRecallMode() {
        storeRecall = false
        
        // Reset digit buttons
        
        digitColorArray[1] = darkButtonColor
        digitColorArray[2] = darkButtonColor
        digitColorArray[3] = darkButtonColor
        digitColorArray[4] = darkButtonColor
        digitColorArray[5] = darkButtonColor
        digitColorArray[6] = darkButtonColor
        digitColorArray[7] = darkButtonColor
        digitColorArray[8] = darkButtonColor
        digitColorArray[9] = darkButtonColor

    }
    
    func startStoreRecallMode() {
        
        storeRecall = true
        
        // Check if there are non-zero values and then color those blue
        
        if defaults.double(forKey: "1") != 0.0 {
            digitColorArray[1] = storeRecallHighlight
        }
        
        if defaults.double(forKey: "2") != 0.0 {
            digitColorArray[2]  = storeRecallHighlight
        }
        
        if defaults.double(forKey: "3") != 0.0 {
            digitColorArray[3]  = storeRecallHighlight
        }
        
        if defaults.double(forKey: "4") != 0.0 {
            digitColorArray[4]  = storeRecallHighlight
        }
        
        if defaults.double(forKey: "5") != 0.0 {
            digitColorArray[5]  = storeRecallHighlight
        }
        
        if defaults.double(forKey: "6") != 0.0 {
            digitColorArray[6]  = storeRecallHighlight
        }
        
        if defaults.double(forKey: "7") != 0.0 {
            digitColorArray[7]  = storeRecallHighlight
        }
        
        if defaults.double(forKey: "8") != 0.0 {
            digitColorArray[8]  = storeRecallHighlight
        }
        
        if defaults.double(forKey: "9") != 0.0 {
            digitColorArray[9]  = storeRecallHighlight
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
    
    func deleteStoreRecall(_ storageKey: String){
        defaults.set(0.0, forKey: storageKey)
    }

}
