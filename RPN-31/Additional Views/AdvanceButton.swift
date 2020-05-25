//
//  OperatorButton.swift
//  RPN-31
//
//  Created by Ashok Khanna on 24/5/20.
//  Copyright © 2020 Ashok Khanna. All rights reserved.
//

import Foundation
import SwiftUI

struct AdvanceButton: View {

@EnvironmentObject var dataRouter: DataRouter
    
@State var index: Int
@State var width: CGFloat
@State var height: CGFloat
@Binding var presentFunctionPage: Bool

@State var bgColor: Color
@State var bgColor1: Color
@State var highlightColor: Color


@GestureState var longPress = false
@GestureState var longDrag = false

var body: some View {
    
    let longPressGestureDelay = DragGesture(minimumDistance: 0)
        .updating($longDrag) { currentstate, gestureState, transaction in
                gestureState = true
        }
    .onEnded { value in
        print(value.translation) // We can use value.translation to see how far away our finger moved and accordingly cancel the action (code not shown here)
       
        if(abs(value.translation.width) < (self.width * CGFloat(0.75)) && abs(value.translation.height) < (self.height * CGFloat(0.75))) {
            self.dataRouter.calculator.processOperation(self.dataRouter.buttonList[self.dataRouter.altFunctions ? (self.index + 12) : self.index])
            self.presentFunctionPage = false

        }
        
        self.bgColor = self.bgColor1

        
    }
    
    let shortPressGesture = LongPressGesture(minimumDuration: 0)
    .onEnded { _ in
        
        self.dataRouter.calculator.processOperation(self.dataRouter.buttonList[self.dataRouter.altFunctions ? (self.index + 12) : self.index])
        self.presentFunctionPage = false
        
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
            Text(self.dataRouter.buttonList[self.dataRouter.altFunctions ? (self.index + 12) : self.index])
                .font(self.dataRouter.operatorFont)
                .foregroundColor(self.dataRouter.myColors.advanceButtonText(self.dataRouter.darkMode))
                .fixedSize()
                .padding(0)
            }
        .frame(width: width, height: height)
        .background(self.longPress ? self.highlightColor : self.bgColor)
            .cornerRadius(15)
            .gesture(tapBeforeLongGestures)

    }
    
}


