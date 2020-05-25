import SwiftUI

struct StackButton: View {
    
    @EnvironmentObject var dataRouter: DataRouter
    
    @State var width: CGFloat
    @State var height: CGFloat

    
    @State var bgColor1: Color
    
    @Binding var presentStackRegister: Bool
    
    @GestureState var longPress = false
    @GestureState var longDrag = false
    
    var body: some View {
        
        let longPressGestureDelay = DragGesture(minimumDistance: 0)
            .updating($longDrag) { currentstate, gestureState, transaction in
                gestureState = true
        }
        .onEnded { value in
            if(abs(value.translation.width) < (self.width * CGFloat(0.75)) && abs(value.translation.height) < (self.height * CGFloat(0.75))) {
            self.presentStackRegister = true
            }
            
            self.bgColor1 = self.dataRouter.myColors.stackRegisters(self.dataRouter.darkMode)
            
        }
        
        let shortPressGesture = LongPressGesture(minimumDuration: 0)
            .onEnded { _ in
                
                self.dataRouter.calculator.stackRegisters.append(0.0)
                
                if self.dataRouter.calculator.stackRegisters[0] == 0.0 {
                    self.dataRouter.calculator.stackRegisters.removeFirst()
                    self.dataRouter.calculator.stackRegisters.append(0.0)
                }
                self.dataRouter.calculator.stackRegisters.removeFirst()
                
        }
        
        let longTapGesture = LongPressGesture(minimumDuration: 0.25)
            .updating($longPress) { currentstate, gestureState, transaction in
                gestureState = true
        }
        .onEnded { _ in
             self.bgColor1 = self.dataRouter.myColors.mainButton(self.dataRouter.darkMode)
                
            }
            
        
        let tapBeforeLongGestures = longTapGesture.sequenced(before:longPressGestureDelay).exclusively(before: shortPressGesture)
        
        return
            
            VStack {
                
                Spacer()
                
                Text(self.dataRouter.displayFormatter.string(self.dataRouter.calculator.stackRegisters[4]))
                    .font(.footnote)
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
                    .foregroundColor(self.dataRouter.myColors.stackText(self.dataRouter.darkMode))
                    .frame(width: self.width * CGFloat(0.8))
                    .padding(0)
                
                Spacer()
                
                Text(self.dataRouter.displayFormatter.string(self.dataRouter.calculator.stackRegisters[3]))
                    .font(.footnote)
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
                    .foregroundColor(self.dataRouter.myColors.stackText(self.dataRouter.darkMode))
                    .frame(width: self.width * CGFloat(0.8))
                    .padding(0)
                
                Spacer()
                
                Text(self.dataRouter.displayFormatter.string(self.dataRouter.calculator.stackRegisters[2]))
                    .font(.footnote)
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
                    .foregroundColor(self.dataRouter.myColors.stackText(self.dataRouter.darkMode))
                    .frame(width: self.width * CGFloat(0.8))
                    .padding(0)
                
                Spacer()
                
            }
            .frame(width: self.width, height: self.height)
    .background(self.longPress ? self.dataRouter.myColors.mainButton(self.dataRouter.darkMode) : (self.longDrag ? self.dataRouter.myColors.brightButton(self.dataRouter.darkMode) : self.bgColor1))
            .cornerRadius(7.5)
            .gesture(tapBeforeLongGestures)
        
    }
    
    
}








