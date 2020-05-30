/*
 
 MyNumberFormatter is used to format the numbers from the stack register (format: double) to string for display on the main page.
 The number format is applied equally to the xRegister, yRegister and sRegister. The lRegister also uses these values, through the
 shared user settings
 
 */


import SwiftUI

enum NumberFormatMode {
    
    case science
    case decimal
    case special
    
}

struct MyNumberFormatter {
    let defaults = UserDefaults.standard

    var scientificFormatter = NumberFormatter()
    var decimalFormatter = NumberFormatter()
    var mode: NumberFormatMode
    var smallNumber = 0.00000001 // Hard-coded values for special number format. Numbers smaller than the small number and larger than the large number are pushed to scientific mode in special mode
    var largeNumber = 999999999999.9 // = 999,999,999,999.9 i.e. 999.99.. Billion. We frequently see some numbers (e.g. Assets Under Management) in the 100s of billions, so this was a natural choice for the large number
    
    var relevantModeIsDecimals: Bool // True for both decimal and special modes, false for science mode (since it uses significant digits)
    
    let defaultDecimals = 2 // Default value is based on 0.0001 being 1 basis point, a standard metric in financial calculations
    let defaultSigDigits = 6 // 
    
    var maximumFractionDigits: Int
    var maximumSignificantDigits: Int
    
    var lRegisterFlag = false
    
    init(_ lFlag: Bool = false) {
        
        lRegisterFlag = lFlag
        
        decimalFormatter.numberStyle = .decimal
        scientificFormatter.numberStyle = .scientific

         if defaults.string(forKey: "displayMode") == nil {
             decimalFormatter.maximumFractionDigits = defaultDecimals
             maximumFractionDigits = defaultDecimals

         } else {
                decimalFormatter.maximumFractionDigits = defaults.integer(forKey: "decimals")
                maximumFractionDigits = defaults.integer(forKey: "decimals")

         }
         
         if defaults.string(forKey: "displayMode") == nil  {
                scientificFormatter.maximumSignificantDigits = defaultSigDigits
                maximumSignificantDigits = defaultSigDigits
             
         } else {
                scientificFormatter.maximumSignificantDigits = defaults.integer(forKey: "sigDigits")
                maximumSignificantDigits = defaults.integer(forKey: "sigDigits")
         }
         
         switch defaults.string(forKey: "displayMode") {
         case "DECIMAL":
             mode = .decimal
             relevantModeIsDecimals = true
         case "SCIENCE":
             mode = .science
             relevantModeIsDecimals = false
         case "SPECIAL":
             mode = .special
             relevantModeIsDecimals = true

         default:
             mode = .special
             relevantModeIsDecimals = true
             defaults.set("SPECIAL", forKey: "displayMode")

         }
        
    }
    
    mutating func setDecimals(_ decimals: Int){
        maximumFractionDigits = decimals
        defaults.set(decimals, forKey: "decimals")
    }
    
    mutating func setSigDigits(_ sigDigits: Int){
        maximumSignificantDigits = sigDigits
        defaults.set(sigDigits, forKey: "sigDigits")
    }
    
    mutating func rebuild(){
        
        decimalFormatter.maximumFractionDigits = defaults.integer(forKey: "decimals")
        maximumFractionDigits = defaults.integer(forKey: "decimals")

        scientificFormatter.maximumSignificantDigits = defaults.integer(forKey: "sigDigits")
        maximumSignificantDigits = defaults.integer(forKey: "sigDigits")
        
        
        switch defaults.string(forKey: "displayMode") {
        case "DECIMAL":
            mode = .decimal
            relevantModeIsDecimals = true
        case "SCIENCE":
            mode = .science
            relevantModeIsDecimals = false
        case "SPECIAL":
            mode = .special
            relevantModeIsDecimals = true

        default:
            mode = .special
            relevantModeIsDecimals = true

        }
        
    }
    
    func string(_ number: Double) -> String {
        
        //Regardless of mode we should return zero as zero and not 0.00000 etc.
        if number == 0.0 {
            return String(0)
        }
        
        switch mode {
            
        case .special:

            if abs(number) > smallNumber && abs(number) < largeNumber {

                return decimalFormatter.string(from: NSNumber(value: number)) ?? ""
            } else {

                if lRegisterFlag {
                    return scientificFormatter.string(from: NSNumber(value: number)) ?? ""
                } else {
                    return powerString((scientificFormatter.string(from: NSNumber(value: number)) ?? ""))
                }
                
            }

        case .science:
            
            return scientificFormatter.string(from: NSNumber(value: number)) ?? ""
            
        case .decimal:
            return decimalFormatter.string(from: NSNumber(value: number)) ?? ""
            
        }
        
    }
    
    func powerString(_ myScienceNumber: String) -> String {

        var numberComponents = myScienceNumber.split(separator: "E")
        
        if numberComponents.count <= 1 {
            numberComponents = myScienceNumber.split(separator: "e")
        }
        
        if numberComponents.count <= 1 {
            return myScienceNumber
        }
        
        var finalString = String(numberComponents[0]) + " " + "\u{00D7}" + " " + "10"
        
        let supers = ["0": "\u{2070}" , "1": "\u{00B9}","2": "\u{00B2}","3": "\u{00B3}","4": "\u{2074}","5": "\u{2075}","6": "\u{2076}", "7": "\u{2077}","8": "\u{2078}","9": "\u{2079}"]

        
        let flatPowerString = String(numberComponents[1]).map( {String($0) })
        
        for char in flatPowerString {
            finalString += supers[char] ?? "\u{207B}"
        }
            
        return finalString
        
    }

}


