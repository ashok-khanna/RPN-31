/* Status: Completed */

import Foundation
import SwiftUI

struct FormatButton: View {
    
    let defaults = UserDefaults.standard
    
    @EnvironmentObject var dataRouter: DataRouter
    
    @State var operatorString: String
    @State var font: Font
    @State var width: CGFloat
    @State var height: CGFloat
    
    @GestureState var longPress = false
    @GestureState var longDrag = false
    
    var body: some View {
        
        let longPressGestureDelay = DragGesture(minimumDistance: 0)
            .updating($longDrag) { currentstate, gestureState, transaction in
                gestureState = true
        }
        .onEnded { value in
            if(abs(value.translation.width) < (self.width * self.dataRouter.mySizes.hitBox) && abs(value.translation.height) < (self.height * self.dataRouter.mySizes.hitBox)) {
                
                self.defaults.set(self.operatorString, forKey: "displayMode")
                self.dataRouter.displayFormatter.rebuild()
            }
            
        }
        
        let shortPressGesture = LongPressGesture(minimumDuration: 0)
            .onEnded { _ in
                
                self.defaults.set(self.operatorString, forKey: "displayMode")
                self.dataRouter.displayFormatter.rebuild()
                
        }
        
        let longTapGesture = LongPressGesture(minimumDuration: 0.25)
            .updating($longPress) { currentstate, gestureState, transaction in
                gestureState = true
        }
        .onEnded { _ in
            
        }
        
        let tapBeforeLongGestures = longTapGesture.sequenced(before:longPressGestureDelay).exclusively(before: shortPressGesture)
        
        return
            
            VStack {
                Text(self.operatorString)
                    .font(self.font)
                    .foregroundColor(self.dataRouter.myColors.mainTextColor)
                    .fixedSize()
                    .padding(0)
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(self.defaults.string(forKey: "displayMode") == self.operatorString ? self.dataRouter.myColors.specialFillColor : self.dataRouter.myColors.lighterBackgroundColor)
            .cornerRadius(self.dataRouter.mySizes.cornerRadius)
            .gesture(tapBeforeLongGestures)
        
    }
}
