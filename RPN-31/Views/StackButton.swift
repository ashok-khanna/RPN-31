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
            if(abs(value.translation.width) < (self.width * self.dataRouter.mySizes.hitBox) && abs(value.translation.height) < (self.height * self.dataRouter.mySizes.hitBox)) {
            self.presentStackRegister = true
            }
            
            self.bgColor1 = self.dataRouter.myColors.sRegistersBackgroundColor
            
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
             self.bgColor1 = self.dataRouter.myColors.mainButtonColor
                
            }
            
        
        let tapBeforeLongGestures = longTapGesture.sequenced(before:longPressGestureDelay).exclusively(before: shortPressGesture)
        
        return
            
            VStack(alignment: .trailing) {
                
                Spacer()
                    
                Text(self.dataRouter.displayFormatter.string(self.dataRouter.calculator.stackRegisters[4]))
                        .font(self.dataRouter.myFonts.sRegisterFont)
                        .minimumScaleFactor(0.01)
                        .lineLimit(1)
                        .foregroundColor(self.dataRouter.myColors.sRegistersTextColor)
                        .frame(width: self.width * CGFloat(0.8), alignment: .trailing)
                        .padding(.leading, self.dataRouter.mySizes.textPadding)

                Spacer()
                
                Text(self.dataRouter.displayFormatter.string(self.dataRouter.calculator.stackRegisters[3]))
                    .font(self.dataRouter.myFonts.sRegisterFont)
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
                    .foregroundColor(self.dataRouter.myColors.sRegistersTextColor)
                    .frame(width: self.width * CGFloat(0.8), alignment: .trailing)
                    .padding(.leading, self.dataRouter.mySizes.textPadding)
                
                Spacer()
                
                Text(self.dataRouter.displayFormatter.string(self.dataRouter.calculator.stackRegisters[2]))
                    .font(self.dataRouter.myFonts.sRegisterFont)
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
                    .foregroundColor(self.dataRouter.myColors.sRegistersTextColor)
                    .frame(width: self.width * CGFloat(0.8), alignment: .trailing)
                    .padding(.leading, self.dataRouter.mySizes.textPadding)

                Spacer()
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(self.longPress ? self.dataRouter.myColors.mainButtonColor : (self.longDrag ? self.dataRouter.myColors.brightButtonColor : self.bgColor1))
            .cornerRadius(7.5)
            .gesture(tapBeforeLongGestures)
        
    }
    
    
}








