//
//  ViewController.swift
//  faiaz_rahman_30024_UiKit
//
//  Created by bjit on 14/12/22.
//

import UIKit


var currentRow = 0


class ViewController: UIViewController{
    

    @IBOutlet weak var tableViewX: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewX.dataSource = self
        tableViewX.delegate = self
        
        
        //header reg
        let headerNib = UINib(nibName: "CustomHeader", bundle: nil)
        tableViewX.register(headerNib, forHeaderFooterViewReuseIdentifier: "CustomHeader")
        
        
        
    }
    
    
    
    @IBAction func addExpense(_ sender: Any) {
        
        performSegue(withIdentifier: "wayTo2", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("HereFz")
        if segue.identifier == "wayTo2"{
            if let destinationVC = segue.destination as? SecondVC{
                destinationVC.delegate = self
                print("HereFz0")
                //destinationVC.expenseAmount.placeholder = "hello"
            }
        }
        
        if segue.identifier == "wayto2B"{

            let index = tableViewX.indexPathForSelectedRow


            if let destinationVC = segue.destination as? SecondVC{
                 destinationVC.loadViewIfNeeded()
                    
                destinationVC.expenseType.text = Expense.expense[currentRow].expenseType
                destinationVC.expenseAmount.text = Expense.expense[currentRow].expenseAmount
                destinationVC.expenseDescription.text = Expense.expense[currentRow].expenseDesc
                tableViewX.reloadData()
                //destinationVC.boxFiller()
                destinationVC.delegate = self

                //destinationVC.expenseAmount.placeholder = "hello"
            }
        }
        
    }
    
}

extension ViewController:  UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Expense.expense.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewX.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CustomVC1
        
        cell.fExpenseAmount.text = Expense.expense[indexPath.row].expenseAmount
        
        cell.fExpenseType.text = Expense.expense[indexPath.row].expenseType
        
        cell.fExpenseDesc.text = Expense.expense[indexPath.row].expenseDesc
        
        cell.fExpenseDate.text = Expense.expense[indexPath.row].expenseDate
        
        
        return cell
        
    }
    
}

extension ViewController: UITableViewDelegate{
    
    //Header
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
            
        let headerSection = tableViewX.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeader") as! CustomHeader
        
//        for value in Expense.expense
//
        var totalExpense: Double = 0.0

        //tableViewX.reloadData()
        for i in 0...Expense.expense.count - 1{
            totalExpense = totalExpense + Double((Expense.expense[i].expenseAmount) )!
        }
        
          
          headerSection.headerLabel.text = "Total Expense \(totalExpense)"
        
            return headerSection
    }
    
    // Returning the height of Header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    
    
    
    
    
    // Trailing Action Setup
        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            
            
            let deleteAction = UIContextualAction(style: .destructive, title: nil) {[weak self] _, _, completion in
                
                guard let self = self else {return}
                
                self.performDeleteAction(indexPath: indexPath)
                completion(true)
            }
            deleteAction.image = UIImage(systemName: "trash")
            deleteAction.backgroundColor = .systemRed
            
            
            let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])
            swipeActions.performsFirstActionWithFullSwipe = true
            return swipeActions
            
        
        }
        
     
        
        func performDeleteAction(indexPath: IndexPath){
            
            Expense.expense.remove(at: indexPath.row)
            tableViewX.reloadData()
//            tableViewX.beginUpdates()
//            tableViewX.deleteRows(at: [indexPath], with: .middle)
//            tableViewX.endUpdates()
            
        }
    
    
    // Leading Acton Setup
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let editAction = UIContextualAction(style: .normal, title: nil) {[weak self] _, _, completion in
            
            guard let self = self else {return}
            
            self.performEditAction(indexPath: indexPath)
            completion(true)
        }
        editAction.image = UIImage(systemName: "pencil.circle")
        editAction.backgroundColor = .black
  
        let leadingSwipeActions = UISwipeActionsConfiguration(actions: [editAction])
        leadingSwipeActions.performsFirstActionWithFullSwipe = true
        return leadingSwipeActions
    }
    
    func performEditAction(indexPath: IndexPath){
        currentRow = indexPath.row
        performSegue(withIdentifier: "wayto2B", sender: nil)
    }
    
    
    
    
    
    
    
}



