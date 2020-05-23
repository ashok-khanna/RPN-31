import SwiftUI

struct AdvanceButton: View {

    @EnvironmentObject var dataRouter: DataRouter

    @State var width: CGFloat
    @State var height: CGFloat
    @State var bgColor: Color
    @State var bgColor1: Color
    @State var calculatorButton: CalculatorButton
    
    @Binding var isPresented: Bool

    @GestureState var longPress = false
    @GestureState var longDrag = false

    
    @State private var feedback = UISelectionFeedbackGenerator()
    @State private var impactMed = UIImpactFeedbackGenerator(style: .light)
    
    var body: some View {
        
        let longPressGestureDelay = DragGesture(minimumDistance: 0)
            .updating($longDrag) { currentstate, gestureState, transaction in
                    gestureState = true
            }
        .onEnded { value in
            // print(value.translation) We can use value.translation to see how far away our finger moved and accordingly cancel the action (code not shown here)
           
            if self.calculatorButton.operatorString == "STORE/RECALL" {
                self.dataRouter.exitStoreRecallMode()
            } else if self.dataRouter.storeRecall {
                if (self.calculatorButton.digitString != "0" && self.calculatorButton.digitString != ".") {
                    self.dataRouter.deleteStoreRecall(self.calculatorButton.digitString)
                }
            } else {
                switch self.calculatorButton.operatorString {
                case "HELP":
                    self.dataRouter.helpPage = true
                case "ADV":
                    self.isPresented = true
                default:
                    self.dataRouter.calculator.processOperation(self.calculatorButton.operatorString)

                }
            }
            
            self.dataRouter.digitColorArray[Int(self.calculatorButton.digitValue)] = self.dataRouter.darkButtonColor
            
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
            self.dataRouter.digitColorArray[Int(self.calculatorButton.digitValue)] = self.dataRouter.lightButtonColor
            self.impactMed.impactOccurred()
            
            if self.calculatorButton.operatorString == "STORE/RECALL" {
                self.dataRouter.startStoreRecallMode()
            }
            
        }
        
        let tapBeforeLongGestures = longTapGesture.sequenced(before:longPressGestureDelay).exclusively(before: shortPressGesture)
        
        return
            
            VStack {
                Text(self.calculatorButton.digitString)
                    .font(self.dataRouter.digitFont)
                    .foregroundColor(self.dataRouter.darkTextColor)
                    .fixedSize()
                    .padding(0)
                Text(self.calculatorButton.operatorString)
                    .font(self.dataRouter.captionFont)
                    .foregroundColor(self.dataRouter.darkTextColor)
                    .fixedSize()
                    .padding(0)
                }
                .frame(width: width, height: height)
                .background(self.longPress ? self.dataRouter.lightButtonColor : (self.longDrag ? self.dataRouter.brightButtonColor : self.dataRouter.digitColorArray[Int(self.calculatorButton.digitValue)]))
                .cornerRadius(15)
                .gesture(tapBeforeLongGestures)

        }
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        print("okay")
    }
        
    }

struct OperatorButton: View {

@EnvironmentObject var dataRouter: DataRouter

@State var operatorString: String
@State var bgColor: Color
@State var bgColor1: Color
@State var highlightColor: Color
@State var fontColor: Color
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
        print(value.translation) // We can use value.translation to see how far away our finger moved and accordingly cancel the action (code not shown here)
       
        if self.operatorString == "ENTER" {
            self.dataRouter.calculator.processEnter()
        } else if self.operatorString == "CLR" {
            self.dataRouter.calculator.clearStack()
            self.dataRouter.calculator.clearLastRegisters()

        } else {
            self.dataRouter.calculator.processOperation(self.operatorString)

        }
        
        self.bgColor = self.bgColor1

        
    }
    
    let shortPressGesture = LongPressGesture(minimumDuration: 0)
    .onEnded { _ in
        
        if self.operatorString == "ENTER" {
            self.dataRouter.calculator.processEnter()
        } else if self.operatorString == "CLR" {
            self.dataRouter.calculator.clearLast()
        } else {
            self.dataRouter.calculator.processOperation(self.operatorString)

        }
        
    }
    
    let longTapGesture = LongPressGesture(minimumDuration: 0.25)
        .updating($longPress) { currentstate, gestureState, transaction in
            gestureState = true
    }
    .onEnded { _ in
        self.bgColor = self.highlightColor
    }
    
    let tapBeforeLongGestures = longTapGesture.sequenced(before:longPressGestureDelay).exclusively(before: shortPressGesture)
    
    return
        
        VStack {
            Text(self.operatorString)
                .font(self.font)
                .foregroundColor(self.fontColor)
                .fixedSize()
                .padding(0)
            }
            .frame(width: width, height: height)
        .background(self.longPress ? self.highlightColor : (self.longDrag ? self.highlightColor : self.bgColor))
            .cornerRadius(15)
            .gesture(tapBeforeLongGestures)

    }
    
}
