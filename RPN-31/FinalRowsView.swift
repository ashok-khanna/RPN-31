//
//  ContentView.swift
//  RPN-31
//
//  Created by Ashok Khanna on 16/5/20.
//  Copyright © 2020 Ashok Khanna. All rights reserved.
//

import SwiftUI

struct FinalRowsView: View {
    
    
    var cellLength = CGFloat(0.2)
    
    var body: some View {
        
        GeometryReader { geometry in
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("CLR")
                        .font(.footnote)
                        .foregroundColor(Color.white)
                }
                .frame(width: geometry.size.width * self.cellLength, height: geometry.size.width * self.cellLength)
                .background(Color.gray)
                .cornerRadius(10.0)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("CHS")
                        .font(.footnote)
                        .foregroundColor(Color.white)
                }
                .frame(width: geometry.size.width * self.cellLength, height: geometry.size.width * self.cellLength)
                .background(Color.gray)
                .cornerRadius(10.0)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("DIV")
                        .font(.footnote)
                        .foregroundColor(Color.white)
                }
                .frame(width: geometry.size.width * self.cellLength, height: geometry.size.width * self.cellLength)
                .background(Color.gray)
                .cornerRadius(10.0)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("x")
                        .font(.footnote)
                        .foregroundColor(Color.white)
                }
                .frame(width: geometry.size.width * self.cellLength, height: geometry.size.width * self.cellLength)
                .background(Color.orange)
                .cornerRadius(10.0)
                
                Spacer()
                
                
                
            }
            
            
        }
    }
}



