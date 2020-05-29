import Foundation
import UIKit
import SwiftUI

extension Calculator {
    
   
    mutating func liftStackRegisters(){ // Keep X and copy rest up
        
        if stackRegisters.count > 0 {
            stackRegisters.insert(stackRegisters[0], at: 0)
        } else {
            stackRegisters.append(0.0)
        }
    }
    
    mutating func dropStackRegistersOneAtATime(){
        
        if stackRegisters.count > 0 {
           stackRegisters.removeFirst()
        }
    }
    
    mutating func dropStackRegistersAfterBinaryOperation(){
        if stackRegisters.count > 0 {
           stackRegisters.removeFirst()
        }
        if stackRegisters.count > 0 {
           stackRegisters.removeFirst()
        }
    }
    
    mutating func clearStack(){
        
        stackRegisters = [Double]()
        isNewNumberEntry = true
        stackAutoLift = false // User does not expect this behaviour when accessing calculator for first time
        
    }
    
    mutating func clearLastRegisters(){
        
        lastRegister.lastX = 0.0
        lastRegister.lastY = 0.0
        lastRegister.lastOperator = ""
        lastRegister.unaryAction = false
        lastRegister.displayText = ""
        
    }
    
    mutating func processEnter(){
        
        isNewNumberEntry = true // Adding digits after enter key should be creating a new number
        stackAutoLift = false
        liftStackRegisters()
        clearLastRegisters()
        
    }
    
    mutating func clearLast(){
        
        if stackRegisters.count > 0 {
            if clearMode {
                stackRegisters.remove(at: 0)
            } else {
                stackRegisters[0] = 0.0
                clearMode = true
                
            }
        }
        
        xRegisterDecimals = 0
        xRegisterEntryFormatter.minimumFractionDigits = 0
        xRegisterEntryFormatter.maximumFractionDigits = 0
        
        clearLastRegisters()
        
    }
    
    mutating func swapXY(){
        
        if stackRegisters.count > 1 {
            
            let xRegister = stackRegisters[0]
            let yRegister = stackRegisters[1]
            
            stackRegisters[0] = yRegister
            stackRegisters[1] = xRegister
            
            clearLastRegisters()

        }


    }
    
    func copyToClipboard(){
        UIPasteboard.general.string = String(stackRegisters[0])
    }
    
    mutating func pasteFromClipboard(){
        if let myString = UIPasteboard.general.string {
            if let xRegisterNew = Double(myString) {
                if xRegisterNew != 0.0 {
                stackRegisters[0] = xRegisterNew
                isNewNumberEntry = true
                clearLastRegisters()
                print("hello")
            }
            }
        }
    }
    
}


class HostingCell: UITableViewCell { // just to hold hosting controller
    var host: UIHostingController<AnyView>?
}

struct UIList: UIViewRepresentable {

    var rows: [String]

    func makeUIView(context: Context) -> UITableView {
        let collectionView = UITableView(frame: .zero, style: .plain)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = context.coordinator
        collectionView.delegate = context.coordinator
        collectionView.register(HostingCell.self, forCellReuseIdentifier: "Cell")
        return collectionView
    }

    func updateUIView(_ uiView: UITableView, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(rows: rows)
    }

    class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate {

        var rows: [String]

        init(rows: [String]) {
            self.rows = rows
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            self.rows.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HostingCell

            let view = Text(rows[indexPath.row])
                    .frame(height: 50).background(Color.blue)

            // create & setup hosting controller only once
            if tableViewCell.host == nil {
                let controller = UIHostingController(rootView: AnyView(view))
                tableViewCell.host = controller

                let tableCellViewContent = controller.view!
                tableCellViewContent.translatesAutoresizingMaskIntoConstraints = false
                tableViewCell.contentView.addSubview(tableCellViewContent)
                tableCellViewContent.topAnchor.constraint(equalTo: tableViewCell.contentView.topAnchor).isActive = true
                tableCellViewContent.leftAnchor.constraint(equalTo: tableViewCell.contentView.leftAnchor).isActive = true
                tableCellViewContent.bottomAnchor.constraint(equalTo: tableViewCell.contentView.bottomAnchor).isActive = true
                tableCellViewContent.rightAnchor.constraint(equalTo: tableViewCell.contentView.rightAnchor).isActive = true
            } else {
                // reused cell, so just set other SwiftUI root view
                tableViewCell.host?.rootView = AnyView(view)
            }
            tableViewCell.setNeedsLayout()
            return tableViewCell
        }
    }
}
