import SwiftUI

struct HelpView: View {
    @EnvironmentObject var dataRouter: DataRouter
    @Binding var presentHelpPage: Bool
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                self.dataRouter.myColors.background(self.dataRouter.darkMode)
                .edgesIgnoringSafeArea(.all)

                VStack {
                    
                     Rectangle()
                        .fill(self.dataRouter.myColors.stackRegisters(self.dataRouter.darkMode))
                        .frame(width: geometry.size.width, height: geometry.size.height * self.dataRouter.mySizes.subPageTopDivider)

                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: geometry.size.width, height: geometry.size.height * self.dataRouter.mySizes.subPageHeaderGap)
                    
                        Text("Help")
                            .foregroundColor(Color.white)
                            .font(.title)
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width:geometry.size.width, height: geometry.size.height * self.dataRouter.mySizes.subPageBodyGap)
                    
                        Text("Help instructions go here. Also note settings below")
                            .foregroundColor(Color.white)
                            .font(.body)
                            .padding(self.dataRouter.mySizes.textPadding)
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width:geometry.size.width, height: geometry.size.height * self.dataRouter.mySizes.subPageTableGap)
                    
                    
                    // Number Formatted Section
                    
                    VStack(spacing: 0) {
                        
                        HStack {
                                                    
                            
                            FormatButton(operatorString: "DECIMAL", font: self.dataRouter.operatorFont, width: geometry.size.width * CGFloat(0.25), height: geometry.size.width * CGFloat(0.15))
                                
                                Spacer()
                                
                            FormatButton(operatorString: "SCIENCE", font: self.dataRouter.operatorFont, width: geometry.size.width * CGFloat(0.25), height: geometry.size.width * CGFloat(0.15))
                                
                                Spacer()
                                
                            FormatButton(operatorString: "SPECIAL", font: self.dataRouter.operatorFont, width: geometry.size.width * CGFloat(0.25), height: geometry.size.width * CGFloat(0.15))
                            
                            }
                            .frame(width: geometry.size.width * CGFloat(0.9))
                        
                            Rectangle()
                                .fill(Color.clear)
                                .frame(width:geometry.size.width, height: geometry.size.height * 0.05)
                            
                        SliderView()
                            .accentColor(.red)
                                .frame(width: geometry.size.width * CGFloat(0.9), height: geometry.size.width * CGFloat(0.15))
                        

                        
                    }
                    
                    Spacer()
                    
                    
                }
            }
            
            
        }
        
    }
}
