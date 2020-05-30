import SwiftUI

struct MainButton: View {

    @EnvironmentObject var dataRouter: DataRouter
    @State var width: CGFloat
    @State var height: CGFloat
    @State var calculatorButton: CalculatorButton
    
    @Binding var presentFunctionPage: Bool
    @Binding var presentHelpPage: Bool

    @GestureState var longPress = false
    @GestureState var longDrag = false
    
    var body: some View {
        
        let longPressGestureDelay = DragGesture(minimumDistance: 0)
            .updating($longDrag) { currentstate, gestureState, transaction in
                    gestureState = true
            }
        .onEnded { value in
            
            if(abs(value.translation.width) < (self.width * self.dataRouter.mySizes.hitBox) && abs(value.translation.height) < (self.height * self.dataRouter.mySizes.hitBox)) {
                if self.calculatorButton.operatorString == "STORE/RECALL" {
                     self.dataRouter.exitStoreRecallMode()
                 } else if self.dataRouter.storeRecall {
                     if (self.calculatorButton.digitString != "0" && self.calculatorButton.digitString != ".") {
                         self.dataRouter.longPressStoreRecall(self.calculatorButton.digitString)
                     }
                 } else {
                     switch self.calculatorButton.operatorString {
                     case "HELP":
                         self.presentHelpPage = true
                     case "ADV":
                        self.dataRouter.altFunctions = false
                         self.presentFunctionPage = true
                     default:
                         if self.calculatorButton.digitValue < 5.0 {
                             self.dataRouter.calculator.processOperation(self.dataRouter.buttonList[Int(self.calculatorButton.digitValue - 1.0)])
                         } else {
                             self.dataRouter.calculator.processOperation(self.dataRouter.buttonList[Int(self.calculatorButton.digitValue - 2.0)])
                         }
                     }
                 }
            }
            
                if self.calculatorButton.operatorString == "STORE/RECALL" {
                    self.dataRouter.exitStoreRecallMode()
                }
            
            self.dataRouter.calculator.showFunction = false
            self.dataRouter.calculator.functionText = ""
            
            self.dataRouter.digitColorArray[Int(self.calculatorButton.digitValue)] = self.dataRouter.myColors.mainButtonColor
            
        }
        
        let shortPressGesture = LongPressGesture(minimumDuration: 0)
        .onEnded { _ in
                        
            if self.dataRouter.storeRecall {
                if (self.calculatorButton.digitString != "0" && self.calculatorButton.digitString != ".") {
                    self.dataRouter.processStoreRecall(self.calculatorButton.digitString)
                }
            } else {
                self.dataRouter.calculator.processDigit(self.calculatorButton)
            }
            
        }
        
        let longTapGesture = LongPressGesture(minimumDuration: 0.25)
            .updating($longPress) { currentstate, gestureState, transaction in
                gestureState = true
        }
        .onEnded { _ in
            self.dataRouter.digitColorArray[Int(self.calculatorButton.digitValue)] = self.dataRouter.digitHighlightArray[Int(self.calculatorButton.digitValue)]
            
            if self.calculatorButton.operatorString == "STORE/RECALL" {
                self.dataRouter.startStoreRecallMode()
            }
            
            self.dataRouter.calculator.showFunction = true
            if self.dataRouter.buttonList.contains(self.calculatorButton.operatorString) {
                if self.calculatorButton.digitValue <= 5.0 {
                    self.dataRouter.calculator.functionText = self.dataRouter.buttonList[Int(self.calculatorButton.digitValue - 1.0)]
                } else {
                    self.dataRouter.calculator.functionText = self.dataRouter.buttonList[Int(self.calculatorButton.digitValue - 2.0)]
                }
            } else {
                
                self.dataRouter.calculator.functionText = self.calculatorButton.operatorString

                
            }
            
        }
        
        let tapBeforeLongGestures = longTapGesture.sequenced(before:longPressGestureDelay).exclusively(before: shortPressGesture)
        
        return
            
            VStack {
                Text(self.calculatorButton.digitString)
                    .font(self.dataRouter.myFonts.digitFont)
                    .foregroundColor(self.dataRouter.myColors.mainButtonTextColor)
                    .fixedSize()
                    .padding(0)
                Text(self.dataRouter.buttonList.contains(self.calculatorButton.operatorString) ? (self.calculatorButton.digitValue <= 5 ? self.dataRouter.buttonList[Int(self.calculatorButton.digitValue - 1.0)] : self.dataRouter.buttonList[Int(self.calculatorButton.digitValue - 2.0)]) : self.calculatorButton.operatorString)
                    .font(self.dataRouter.myFonts.captionFont)
                    .foregroundColor(self.dataRouter.myColors.mainButtonTextColor)
                    .fixedSize()
                    .padding(0)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                //.frame(width: width, height: height)
                .background(self.longPress ? self.dataRouter.digitHighlightArray[Int(self.calculatorButton.digitValue)] : (self.longDrag ? self.dataRouter.digitBrightArray[Int(self.calculatorButton.digitValue)] : self.dataRouter.digitColorArray[Int(self.calculatorButton.digitValue)]))
                .cornerRadius(self.dataRouter.mySizes.cornerRadius)
                .gesture(tapBeforeLongGestures)

        }
    
        
    }








