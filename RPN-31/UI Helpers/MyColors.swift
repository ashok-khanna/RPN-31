import Foundation
import SwiftUI

struct MyColors {
        
    func background(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.black) }
        else { return Color(UIColor.lightGray.lighter(by: 90.0)) }
    }
    
    func specialBackground(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.systemPink) }
        else { return Color(UIColor.systemPink) }
    }
    
    func stackRegisters(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.darkGray.darker(by: 75.0)) }
        else { return Color(UIColor.darkGray.darker(by: 75.0)) }
    }
    
    func text(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.white) }
        else { return Color(UIColor.black) }
    }
    
    func lText(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.gray) }
        else { return Color(UIColor.darkGray) }
    }
    
    func stackText(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.white) }
        else { return Color(UIColor.white) }
    }
    
    func functionDisplayText(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.orange) }
        else { return Color(UIColor.systemTeal) }
    }
    
    func specialBackgroundText(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.white) }
        else { return Color(UIColor.white) }
    }
    
    
    func topRowButton(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.lightGray) }
        else { return Color(UIColor.darkGray) }
    }
    
    func topRowShortPress(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.lightGray.lighter(by: 25.0)) }
        else { return Color(UIColor.darkGray.lighter(by: 25.0)) }
    }
    
    func topRowButtonText(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.black) }
        else { return Color(UIColor.white) }
    }
    
    func mainButton(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.darkGray) }
        else { return Color(UIColor.gray) }
    }
    
    func mainShortPress(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.lightGray) }
        else { return Color(UIColor.darkGray) }
    }
    
    func mainLongPress(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.orange) }
        else { return Color(UIColor.blue) }
    }
    
    func mainButtonText(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.white) }
        else { return Color(UIColor.black) }
    }
    
    func brightButton(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.orange) }
        else { return Color(UIColor.blue) }
    }
    
    func brightShortPress(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.orange.lighter(by: 37.5)) }
        else { return Color(UIColor.blue.lighter(by: 37.5)) }
    }
    
    func brightButtonText(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.white) }
        else { return Color(UIColor.white) }
    }
    
    func advanceButton(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.orange) }
        else { return Color(UIColor.blue) }
    }
    
    func advanceHighlight(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.lightGray) }
        else { return Color(UIColor.lightGray) }
    }
    
    func advanceShortPress(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.orange.lighter(by: 37.5)) }
        else { return Color(UIColor.blue.lighter(by: 37.5)) }
    }
    
    func advanceOutline(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.orange.lighter(by: 37.5)) }
        else { return Color(UIColor.blue.lighter(by: 37.5)) }
    }
    
    func advanceButtonText(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.white) }
        else { return Color(UIColor.white) }
    }
    
    func advanceOutlineText(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.white) }
        else { return Color(UIColor.black) }
    }
    
    func storeRecall(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.systemBlue) }
        else { return Color(UIColor.systemTeal) }
    }
    
    func storeRecallHighlight(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.systemBlue.lighter(by: 25.0)) }
        else { return Color(UIColor.systemTeal.lighter(by: 25.0)) }
    }
    
    func deleteHighlight(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.systemRed) }
        else { return Color(UIColor.systemRed) }
    }
    
    func formatButton(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.systemPink) }
        else { return Color(UIColor.green) }
    }
    
    func formatButtonOutline(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.darkGray) }
        else { return Color(UIColor.darkGray) }
    }
    
    func formatButtonText(_ darkMode: Bool) -> Color {
        if darkMode { return Color(UIColor.white) }
        else { return Color(UIColor.white) }
    }
    
}


extension UIColor {
    /**
     Create a ligher color
     */
    func lighter(by percentage: CGFloat = 30.0) -> UIColor {
        return self.adjustBrightness(by: abs(percentage))
    }
    
    /**
     Create a darker color
     */
    func darker(by percentage: CGFloat = 30.0) -> UIColor {
        return self.adjustBrightness(by: -abs(percentage))
    }
    
    /**
     Try to increase brightness or decrease saturation
     */
    func adjustBrightness(by percentage: CGFloat = 30.0) -> UIColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        if self.getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
            if b < 1.0 {
                let newB: CGFloat = max(min(b + (percentage/100.0)*b, 1.0), 0.0)
                return UIColor(hue: h, saturation: s, brightness: newB, alpha: a)
            } else {
                let newS: CGFloat = min(max(s - (percentage/100.0)*s, 0.0), 1.0)
                return UIColor(hue: h, saturation: newS, brightness: b, alpha: a)
            }
        }
        return self
    }
}
