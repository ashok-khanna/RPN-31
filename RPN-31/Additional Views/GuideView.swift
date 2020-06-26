/* Status: Completed */

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
                                .fill(Color.clear)
                                .frame(width: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonWidth, height: geometry.size.height * self.dataRouter.mySizes.subPageTopDivider)
                            
                            
                            HStack(spacing: 0){
                                
                                Spacer()
                                
                                Text("Function Guide")
                                    .foregroundColor(self.dataRouter.myColors.secondarySubPageTitleColor)
                                    .font(self.dataRouter.myFonts.subPageTitleFont)
                                    .fontWeight(.medium)
                                
                                Spacer()
                                
                            }.frame(width: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonWidth)
                            
                            Rectangle()
                                .fill(Color.clear)
                                .frame(width: 0, height: geometry.size.height * self.dataRouter.mySizes.subPageBodyGap)
                            
                            HStack(spacing: 0){
                                
                                Spacer()
                                
                                Text("Below is a guide of how to use the various functions in RPN 30. In general, functions either are computed on the last number entered (the \"xRegister\") or on last number entered and the number entered before it (the \"yRegister\"). For example if you input the following: 7 ENTER 3, the xRegister will be 3 and the yRegister will be 7")
                                    .foregroundColor(self.dataRouter.myColors.secondarySubPageTextColor)
                                    .font(self.dataRouter.myFonts.subPageTextFont)
                                    .minimumScaleFactor(self.dataRouter.mySizes.minimumScaleFactor)
                                    .padding(self.dataRouter.mySizes.textPadding)
                                
                                Spacer()
                                
                            }.frame(width: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonWidth)
                        
                            Rectangle()
                                .fill(Color.clear)
                                .frame(width: 0, height: geometry.size.height * self.dataRouter.mySizes.subPageBodyGap)
                            

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
        
        guideList = [GuideEntry("EE", "Scientific Number Entry: The value in the yRegister is multiplied by 10 to the power of the xRegister. E.g. 7 ENTER 3 EE = 7000"), GuideEntry("√x","Square Root: Returns the square root of the xRegister. E.g. 2 √x returns √2"), GuideEntry("1/x","Reciprocal: Returns the reciprocal of the xRegister. E.g. 4 1/x = 0.25"), GuideEntry("%","Percentage: Returns a percentage of the yRegister, namely xRegister as the percentage, i.e. 5 ENTER 20 % = 1 as 20% of 5 is 1"), GuideEntry("% ∆","Percentage Change: Returns the percentage change from yRegister to xRegister. E.g. 8 ENTER 10 % ∆ = 0.25, as 10 is 25% bigger than 8"), GuideEntry("e ᵡ","Exponent: Returns Euler's constant to the power of the xRegister, e.g. 4 e ᵡ = 54.59"), GuideEntry("ln x","Natural Logarithm: Returns the natural logarithm of xRegister. E.g. 5 ln x = 1.61"), GuideEntry("y ᵡ","Power: Returns yRegister to the power of xRegister. E.g. 2 ENTER 3 y ᵡ = 8"), GuideEntry("SIN","Sine Function: Returns the sine of the xRegister, with xRegister entered in radians. E.g. 3 SIN = 0.14"), GuideEntry("COS","Cosine Function: Returns the cosine of the xRegister, with xRegister entered in radians. E.g. 3 COS = 0.99"), GuideEntry("TAN","Tangent Function: Returns the tangent of the xRegister, with xRegister entered in radians. E.g. 3 TAN = 1.52"), GuideEntry("ASIN","ArcSine Function (Inverse of Sine): Returns the arcsine of the xRegister, with xRegister entered in radians. E.g. 0.5 ASIN = 0.52"), GuideEntry("ACOS","ArcCosine Function (Inverse of Cosine): Returns the arccosine of the xRegister, with xRegister entered in radians. E.g. 0.5 ACOS = 1.02"), GuideEntry("ATAN","ArcTan Function (Inverse of Tangent): Returns the arctan of the xRegister, with the xRegister entered in radians. E.g. 0.5 ATAN = 0.80"), GuideEntry("π", "π: Returns the value of π"), GuideEntry("D→R", "Degrees to Radians: Converts degrees, as entered in the xRegister, to radians"), GuideEntry("R→D", "Radians to Degrees: Converts radians, as entered in the xRegister, to degrees"), GuideEntry("x!","Factorial: Returns the factorial of the xRegister. E.g. 5! = 120"), GuideEntry("x√y","Xth Root of Y: Returns the xth (i.e. xRegister) root of the yRegister. E.g. 27 ENTER 3 x√y = 3"), GuideEntry("log10 x","Logarithm to Base 10: Returns the logarithm to the base of 10. E.g. 100 log10 x = 2"), GuideEntry("NPV", "Net Position Value: Returns the NPV of a series of cashflows stored in the Stack Register. Enter cashflows as follows: Cashflow Amount ENTER Cashflow Timing (in years, with 1 = 1 year, 0.5 = 6 months, etc.) ENTER. After adding all your cashflows, enter the annualised interest rate and press the NPV function. For example, to computer the NPV of 100$ received in 6 months, 125$ received in 1 year and 150$ received in 2 years at an interest rate of 10%, enter the following sequence: Long Press on CLR (to clear stack Register) 150 ENTER 2 ENTER 125 ENTER 1 ENTER 100 ENTER 0.5 ENTER 0.1 NPV. This will give us an NPV of 332.95. It is useful to long press the stack register in case you wish to edit the order of numbers entered into the stack register and also to delete any incorrect numbers entered. Practice makes perfect. Please note that this calculation works on the entire stack register so clear the stack register before entering your numbers"), GuideEntry("IRR", "Internal Rate of Return: Returns the IRR of a series of cashflows. Enter cashflows in a similar manner to the NPV calc, and instead of entering the interest rate as the last number, enter the starting investment value you want to equate your series of cashflows to and compute IRR for. Note that the starting value should be entered as positive. Please note that this calculation works on the entire stack register so clear the stack register before entering your numbers"), GuideEntry("CASHF", "Cashflow Entry: This is a helper function to add a regular series of cashflows to the Stack Register to assist with NPV/IRR calculations. Enter three numbers as follows: Cashflow Amount ENTER Cashflow periodicity in years (e.g. for quarterly cashflows, enter 0.25) ENTER Number of Cashflows and then press the CASHF button. For example, 100 ENTER 0.25 ENTER 3 CASHF will add the following to the Stack Register: 100, 0.25, 100, 0.50, 100, 0.75, representing three cashflow pairs of 100 at quarterly intervals. This is useful when trying to calculate YTM for a bond or in general when working with annuities. Please note that no more than 100 cashflows can be added this way"), GuideEntry("MEAN", "Mean of a Series: Returns the mean of a series of values entered into the Stack Register. DO NOT press enter after the last digit that you enter before running the MEAN function as otherwise the calculator will duplicate its value. Please note that this calculation works on the entire stack register so clear the stack register before entering your numbers"), GuideEntry("SDEV", "Standard Deviation: Returns the standard deviation of a series of values entered into the Stack Register. DO NOT press enter after the last digit that you enter before running the SDEV function as otherwise the calculator will duplicate its value. Also, if you ran the MEAN function just before SDEV, make sure to press CLR to remove the MEAN value from the series of numbers that SDEV will calculate on. Please also note that this calculation works on the entire stack register so clear the stack register before entering your numbers"), GuideEntry("NPR", "Number of Permutations: Returns the number of permutations of x number of items (i.e. xRegister) in y number of items (i.e. yRegister). E.g. 10 ENTER 3 NPR = 720"), GuideEntry("NCR", "Number of Combinations: Returns the number of combinations of x number of items (i.e. xRegister) in y number of items (i.e. yRegister). E.g. 10 ENTER 3 NCR = 120"), GuideEntry("DICE", "Dice Roll: Returns an integer value from 1 to 6 inclusive, useful as a virtual dice for games"), GuideEntry("SINH","Hyperbolic Sine: Returns the hyperbolic sine of the xRegister"), GuideEntry("COSH", "Hyperbolic Cosine: Returns the hyperbolic cosine of the xRegister"), GuideEntry("TANH", "Hyperbolic Tangent: Returns the hyperbolic tangent of the xRegister"), GuideEntry("CDF", "Standard Normal CDF: Returns the standard normal cumulative density function computed at xRegister, i.e. the probability the Standard Normal Distributon takes a value less than or equal to the xRegister"), GuideEntry("PDF", "Standard Normal PDF: Returns the standard normal probability density function computed at xRegister"), GuideEntry("MAG8", "Magic 8 Ball: Accurately answers all questions you have in life"), GuideEntry("RAND", "Random Number Generator: Returns a random number in [0,1]"), GuideEntry("e", "Euler's Constant: Returns Euler's constant"), GuideEntry("log2 x","Logarithm to Base 2: Returns the logarithm to the base of 2. E.g. 8 log 2x = 3"), GuideEntry("2 ᵡ","Power of 2: Returns 2 to the power of the xRegister. E.g. 3 2 ᵡ = 8"), GuideEntry("10 ᵡ","Power of 10: Returns 10 to the power of the xRegister. E.g. 3 10 ᵡ = 1000")]
        
        
        
    }
    
    
}

