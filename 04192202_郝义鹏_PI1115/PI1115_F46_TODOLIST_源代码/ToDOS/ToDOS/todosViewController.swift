//
//  todosViewController.swift
//  ToDOS
//
//  Created by 郝义鹏 on 2022/10/16.
//

import UIKit

protocol todoTableViewControllerDelegate{
    func didadd(name: String)
    func didEidt(name:String)
}

class todosViewController: UITableViewController {
    
    var delegate : todoTableViewControllerDelegate?
    
    var name : String?
    
    @IBOutlet weak var todoTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTextView.becomeFirstResponder()
         
        todoTextView.text=name
        
        if name != nil{
            navigationItem.title = "新增待办事项"
        }
        
        // todoTextView.delegate = self
        
        navigationItem.leftBarButtonItem?.image = sizeIcon("chevron.backward.circle.fill")
        navigationItem.rightBarButtonItem?.image = sizeIcon("checkmark.circle.fill")
    }
    
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(_ sender: Any) {
        
        if !todoTextView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            let name = todoTextView.text!
            if self.name != nil{
                delegate?.didEidt(name: name)
            }else{
                delegate?.didadd(name: name)
            }
        }
        navigationController?.popViewController(animated: true)
    }
}
       
    extension todosViewController : UITextViewDelegate{
           func textViewDidChange(_ textView:UITextView){
               //批量更新，添加的cell自适应同步
//               老版本：
//               tableView.beginUpdates()
//               tableView.endUpdates()
               tableView.performBatchUpdates {
                   
               }
           }
       
}
