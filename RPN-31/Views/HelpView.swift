import SwiftUI

struct HelpView: View {
    @EnvironmentObject var dataRouter: DataRouter
    @Binding var presentHelpPage: Bool
    
    var body: some View {
        
        VStack {
            
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    self.presentHelpPage = false
                    
                }) {
                    Image(systemName:"x.circle")
                        .foregroundColor(.black)
                        .font(Font.title.weight(.regular))
                }
                .fixedSize()
                .frame(width: 50, height: 50)
                
            }
            
            Button(action: {

                self.presentHelpPage = false
                    
                }) {
                Text("Add Quote")
            }
            .foregroundColor(.white)
            .fixedSize()
            .frame(width: 300, height: 50)
            .background(Color.blue)
            .cornerRadius(10)
            
            Rectangle()
                .frame(width: 0, height: 10)
            
            Rectangle()
                .background(Color.black)
                .frame(width: 400, height: 3)
            
            Rectangle()
                .frame(width: 0, height: 5)
            
            Spacer()
            
            Text("Type Below")
            
            Spacer()
            
            }
    }
}
