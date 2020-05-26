import SwiftUI

struct GuideView: View {
    @EnvironmentObject var dataRouter: DataRouter
    @Binding var presentGuidePage: Bool
    var myGuide = MyGuide()
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                VStack(spacing: 0) {
                    
                    List {
                        
                        VStack(spacing: 0) {
                            
                            Rectangle()
                                .fill(self.dataRouter.myColors.secondarySubPageHeaderColor)
                                .frame(width: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonWidth, height: geometry.size.height * self.dataRouter.mySizes.subPageTopDivider)
                            
                            Text("Function Guide")
                                .foregroundColor(self.dataRouter.myColors.secondarySubPageTitleColor)
                                .font(self.dataRouter.myFonts.subPageTitleFont)
                                .fontWeight(.medium)
                            
                            Rectangle()
                                .fill(self.dataRouter.myColors.secondaryBackgroundColor)
                                .frame(width: self.dataRouter.mySizes.nilSize, height: geometry.size.height * self.dataRouter.mySizes.subPageBodyGap)
                            
                            Text("Below is a guide of how to use the various functions in RPN 30. In general, functions either are computed on the last number entered (the \"xRegister\") or on last number entered and the number entered before it (the \"yRegister\"). For example if you input the following: 7 ENTER 3, the xRegister will be 3 and the yRegister will be 7.")
                                .foregroundColor(self.dataRouter.myColors.secondarySubPageTextColor)
                                .font(self.dataRouter.myFonts.subPageTextFont)
                                .minimumScaleFactor(self.dataRouter.mySizes.minimumScaleFactor)
                                .padding(self.dataRouter.mySizes.textPadding)
                            
                            Rectangle()
                                .fill(self.dataRouter.myColors.secondaryBackgroundColor)
                                .frame(width: self.dataRouter.mySizes.nilSize, height: geometry.size.height * self.dataRouter.mySizes.subPageTableGap)
                        }
                        
                        ForEach(self.myGuide.guideList) { guideEntry in
                            Section(header: Text(guideEntry.title)) {
                                
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(guideEntry.description)
                                        .foregroundColor(self.dataRouter.myColors.secondarySubPageTextColor)
                                        .font(self.dataRouter.myFonts.subPageTextFont)
                                        .minimumScaleFactor(self.dataRouter.mySizes.minimumScaleFactor)
                                    
                                    Rectangle()
                                        .fill(self.dataRouter.myColors.secondarySubPageHeaderColor)
                                        .frame(width: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonWidth, height: geometry.size.height * self.dataRouter.mySizes.subPageListTableDivider)
                                }
                                

                                
                            }
                        }
                    }
                    
                    
                    Spacer()
                    
                    
                }
                
                
            }
        }
        
        
    }
    
}

struct GuideEntry: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    
    init(_ name: String, _ description: String){
        self.title = name
        self.description = description
    }
}

struct MyGuide {
    
    var guideList = [GuideEntry]()
    
    init(){
        
        guideList = [GuideEntry("EE", "Scientific Number Entry: The value in the yRegister is multiplied by 10 to the power of the xRegister. E.g. 7 ENTER 3 EE = 7000"), GuideEntry("√x","Square Root: Returns the square root of the xRegister. E.g. 2 √x returns √2"), GuideEntry("1/x","Reciprocal: Returns the reciprocal of the xRegister. E.g. 4 1/x = 0.25"), GuideEntry("%","Percentage: Returns a percentage of the yRegister, namely xRegister as the percentage, i.e. 5 ENTER 20 % = 1 as 20% of 5 is 1"), GuideEntry("% ∆","Percentage Change: Returns the percentage change from yRegister to xRegister. E.g. 8 ENTER 10 % ∆ = 0.25, as 10 is 25% bigger than 8"), GuideEntry("e ᵡ","Exponent: Returns euler's constant to the power of the xRegister, e.g. 4 e ᵡ = 54.59"), GuideEntry("ln x","Natural Logarithm: Returns the natural logarithm of xRegister. E.g. 5 ln x = 1.61"), GuideEntry("y ᵡ","Power: Returns yRegister to the power of xRegister. E.g. 2 ENTER 3 y ᵡ = 8"), GuideEntry("SIN","Sine Function: Returns the sine of xRegister, with xRegister entered in radians. E.g. 3 SIN = 0.14"), GuideEntry("COS","Cosine Function: Returns the cosine of the xRegister, with xRegister entered in radians. E.g. 3 COS = 0.99"), GuideEntry("TAN","Tangent Function: Returns the tangent of the xRegister, with xRegister entered in radians. E.g. 3 TAN = 1.52"), GuideEntry("ASIN","ArcSine Function (Inverse of Sine): Returns the arcsine of the xRegister, with xRegister entered in radians. E.g. 0.5 ASIN = 0.52"), GuideEntry("ACOS","ArcCosine Function (Inverse of Cosine): Returns the arccosine of the xRegister, with xRegister entered in radians. E.g. 0.5 ACOS = 1.02"), GuideEntry("ATAN","ArcTan Function (Inverse of Tangent): Returns the arctan of the xRegister, with the xRegister entered in radians. E.g. 0.5 ATAN = 0.80"), GuideEntry("x!","Factorial: Returns the factorial of the xRegister. E.g. 5! = 120"), GuideEntry("log10 x","Logarithm to Base 10: Returns the logarithm to the base of 10. E.g. 100 log10 x = 2"), GuideEntry("log2 x","Logarithm to Base 2: Returns the logarithm to the base of 2. E.g. 8 log 2x = 3"), GuideEntry("10 ᵡ","Power of 10: Returns 10 to the power of the xRegister. E.g. 3 10 ᵡ = 1000"), GuideEntry("2 ᵡ","Power of 2: Returns 2 to the power of the xRegister. E.g. 3 2 ᵡ = 8")]
        
        
        
    }
    
    
}

