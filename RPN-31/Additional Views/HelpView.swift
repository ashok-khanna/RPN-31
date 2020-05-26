import SwiftUI

struct HelpView: View {
    @EnvironmentObject var dataRouter: DataRouter
    @Binding var presentHelpPage: Bool
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                self.dataRouter.myColors.primaryBackgroundColor
                .edgesIgnoringSafeArea(.all)

                ScrollView {
                    
                    VStack(spacing: 0) {
                        
                        Rectangle()
                            .fill(self.dataRouter.myColors.primaryBackgroundColor)
                              .frame(width: geometry.size.width, height: geometry.size.height * self.dataRouter.mySizes.subPageHeaderGap)
                                           
                                           HStack {
                                                                       
                                               
                                            FormatButton(operatorString: "DECIMAL", font: self.dataRouter.myFonts.textFont, width: geometry.size.width * CGFloat(0.25), height: geometry.size.width * CGFloat(0.15))
                                                   .frame(width: geometry.size.width * CGFloat(0.25), height: geometry.size.width * CGFloat(0.15))
                                                   Spacer()
                                                   
                                            FormatButton(operatorString: "SCIENCE", font: self.dataRouter.myFonts.textFont, width: geometry.size.width * CGFloat(0.25), height: geometry.size.width * CGFloat(0.15))
                                                    .frame(width: geometry.size.width * CGFloat(0.25), height: geometry.size.width * CGFloat(0.15))
                                                   Spacer()
                                                   
                                            FormatButton(operatorString: "SPECIAL", font: self.dataRouter.myFonts.textFont, width: geometry.size.width * CGFloat(0.25), height: geometry.size.width * CGFloat(0.15))
                                                .frame(width: geometry.size.width * CGFloat(0.25), height: geometry.size.width * CGFloat(0.15))
                                               }
                                               .frame(width: geometry.size.width * CGFloat(0.9))
                                           
                                               Rectangle()
                                                   .fill(Color.clear)
                                                   .frame(width:geometry.size.width, height: geometry.size.height * 0.05)
                                               
                                           SliderView()
                                               .accentColor(.red)
                                                   .frame(width: geometry.size.width * CGFloat(0.9), height: geometry.size.width * CGFloat(0.15))
                                           

                                           
                                       }
      

                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: geometry.size.width, height: geometry.size.height * self.dataRouter.mySizes.subPageHeaderGap)
                    
