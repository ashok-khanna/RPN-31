/* Status: Completed */

import SwiftUI

struct StackView2: View {
    @EnvironmentObject var dataRouter: DataRouter
    @Binding var presentStackRegister: Bool
    
    @State var rowsDeleted = false
    
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                self.dataRouter.myColors.secondaryBackgroundColor
                    .edgesIgnoringSafeArea(.all)

                    
                    VStack(spacing: 0) {
                                                    
                            Spacer()
                            
                            Text("Stack View")
                                .foregroundColor(self.dataRouter.myColors.secondarySubPageTitleColor)
                                .font(self.dataRouter.myFonts.subPageTitleFont)
                                .fontWeight(.medium)
                            
                            Spacer()
                            
                        UIList(rows: self.dataRouter.calculator.stackRegisters)

            }
        }
    }
}

}


class HostingCell: UITableViewCell { // just to hold hosting controller
    var host: UIHostingController<AnyView>?
}

struct UIList: UIViewRepresentable {

    var rows: [Double]

    func makeUIView(context: Context) -> UITableView {
        let collectionView = UITableView(frame: .zero, style: .plain)
        collectionView.isEditing = true
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

        var rows: [Double]

        init(rows: [Double]) {
            self.rows = rows
            

            
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            self.rows.count

        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HostingCell


            
            let view = Text(String(rows[indexPath.row]))
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
        
        func tableView(_ tableView: UITableView, moveRowAt indexPath: IndexPath, to: IndexPath) {
            let itemToMove = rows[indexPath.row]
            rows.remove(at: indexPath.row)
            rows.insert(itemToMove, at: to.row)
        }
        
           func numberOfSections(in tableView: UITableView) -> Int {

               return 1
           }

           func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
               return false
           }


           func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
               return .none
           }
           
           // Override to support conditional editing of the table view.
           func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
               // Return false if you do not want the specified item to be editable.
               return true
           }
           
           // Override to support editing the table view.
            func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
               
               if editingStyle == .delete {
                   // Delete the row from the data source
                   tableView.deleteRows(at: [indexPath], with: .fade)
               } else if editingStyle == .insert {
                   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
               }
                
           }
           


           func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
           {
                                          
               
               let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in

                   self.rows.remove(at: indexPath.row)
                                      
               }
               
               
               deleteAction.backgroundColor = .red
                              
               let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
               configuration.performsFirstActionWithFullSwipe = false //HERE..
               return configuration
           }
           
        @objc func handleLongPress(longPressGesture: UILongPressGestureRecognizer) {
            
            // self.isEditing.toggle()
            
        }
        
    }
}


/*
class TaskTableViewController: UITableViewController, UITextFieldDelegate, SFSpeechRecognizerDelegate {

    //MARK: Properties
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var newDeleteButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var dateTitle: UILabel!
    
    var taskItems = [Task]() // tasks is a NSManagedObject subclass that is automatically created by Xcode
    
    var textFieldString = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialise the MOC
        moc = appDelegate?.persistentContainer.viewContext
       
        taskTextField.delegate = self
        
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:18, height:10))
        taskTextField.leftViewMode = UITextField.ViewMode.always
        taskTextField.leftView = spacerView
        
        loadData()
        
        recordButton.layer.cornerRadius = 4
        newDeleteButton.layer.cornerRadius = 4
        
        tableView.tableFooterView = UIView()
        
        self.hideKeyboardWhenTappedAround()
        
        UserDefaults.standard.set(true, forKey: "listStarted")
        
        dateTitle.text = setDate()
        
//         self.tableView.isEditing = true

        
        //Long Press


        
    }
    


    // MARK: - Table view data source


    
    
   
 
    
    //MARK: Actions
    
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.taskItems[indexPath.row].isCompleted.toggle()
        
        textFormat(indexPath)
        
        self.appDelegate?.saveContext()

        self.tableView.deselectRow(at: indexPath, animated: false)
 
        //getting the text of that cell
    }
    
   


}



*/
