//
//  SecondVC.swift
//  faiaz_rahman_30024_UiKit
//
//  Created by bjit on 14/12/22.
//

import UIKit

class SecondVC: UIViewController {
    
    
    var delegate: ViewController?
    
    
    var eTypeX : String = "Please give new Data"
    var eAmountX: String = "Please give new Data"
    var eDescX: String = "Please give new Data"
    
    

    @IBOutlet weak var expenseType: UITextField!
    
    @IBOutlet weak var expenseAmount: UITextField!
    
   // @IBOutlet weak var dateOfExpense: UITextField!
    
    @IBOutlet weak var expenseDescription: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addForm(_ sender: Any) {
        
        let eType = expenseType.text ?? ""
        let eAmount = expenseAmount.text ?? ""
        let eDesc = expenseDescription.text ?? ""
       
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY, MMM d, hh:mm"
        let currentDate = dateFormatter.string(from: date)
        
        Expense.expense.append(Expense(expenseType: eType, expenseAmount:eAmount, expenseDesc: eDesc, expenseDate: currentDate))
        
        delegate?.tableViewX.reloadData()
        dismiss(animated: true)
    
        
    }
    
    
    @IBAction func editButton(_ sender: Any) {
        
        let eType = expenseType.text ?? ""
        let eAmount = expenseAmount.text ?? ""
        let eDesc = expenseDescription.text ?? ""


        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY, MMM d, hh:mm"
        let currentDate = dateFormatter.string(from: date)

        // Expense.expense.append(Expense(expenseType: eType, expenseAmount:eAmount, expenseDesc: eDesc, expenseDate: currentDate))
        print(currentRow)
        Expense.expense[currentRow] = Expense(expenseType: eType, expenseAmount:eAmount, expenseDesc: eDesc, expenseDate: currentDate)
        
        print(Expense.expense)

        delegate?.tableViewX.reloadData()


        dismiss(animated: true)
        
    }
    
    
    
    func boxFiller(){
        
      
        
    }
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
