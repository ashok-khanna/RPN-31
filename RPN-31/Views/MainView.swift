//
//  ContentView.swift
//  TimeTracker
//
//  Created by Ashok Khanna on 8/5/20.
//  Copyright © 2020 Ashok Khanna. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var dataRouter: DataRouter
    @State var showFunction: Bool = false

        var body: some View {

            GeometryReader { geometry in
                
                ZStack {
                    
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    
                    
                    VStack(spacing: 0) {
                    
                        Spacer()
                        
                        HStack(spacing: 0) {
                            
                            VStack(spacing: 0) {
                                
                                Spacer()
                                
                                Text(self.dataRouter.yRegisterFormatter.string(from: NSNumber(value: self.dataRouter.calculator.stackRegisters[1]))!)
                                    .font(.title)
                                    .foregroundColor(Color.white)
                                    .frame(width: geometry.size.width * CGFloat(0.6), alignment: .leading)
                                .onTapGesture {
                                    self.dataRouter.calculator.swapXY()
                                }
                                                                
                                Text(self.dataRouter.calculator.lastRegister.displayText)
                                    .font(.headline)
                                    .foregroundColor(Color.gray)
                                    .frame(width: geometry.size.width * CGFloat(0.6), alignment: .leading)
                                .onTapGesture {
                                    self.dataRouter.calculator.reverseOperation()
                                }
                                
                                Spacer()
                                
                            }

                            
                            
                            VStack {
                                                               
                                Spacer()
                                
                                Text(self.dataRouter.sRegisterFormatter.string(from: NSNumber(value: self.dataRouter.calculator.stackRegisters[4]))!)
                                    .font(.footnote)
                                    .foregroundColor(self.dataRouter.stackRegisterTextColor)
                                    .fixedSize()
                                    .padding(0)
                                
                                Spacer()
                                
                                Text(self.dataRouter.sRegisterFormatter.string(from: NSNumber(value: self.dataRouter.calculator.stackRegisters[3]))!)
                                     .font(.footnote)
                                    .foregroundColor(self.dataRouter.stackRegisterTextColor)
                                    .fixedSize()
                                    .padding(0)
                                
                                Spacer()
                                
                                Text(self.dataRouter.sRegisterFormatter.string(from: NSNumber(value: self.dataRouter.calculator.stackRegisters[2]))!)
                                    .font(.footnote)
                                    .foregroundColor(self.dataRouter.stackRegisterTextColor)
                                    .fixedSize()
                                    .padding(0)
                                
                                Spacer()

                            }
                            .frame(width: geometry.size.width * CGFloat (0.3), height: geometry.size.height * CGFloat(0.125))
                            .background(self.dataRouter.stackRegisterColor)
                            .cornerRadius(7.5)

                            
 

                            
                        }
                        
                        
                        Spacer()
                        
                        Text(self.showFunction ? "Test" : self.dataRouter.xRegisterFormatter.string(from: NSNumber(value: self.dataRouter.calculator.stackRegisters[0]))!)
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                            .frame(width: geometry.size.width)
                        .onTapGesture {
                            self.dataRouter.calculator.deleteInput()
                        }
                        
                        Rectangle()
                            .frame(width: geometry.size.width, height: geometry.size.height * CGFloat(0.035))
                        
                        ButtonGridView()
                           .frame(width: geometry.size.width, height: geometry.size.height * self.dataRouter.gridHeight)
                        
                        Rectangle()
                            .frame(width: geometry.size.width, height: geometry.size.height * CGFloat(0.015))
                                        
                        
                    }
                }
            }
            
}
}


/*

Dimension Calculator:

1. We will take a full width for buttons
2. We want each button to be a square
3. We want the space between each button to be consistent (both gaps between buttons on a row and between buttons on a column)
4. Grid of butons is 4 (rows) x 5 (columns) and there are 5 gaps for each row and 4 gaps for each column (we count the outer edges for the rows, but not for the columns, the latter only to reduce the number of views in ButtonGridView)
5. Let us set the gap width as 1/8th of a button
6. Therefore each screen width will have 4.625 "button widths" and each screen height will have 5.75 "button widths"
7. Therefore we set height to 5.75 / 4.625 of width
8. However, to allow us to change the gap width, let us set the gap width as a constant g, so that height = (5 + 6g)/(4 + 5g) of width
9. Of course we can also make the number of rows and columns constants, which we do in the above
10. But because Swift had some i


*/
