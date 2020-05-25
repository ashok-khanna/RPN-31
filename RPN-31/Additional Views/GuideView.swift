import SwiftUI

struct GuideView: View {
    @EnvironmentObject var dataRouter: DataRouter
    @Binding var presentGuidePage: Bool
    
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
                    
                        Text("Function Guide")
                            .foregroundColor(Color.white)
                            .font(.title)
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width:geometry.size.width, height: geometry.size.height * self.dataRouter.mySizes.subPageBodyGap)
                    
                        Text("Guide goes here - probably will do a Table list")
                            .foregroundColor(Color.white)
                            .font(.body)
                            .padding(self.dataRouter.mySizes.textPadding)
                    
                    
                    }
                                        
                    
                }
            }
            
            
        }
        
    }

