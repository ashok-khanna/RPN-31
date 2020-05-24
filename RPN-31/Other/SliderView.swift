// From: https://stackoverflow.com/questions/58286350/how-to-create-custom-slider-by-using-swiftui


import Foundation
import SwiftUI

struct SliderView: View {
    @EnvironmentObject var dataRouter: DataRouter
    
    var body: some View {
        GeometryReader { geometry in
            // TODO: - there might be a need for horizontal and vertical alignments
            ZStack(alignment: .leading) {
                
                Rectangle()
                    .foregroundColor(.gray)
                Rectangle()
                    .foregroundColor(.accentColor)
                    .frame(width: geometry.size.width * CGFloat(self.dataRouter.displayFormatter.relevantModeIsDecimals ? self.dataRouter.displayFormatter.maximumFractionDigits : self.dataRouter.displayFormatter.maximumSignificantDigits) / CGFloat(10))
                
                Text((self.dataRouter.displayFormatter.relevantModeIsDecimals ? "Decimal Places: " : "Significant Digits: ") + String(self.dataRouter.displayFormatter.relevantModeIsDecimals ? self.dataRouter.displayFormatter.maximumFractionDigits : self.dataRouter.displayFormatter.maximumSignificantDigits))
                 .foregroundColor(.white)
                    .font(.headline)
                 .frame(width: geometry.size.width, alignment: .center)
                
            }
            .cornerRadius(12)
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged({ value in
                    // TODO: - maybe use other logic here
                    
                    if self.dataRouter.displayFormatter.relevantModeIsDecimals {
                        
                        self.dataRouter.displayFormatter.setDecimals(Int(round(min(max(0, Float(value.location.x / geometry.size.width * 10)), 10))))
 
                    } else {
                        
                        self.dataRouter.displayFormatter.setSigDigits(Int(round(min(max(0, Float(value.location.x / geometry.size.width * 10)), 10))))

                    }
                    
                    self.dataRouter.displayFormatter.rebuild()
                    
                }))
        }
    }
}


