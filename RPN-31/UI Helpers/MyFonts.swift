import SwiftUI

struct MyFonts {
    
    let xRegisterFont: Font
    let yRegisterFont: Font
    let lRegisterFont: Font
    let sRegisterFont: Font
    let digitFont: Font
    let textFont: Font
    let captionFont: Font
    let subPageTitleFont: Font
    let subPageImageFont: Font
    let subPageTextFont: Font
    let subPageHeaderFont: Font
    
    init (_ iPad: Bool){
        
        if iPad {
            
              xRegisterFont = Font.largeTitle
              yRegisterFont = Font.title
              lRegisterFont = Font.headline
              sRegisterFont = Font.body
              digitFont = Font.largeTitle
              textFont = Font.headline
              captionFont = Font.caption
              subPageTitleFont = Font.title
            subPageHeaderFont = Font.headline
              subPageImageFont = Font.body
              subPageTextFont = Font.body
            
        } else {
            
            xRegisterFont = Font.largeTitle
            yRegisterFont = Font.title
            lRegisterFont = Font.headline
            sRegisterFont = Font.body
            digitFont = Font.title
            textFont = Font.headline
            captionFont = Font.caption
            subPageTitleFont = Font.title
            subPageHeaderFont = Font.headline
            subPageImageFont = Font.body
            subPageTextFont = Font.body
            
        }
        
    }
    
    
    
}
