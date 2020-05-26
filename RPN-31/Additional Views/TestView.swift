import SwiftUI

struct TestView: View {
    @State var myArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
    
    var body: some View {
        
        
        VStack {
            
            NavigationView {
                List {
                    ForEach(self.myArray, id: \.self) { item in
                        
                        Text(String(item))
                    }
                    .onMove(perform: self.move)
                }
                    //.listStyle(GroupedListStyle())
                    .environment(\.editMode, .constant(.active))
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
            }
            
            
            NavigationView {
                List {
                    ForEach(0..<self.myArray.count) { index in
                        
                        Text(String(self.myArray[index]))
                    }
                    .onMove(perform: self.move)
                }
                    //.listStyle(GroupedListStyle())
                    .environment(\.editMode, .constant(.active))
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
            }
            
            
        }

        
        
    }
    
    func move(from source: IndexSet, to destination: Int) {
        self.myArray.move(fromOffsets: source, toOffset: destination)
    }
    
}



