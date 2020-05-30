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
                
                self.dataRouter.calculator.stackRegisters.insert(self.dataRouter.calculator.lastRegister.lastX, at: 0)
                self.dataRouter.calculator.processOperation(self.dataRouter.calculator.lastRegister.lastOperator)
                
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
                    
                Text(self.dataRouter.calculator.stackRegisters.count > 4 ? self.dataRouter.displayFormatter.string(self.dataRouter.calculator.stackRegisters[4]) : "0")
                        .font(self.dataRouter.myFonts.sRegisterFont)
                        .minimumScaleFactor(self.dataRouter.mySizes.minimumScaleFactor)
                        .lineLimit(1)
                        .foregroundColor(self.dataRouter.myColors.sRegistersTextColor)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
                        //.padding(.leading, self.dataRouter.mySizes.textPadding)

                Spacer()
                
                Text(self.dataRouter.calculator.stackRegisters.count > 3 ? self.dataRouter.displayFormatter.string(self.dataRouter.calculator.stackRegisters[3]) : "0")
                    .font(self.dataRouter.myFonts.sRegisterFont)
                    .minimumScaleFactor(self.dataRouter.mySizes.minimumScaleFactor)
                    .lineLimit(1)
                    .foregroundColor(self.dataRouter.myColors.sRegistersTextColor)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
                    //.padding(.leading, self.dataRouter.mySizes.textPadding)
                
                Spacer()
                
                Text(self.dataRouter.calculator.stackRegisters.count > 2 ? self.dataRouter.displayFormatter.string(self.dataRouter.calculator.stackRegisters[2]) : "0")
                    .font(self.dataRouter.myFonts.sRegisterFont)
                    .minimumScaleFactor(self.dataRouter.mySizes.minimumScaleFactor)
                    .lineLimit(1)
                    .foregroundColor(self.dataRouter.myColors.sRegistersTextColor)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
                   // .padding(.leading, self.dataRouter.mySizes.textPadding)

                Spacer()
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(self.longPress ? self.dataRouter.myColors.mainButtonColor : (self.longDrag ? self.dataRouter.myColors.purpleButtonColor : self.bgColor1))
            .cornerRadius(7.5)
            .gesture(tapBeforeLongGestures)
        
    }
    
    
}








