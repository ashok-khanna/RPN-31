//
//  ContentView.swift
//  RPN-31
//
//  Created by Ashok Khanna on 16/5/20.
//  Copyright © 2020 Ashok Khanna. All rights reserved.
//

import SwiftUI

struct SecondRowView: View {
    
    var cellLength = CGFloat(0.15079)
    var gapWidth = CGFloat(0.07937)
    
    var body: some View {
        
        GeometryReader { geometry in
            
            HStack(spacing: 0) {

                Rectangle()
                    .frame(width: geometry.size.width * self.gapWidth, height: geometry.size.height)
                
                Button(action: {
                    
                }) {
                    Text("CLR")
                        .font(.footnote)
                        .foregroundColor(Color.white)
                }
                .frame(width: geometry.size.width * self.cellLength, height: geometry.size.height)
                .background(Color.gray)
                .cornerRadius(10.0)
                
                Rectangle()
                    .frame(width: geometry.size.width * self.gapWidth, height: geometry.size.height)
                
                Button(action: {
                    
                }) {
                    Text("CHS")
                        .font(.footnote)
                        .foregroundColor(Color.white)
                }
                .frame(width: geometry.size.width * self.cellLength, height: geometry.size.height)
                .background(Color.gray)
                .cornerRadius(10.0)
                
                Rectangle()
                    .frame(width: geometry.size.width * self.gapWidth, height: geometry.size.height)
                
                Button(action: {
                    
                }) {
                    Text("DIV")
                        .font(.footnote)
                        .foregroundColor(Color.white)
                }
                .frame(width: geometry.size.width * self.cellLength, height: geometry.size.height)
                .background(Color.gray)
                .cornerRadius(10.0)
                
                Rectangle()
                    .frame(width: geometry.size.width * self.gapWidth, height: geometry.size.height)
                
                Button(action: {
                    
                }) {
                    Text("x")
                        .font(.footnote)
                        .foregroundColor(Color.white)
                }
                .frame(width: geometry.size.width * self.cellLength, height: geometry.size.height)
                .background(Color.orange)
                .cornerRadius(10.0)
                
                Rectangle()
                    .frame(width: geometry.size.width * self.gapWidth, height: geometry.size.height)
                
                
            }
        .padding(0)
            
            
        }
    }
}