                        Text("Help")
                            .foregroundColor(self.dataRouter.myColors.primarySubPageTitleColor)
                            .font(self.dataRouter.myFonts.subPageTitleFont)
                            .fontWeight(.medium)
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width:geometry.size.width, height: geometry.size.height * self.dataRouter.mySizes.subPageBodyGap)
                    
                        Text("Help instructions go here. Also note settings below Lomography is the commercial trademark of Lomographische AG, Austria for products and services catering to lo-fi photographers. The name is inspired by the former state-run optics manufacturer LOMO PLC of Saint Petersburg, Russia. LOMO PLC created and produced the 35mm LOMO LC-A Compact Automat camera — which became the centerpiece of Lomography’s marketing and sales activities. This camera was loosely based upon the Cosina CX-1 and introduced in the early 1980s. In 1991, the Austrian founders of Lomography discovered the Lomo LC-A. They were “charmed by the unique, colorful, and sometimes blurry” images that the camera produced. After a series of international art exhibitions and marketing, Lomography signed an exclusive distribution agreement with LOMO PLC — thereby becoming the sole distributor of all Lomo LC-A cameras outside of the Soviet Union. Since the introduction of the original Lomo LC-A, Lomography has produced and marketed various lines of branded analogue cameras. Most of these cameras are designed to produce a single photographic effect. In 2005, production of the original Lomo LC-A was discontinued. Its replacement, the LC-A+, was introduced in Fall 2006. The new camera, made in China rather than Russia, featured the original Russian lens manufactured by LOMO PLC. This changed as of mid-2007 with the lens now made in China as well. Similar to Eastman Kodak’s concept of the “Kodak moment”, the Lomography website endorses a motto of “Don’t Think, Just Shoot”. This motto is accompanied by the Ten Golden Rules of Lomography; guidelines encouraging spontaneity and minimal consideration of formal technique. The cameras marketed by Lomography is the commercial trademark of Lomographische AG, Austria for products and services catering to lo-fi photographers. The name is inspired by the former state-run optics manufacturer LOMO PLC of Saint Petersburg, Russia. LOMO PLC created and produced the 35mm LOMO LC-A Compact Automat camera — which became the centerpiece of Lomography’s marketing and sales activities. This camera was loosely based upon the Cosina CX-1 and introduced in the early 1980s. In 1991, the Austrian founders of Lomography discovered the Lomo LC-A. They were “charmed by the unique, colorful, and sometimes blurry” images that the camera produced. After a series of international art exhibitions and marketing, Lomography signed an exclusive distribution agreement with LOMO PLC — thereby becoming the sole distributor of all Lomo LC-A cameras outside of the Soviet Union. Since the introduction of the original Lomo LC-A, Lomography has produced and marketed various lines of branded analogue cameras. Most of these cameras are designed to produce a single photographic effect. In 2005, production of the original Lomo LC-A was discontinued. Its replacement, the LC-A+, was introduced in Fall 2006. The new camera, made in China rather than Russia, featured the original Russian lens manufactured by LOMO PLC. This changed as of mid-2007 with the lens now made in China as well. Similar to Eastman Kodak’s concept of the “Kodak moment”, the Lomography website endorses a motto of “Don’t Think, Just Shoot”. This motto is accompanied by the Ten Golden Rules of Lomography; guidelines encouraging spontaneity and minimal consideration of formal technique. The cameras marketed by Lomography is the commercial trademark of Lomographische AG, Austria for products and services catering to lo-fi photographers. The name is inspired by the former state-run optics manufacturer LOMO PLC of Saint Petersburg, Russia. LOMO PLC created and produced the 35mm LOMO LC-A Compact Automat camera — which became the centerpiece of Lomography’s marketing and sales activities. This camera was loosely based upon the Cosina CX-1 and introduced in the early 1980s. In 1991, the Austrian founders of Lomography discovered the Lomo LC-A. They were “charmed by the unique, colorful, and sometimes blurry” images that the camera produced. After a series of international art exhibitions and marketing, Lomography signed an exclusive distribution agreement with LOMO PLC — thereby becoming the sole distributor of all Lomo LC-A cameras outside of the Soviet Union. Since the introduction of the original Lomo LC-A, Lomography has produced and marketed various lines of branded analogue cameras. Most of these cameras are designed to produce a single photographic effect. In 2005, production of the original Lomo LC-A was discontinued. Its replacement, the LC-A+, was introduced in Fall 2006. The new camera, made in China rather than Russia, featured the original Russian lens manufactured by LOMO PLC. This changed as of mid-2007 with the lens now made in China as well. Similar to Eastman Kodak’s concept of the “Kodak moment”, the Lomography website endorses a motto of “Don’t Think, Just Shoot”. This motto is accompanied by the Ten Golden Rules of Lomography; guidelines encouraging spontaneity and minimal consideration of formal technique. The cameras marketed by Lomography is the commercial trademark of Lomographische AG, Austria for products and services catering to lo-fi photographers. The name is inspired by the former state-run optics manufacturer LOMO PLC of Saint Petersburg, Russia. LOMO PLC created and produced the 35mm LOMO LC-A Compact Automat camera — which became the centerpiece of Lomography’s marketing and sales activities. This camera was loosely based upon the Cosina CX-1 and introduced in the early 1980s. In 1991, the Austrian founders of Lomography discovered the Lomo LC-A. They were “charmed by the unique, colorful, and sometimes blurry” images that the camera produced. After a series of international art exhibitions and marketing, Lomography signed an exclusive distribution agreement with LOMO PLC — thereby becoming the sole distributor of all Lomo LC-A cameras outside of the Soviet Union. Since the introduction of the original Lomo LC-A, Lomography has produced and marketed various lines of branded analogue cameras. Most of these cameras are designed to produce a single photographic effect. In 2005, production of the original Lomo LC-A was discontinued. Its replacement, the LC-A+, was introduced in Fall 2006. The new camera, made in China rather than Russia, featured the original Russian lens manufactured by LOMO PLC. This changed as of mid-2007 with the lens now made in China as well. Similar to Eastman Kodak’s concept of the “Kodak moment”, the Lomography website endorses a motto of “Don’t Think, Just Shoot”. This motto is accompanied by the Ten Golden Rules of Lomography; guidelines encouraging spontaneity and minimal consideration of formal technique. The cameras marketed by Lomography is the commercial trademark of Lomographische AG, Austria for products and services catering to lo-fi photographers. The name is inspired by the former state-run optics manufacturer LOMO PLC of Saint Petersburg, Russia. LOMO PLC created and produced the 35mm LOMO LC-A Compact Automat camera — which became the centerpiece of Lomography’s marketing and sales activities. This camera was loosely based upon the Cosina CX-1 and introduced in the early 1980s. In 1991, the Austrian founders of Lomography discovered the Lomo LC-A. They were “charmed by the unique, colorful, and sometimes blurry” images that the camera produced. After a series of international art exhibitions and marketing, Lomography signed an exclusive distribution agreement with LOMO PLC — thereby becoming the sole distributor of all Lomo LC-A cameras outside of the Soviet Union. Since the introduction of the original Lomo LC-A, Lomography has produced and marketed various lines of branded analogue cameras. Most of these cameras are designed to produce a single photographic effect. In 2005, production of the original Lomo LC-A was discontinued. Its replacement, the LC-A+, was introduced in Fall 2006. The new camera, made in China rather than Russia, featured the original Russian lens manufactured by LOMO PLC. This changed as of mid-2007 with the lens now made in China as well. Similar to Eastman Kodak’s concept of the “Kodak moment”, the Lomography website endorses a motto of “Don’t Think, Just Shoot”. This motto is accompanied by the Ten Golden Rules of Lomography; guidelines encouraging spontaneity and minimal consideration of formal technique. The cameras marketed by ")
                            .foregroundColor(self.dataRouter.myColors.primarySubPageTextColor)
                            .font(self.dataRouter.myFonts.subPageTextFont)
                            .minimumScaleFactor(self.dataRouter.mySizes.minimumScaleFactor)
                            .padding(self.dataRouter.mySizes.textPadding)
                    
                    
                    
                }
            }
            
            
        }
        
    }
}
