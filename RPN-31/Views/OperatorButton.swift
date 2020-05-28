//
//  OperatorButton.swift
//  RPN-31
//
//  Created by Ashok Khanna on 24/5/20.
//  Copyright © 2020 Ashok Khanna. All rights reserved.
//

import Foundation
import SwiftUI

struct OperatorButton: View {

@EnvironmentObject var dataRouter: DataRouter

@State var operatorString: String
@State var bgColor: Color
@State var bgColor1: Color
@State var highlightColor: Color
@State var highlightColor2: Color
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
        if(abs(value.translation.width) < (self.width * self.dataRouter.mySizes.hitBox) && abs(value.translation.height) < (self.height * self.dataRouter.mySizes.hitBox)) {
        if self.operatorString == "ENTER" {
            self.dataRouter.calculator.processEnter()
        } else if self.operatorString == "CLR" {
            self.dataRouter.calculator.clearStack()
            self.dataRouter.calculator.clearLastRegisters()

        } else {
            self.dataRouter.calculator.processOperation(self.operatorString)
        }
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
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            //.frame(width: width, height: height)
        .background(self.longPress ? self.highlightColor : (self.longDrag ? self.highlightColor2 : self.bgColor))
            .cornerRadius(self.dataRouter.mySizes.cornerRadius)
            .gesture(tapBeforeLongGestures)

    }
    
}
