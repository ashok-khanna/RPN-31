//
//  OperatorButton.swift
//  RPN-31
//
//  Created by Ashok Khanna on 24/5/20.
//  Copyright © 2020 Ashok Khanna. All rights reserved.
//

import Foundation
import SwiftUI

struct AdvanceButton2: View {

@EnvironmentObject var dataRouter: DataRouter
    
@State var buttonText: String
@State var width: CGFloat
@State var height: CGFloat
@Binding var presentFunctionPage: Bool
@Binding var presentButtonConfigurator: Bool
@Binding var presentGuidePage: Bool

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
            case "Button Configurator":
                self.presentButtonConfigurator = true
            case "HELP":
                self.presentGuidePage = true
            case "ALT":
                self.dataRouter.altFunctions.toggle()
            case "Copy":
                self.dataRouter.calculator.copyToClipboard()
                self.presentFunctionPage = false
            case "Paste":
                self.dataRouter.calculator.pasteFromClipboard()
                self.presentFunctionPage = false
            case "EXIT":
                self.presentFunctionPage = false
            default:
                break
            }
            
        }
        
        self.bgColor = self.bgColor1

        
    }
    
    let shortPressGesture = LongPressGesture(minimumDuration: 0)
    .onEnded { _ in
        
        switch self.buttonText {
        case "Button Configurator":
            self.presentButtonConfigurator = true
        case "HELP":
            self.presentGuidePage = true
        case "ALT":
            self.dataRouter.altFunctions.toggle()
        case "Copy":
            self.dataRouter.calculator.copyToClipboard()
            self.presentFunctionPage = false
        case "Paste":
            self.dataRouter.calculator.pasteFromClipboard()
            self.presentFunctionPage = false
        case "EXIT":
            self.presentFunctionPage = false
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
            
            Spacer()
            
            if self.buttonText == "Copy" {
                Image(systemName:"doc.on.doc.fill")
                .foregroundColor(self.dataRouter.myColors.brightButtonTextColor)
                    .font(self.dataRouter.myFonts.subPageImageFont)
            } else if self.buttonText == "Paste" {
                Image(systemName:"doc.richtext")
                    .foregroundColor(self.dataRouter.myColors.brightButtonTextColor)
                    .font(self.dataRouter.myFonts.subPageImageFont)
            }
                        
            Text(self.buttonText)
                .font(self.dataRouter.myFonts.textFont)
                .foregroundColor(self.dataRouter.myColors.brightButtonTextColor)
                .fixedSize()
                .padding(0)
            
            Spacer()
                        
            }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(self.longPress ? self.highlightColor : self.bgColor)
        .cornerRadius(self.dataRouter.mySizes.cornerRadius)
            .gesture(tapBeforeLongGestures)

    }
    
}


