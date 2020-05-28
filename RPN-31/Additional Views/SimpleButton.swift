//
//  OperatorButton.swift
//  RPN-31
//
//  Created by Ashok Khanna on 24/5/20.
//  Copyright © 2020 Ashok Khanna. All rights reserved.
//

import Foundation
import SwiftUI

struct SimpleButton: View {

@EnvironmentObject var dataRouter: DataRouter
    
@State var buttonText: String
@State var width: CGFloat
@State var height: CGFloat

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
       
        if(abs(value.translation.width) < (self.width * self.dataRouter.mySizes.hitBox) && abs(value.translation.height) < (self.height * self.dataRouter.mySizes.hitBox)) {
            
            switch self.buttonText {
            case "Reset to Defaults":
                self.dataRouter.buttonList = self.dataRouter.defaultButtonList
                self.dataRouter.defaults.set(self.dataRouter.buttonList, forKey: "SavedButtonList")
            case "Reset Stack Registers":
                self.dataRouter.calculator.stackRegisters = self.dataRouter.defaults.array(forKey: "tempStackRegisterStore") as! [Double]
            default:
                break
            }
            
        }
        
        self.bgColor = self.bgColor1

        
    }
    
    let shortPressGesture = LongPressGesture(minimumDuration: 0)
    .onEnded { _ in
        
        switch self.buttonText {
             case "Reset to Defaults":
                 self.dataRouter.buttonList = self.dataRouter.defaultButtonList
                 self.dataRouter.defaults.set(self.dataRouter.buttonList, forKey: "SavedButtonList")
            case "Reset Stack Registers":
                          self.dataRouter.calculator.stackRegisters = self.dataRouter.defaults.array(forKey: "tempStackRegisterStore") as! [Double]
            
             default:
                 break
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
        
        HStack {
                        
            Text(self.buttonText)
                .font(self.dataRouter.myFonts.textFont)
                .foregroundColor(self.dataRouter.myColors.secondarySpecialTextColor)
                .fixedSize()
                .padding(0)
            }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(self.longPress ? self.highlightColor : self.bgColor)
        .cornerRadius(self.dataRouter.mySizes.cornerRadius)
        .gesture(tapBeforeLongGestures)

    }
    
}


