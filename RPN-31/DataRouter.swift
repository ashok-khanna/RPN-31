//  For code to switch views on potrait and landscape: https://stackoverflow.com/questions/57441654/swiftui-repaint-view-components-on-device-rotation
//  DataRouter.swift
//  TimeTracker
//
//  Created by Ashok Khanna on 8/5/20.
//  Copyright © 2020 Ashok Khanna. All rights reserved.
//


import Foundation
import SwiftUI


class DataRouter: ObservableObject {
    //MARK: Properties
    let defaults = UserDefaults.standard
    
    @Published var heightToWidth: CGFloat
    @Published var numCols: CGFloat
    @Published var numRows: CGFloat
    @Published var rowUnits: CGFloat
    
    @Published var gapWidth: CGFloat
    @Published var gapWidthPortrait: CGFloat
    @Published var gapWidthLandscape: CGFloat
    
    @Published var adjustmentFactor: CGFloat
    @Published var adjustmentFactorPortrait: CGFloat
    @Published var adjustmentFactorLandscape: CGFloat
    @Published var landscape: Bool = false

    @Published var isPad: Bool
    
    
    
     
    init(isPad: Bool, numCols: CGFloat, numRows: CGFloat, gapWidthPortrait: CGFloat, gapWidthLandscape: CGFloat, adjustmentFactorPortrait: CGFloat, adjustmentFactorLandscape: CGFloat, isLandscape: Bool) {
        
        self.isPad = isPad
        
        self.numCols  = numCols
        self.numRows = numRows
        
        self.landscape = isLandscape
        self.gapWidthPortrait = gapWidthPortrait
        self.gapWidthLandscape = gapWidthLandscape
        self.adjustmentFactorPortrait = adjustmentFactorPortrait
        self.adjustmentFactorLandscape = adjustmentFactorLandscape
        
        let tempAdjustmentFactor, tempGapWidth: CGFloat
        
        if isLandscape {
            self.adjustmentFactor = adjustmentFactorLandscape
            self.gapWidth = gapWidthLandscape
            tempAdjustmentFactor = adjustmentFactorLandscape
            tempGapWidth = gapWidthLandscape
        } else {
            self.adjustmentFactor = adjustmentFactorPortrait
            self.gapWidth = gapWidthPortrait
            tempAdjustmentFactor = adjustmentFactorPortrait
            tempGapWidth = gapWidthPortrait
        }
    
        self.rowUnits = numCols + (numCols + CGFloat(1)) * tempGapWidth
        self.heightToWidth = (numRows * tempAdjustmentFactor + ((numRows - CGFloat(1)) * tempGapWidth))/(numCols + ((numCols + CGFloat(1)) * tempGapWidth))

        
        NotificationCenter.default.addObserver(self, selector: #selector(onViewWillTransition(notification:)), name: .my_onViewWillTransition, object: nil)

    }
    
    @objc func onViewWillTransition(notification: Notification) {
        guard let size = notification.userInfo?["size"] as? CGSize else { return }

        landscape = size.width > size.height
        
        if landscape {
            adjustmentFactor = adjustmentFactorLandscape
            gapWidth = gapWidthLandscape

        } else {
            adjustmentFactor = adjustmentFactorPortrait
            gapWidth = gapWidthPortrait
            
        }
        
        rowUnits = numCols + (numCols + CGFloat(1)) * gapWidth
        heightToWidth = (numRows * adjustmentFactor + ((numRows - CGFloat(1)) * gapWidth))/(numCols + ((numCols + CGFloat(1)) * gapWidth))
    }
}
   
  
