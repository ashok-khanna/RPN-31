//MARK: OutputDisplay

// Updates output displays for calculator. Does not save/modify any values

import UIKit

/*
 
 extension Calculator {
     
     func updateXRegisterDisplayForFunction(_ functionTitle: String){
         xRegisterDisplay.text = functionTitle
     }
     
     func updateDisplays(afterOperation: Bool, onClear: Bool = false){
         
         let stackRegisters = defaults.array(forKey: "stackRegisters") as! [Double]
         
         if afterOperation {
             updateStackDisplay()
             updateYRegisterDisplay()
             updateXRegisterDisplay(resultMode: true)
             updateLastDisplayAfterOperation(isUnary: defaults.bool(forKey: "lUnaryAction"))
         } else {
             if onClear {
                 updateStackDisplayToNil(stackRegisters)
                 updateYRegisterDisplayToNil(stackRegisters[1])
                 updateXRegisterDisplayToNil(stackRegisters[0])
             } else {
                 updateStackDisplay()
                 updateYRegisterDisplay()
                 updateXRegisterDisplay(resultMode: true)
             }
             updateLastDisplayToNil()
         }
     }
     
     func updateXRegisterDisplayToNil(_ xRegister: Double){
         if xRegister == 0.0 { xRegisterDisplay.text = ""
         } else { updateXRegisterDisplay(resultMode: true) }
     }
     
     func updateYRegisterDisplayToNil(_ yRegister: Double){
         if yRegister == 0.0 { yRegisterDisplay.text = "" }
         else { updateYRegisterDisplay() }
     }
     
     func updateStackDisplayToNil(_ stackRegistersPassed: [Double]){
         
         var stackRegisters = stackRegistersPassed
         stackRegisters.removeFirst()
         stackRegisters.removeFirst()
         
         var emptyStack = true
         
         for double in stackRegisters {
             if double != 0.0 {
                 emptyStack = false
                 break
             }
         }
         
         if emptyStack { sRegisterDisplay.text = "" } else { updateStackDisplay() }
     }
     
     func updateLastDisplayToNil(){
         lRegisterDisplay.text = ""
     }
     
     func updateXRegisterDisplay(resultMode: Bool = false){
         
         let stackRegisters = defaults.array(forKey: "stackRegisters") as! [Double]
         
         let xRegister = stackRegisters[0]
         let xRegisterNS = NSNumber(value: xRegister)
         var xRegisterString: String
                 
         let xRegisterDecimals = UserDefaults.standard.integer(forKey: "xRegisterDecimals")
         if resultMode {
             if(UserDefaults.standard.bool(forKey: "use_significant")){
                 xRegisterString = formatterScientificXY.string(from: xRegisterNS) ?? ""
             } else {
                 xRegisterString = formatterDecimalXY.string(from: xRegisterNS) ?? ""
             }
         }
         else {
             if xRegisterDecimals <= 1 {
                 formatterXRegister.minimumFractionDigits = xRegisterDecimals
                 formatterXRegister.maximumFractionDigits = xRegisterDecimals
             }
             else {
                 formatterXRegister.minimumFractionDigits = xRegisterDecimals - 1
                 formatterXRegister.maximumFractionDigits = xRegisterDecimals - 1
                 
             }
             xRegisterString = formatterXRegister.string(from: xRegisterNS) ?? ""
         }
                 
         xRegisterDisplay.text = xRegisterString
     }
     

     
     func updateYRegisterDisplay(){
         let stackRegisters = defaults.array(forKey: "stackRegisters") as! [Double]
         
         let yRegister = stackRegisters[1]
         var yRegisterString: String
         
         if(UserDefaults.standard.bool(forKey: "use_significant")){
             yRegisterString = formatterScientificXY.string(from: NSNumber(value: yRegister)) ?? ""
         } else {
             yRegisterString = formatterDecimalXY.string(from: NSNumber(value: yRegister)) ?? ""
         }

         
         if yRegisterString == "" {
             yRegisterDisplay.text = ""
         } else {
             yRegisterDisplay.text = yRegisterString
         }
         
     }
     

     
     
     
     func updateStackDisplay(){
         let stackRegisters = defaults.array(forKey: "stackRegisters") as! [Double]
         
         let secondRegister = stackRegisters[2]
         let thirdRegister = stackRegisters[3]
         let fourthRegister = stackRegisters[4]
         
         let secondRegisterNS = NSNumber(value: secondRegister)
         let thirdRegisterNS = NSNumber(value: thirdRegister)
         let fourthRegisterNS = NSNumber(value: fourthRegister)
         
         var secondRegisterString, thirdRegisterString, fourthRegisterString : String
         
         if abs(secondRegister) > maxNumberLengthForLRegister {
             secondRegisterString = formatterScientific.string(from: secondRegisterNS) ?? ""
         } else if secondRegister == 0 {
             secondRegisterString = formatterDecimal.string(from: secondRegisterNS) ?? ""
         } else if abs(secondRegister) < minNumberLengthForLRegister {
             secondRegisterString = formatterScientific.string(from: secondRegisterNS) ?? ""
         } else {
             secondRegisterString = formatterDecimal.string(from: secondRegisterNS) ?? ""
         }

         if abs(thirdRegister) > maxNumberLengthForLRegister {
             thirdRegisterString = formatterScientific.string(from: thirdRegisterNS) ?? ""
         } else if thirdRegister == 0 {
             thirdRegisterString = formatterDecimal.string(from: thirdRegisterNS) ?? ""
         } else if abs(thirdRegister) < minNumberLengthForLRegister {
             thirdRegisterString = formatterScientific.string(from: thirdRegisterNS) ?? ""
         } else {
             thirdRegisterString = formatterDecimal.string(from: thirdRegisterNS) ?? ""
         }

         if abs(fourthRegister) > maxNumberLengthForLRegister {
             fourthRegisterString = formatterScientific.string(from: fourthRegisterNS) ?? ""
         } else if fourthRegister == 0 {
             fourthRegisterString = formatterDecimal.string(from: fourthRegisterNS) ?? ""
         } else if abs(fourthRegister) < minNumberLengthForLRegister {
             fourthRegisterString = formatterScientific.string(from: fourthRegisterNS) ?? ""
         } else {
             fourthRegisterString = formatterDecimal.string(from: fourthRegisterNS) ?? ""
         }
         
         sRegisterDisplay.text = fourthRegisterString + "\n" + "\n" + thirdRegisterString + "\n" + "\n" + secondRegisterString
     }
 }
 
 */




