import Foundation
import SwiftUI


struct MyColors {
    
    var primaryBackgroundColor: Color
    var lighterBackgroundColor: Color
    var secondaryBackgroundColor: Color
    var sRegistersBackgroundColor: Color
    var sRegistersTextColor: Color
    var mainTextColor: Color
    var lRegisterTextColor: Color
    var functionDisplayTextColor: Color
    
    var secondaryButtonColor: Color
    var secondaryShortPressColor: Color
    var secondaryLongPressColor: Color
    var secondaryButtonTextColor: Color
    
    var mainButtonColor: Color
    var mainShortPressColor: Color
    var mainLongPressColor: Color
    var mainButtonTextColor: Color
    
    var brightButtonColor: Color
    var brightShortPressColor: Color
    var brightLongPressColor: Color
    var brightButtonTextColor: Color
    
    var storeRecallMainColor: Color
    var storeRecallHighlightColor: Color
    var deleteHighlightColor: Color
    
    var specialFillColor: Color
    var specialFillTextColor: Color
    var secondarySpecialFillColor: Color
    var secondarySpecialTextColor: Color
    
    var primarySubPageTitleColor: Color
    var primarySubPageTextColor: Color
    var primarySubPageHeaderColor: Color
    var secondarySubPageTitleColor: Color
    var secondarySubPageTextColor: Color
    var secondarySubPageHeaderColor: Color
    
    var sliderBackgroundColor: Color
    var sliderPrimaryColor: Color
    var sliderTextColor: Color
    
    var purpleButtonColor: Color
    
    init() {
        
        secondaryBackgroundColor = Color(UIColor.white)
        lighterBackgroundColor = Color(UIColor.darkGray.darker(by: 75.0))
        purpleButtonColor = Color(UIColor.systemPurple)
    
        primaryBackgroundColor = Color(UIColor.black)

        sRegistersBackgroundColor = Color(UIColor.black)
        sRegistersTextColor = Color(UIColor.white)
        mainTextColor = Color(UIColor.white)
        lRegisterTextColor = Color(UIColor.gray)
        functionDisplayTextColor = Color(UIColor.orange)
        
        secondaryButtonColor = Color(UIColor.lightGray).opacity(0.75)
        secondaryShortPressColor = Color(UIColor.lightGray.lighter(by: 25.0))
        secondaryLongPressColor = Color(UIColor.lightGray.lighter(by: 25.0))
        secondaryButtonTextColor = Color(UIColor.black)
        
        mainButtonColor = Color(UIColor.darkGray).opacity(0.5)
        mainShortPressColor = Color(UIColor.lightGray)
        mainLongPressColor = Color(UIColor.orange)
        mainButtonTextColor = Color(UIColor.white)
        
        brightButtonColor = Color(UIColor.orange).opacity(0.75)
        brightShortPressColor = Color(UIColor.orange.lighter(by: 37.5))
        brightLongPressColor = Color(UIColor.orange.lighter(by: 37.5))
        brightButtonTextColor = Color(UIColor.white)
        
        storeRecallMainColor = Color(UIColor.systemBlue)
        storeRecallHighlightColor = Color(UIColor.systemBlue.lighter(by: 25.0))
        deleteHighlightColor = Color(UIColor.systemRed)
        
        specialFillColor = Color(UIColor.systemPink)
        specialFillTextColor = Color(UIColor.white)
        secondarySpecialFillColor = Color(UIColor.systemRed)
        secondarySpecialTextColor = Color(UIColor.white)
        
        primarySubPageTitleColor = Color(UIColor.white)
        primarySubPageTextColor = Color(UIColor.white)
        primarySubPageHeaderColor = Color(UIColor.white)
        secondarySubPageTitleColor = Color(UIColor.black)
        secondarySubPageTextColor = Color(UIColor.black)
        secondarySubPageHeaderColor = Color(UIColor.white)
        
        sliderBackgroundColor = Color(UIColor.gray)
        sliderPrimaryColor = Color(UIColor.systemRed)
        sliderTextColor = Color(UIColor.white)
        
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
