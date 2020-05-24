import SwiftUI
import Sliders

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
                        .frame(width: geometry.size.width, height: geometry.size.height * CGFloat(0.02))
                        
                        Text("Help / Settings")
                            .foregroundColor(self.dataRouter.myColors.text(self.dataRouter.darkMode))
                            .font(.title)
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width:geometry.size.width, height: geometry.size.height * 0.05)
                    
                    // Spacer()
                    
                    Button(action: {

                      self.presentHelpPage = false
                      
                      }) {
                      Text("Button Configurator")
                          .font(self.dataRouter.operatorFont)
                          
                  }
                  .foregroundColor(self.dataRouter.myColors.specialBackgroundText(self.dataRouter.darkMode))
                  .frame(width: geometry.size.width * CGFloat(0.9), height: geometry.size.width * CGFloat(0.2))
                  .background(self.dataRouter.myColors.specialBackground(self.dataRouter.darkMode))
                  .cornerRadius(15)
                    
                    Spacer()
                    
                    
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
                        
                            Rectangle()
                            .fill(Color.clear)
                            .frame(width:geometry.size.width, height: geometry.size.height * 0.05)
                        
                    }
                    
                    Spacer()
                    
                    
                }
            }
            
            
        }
        
    }
}
