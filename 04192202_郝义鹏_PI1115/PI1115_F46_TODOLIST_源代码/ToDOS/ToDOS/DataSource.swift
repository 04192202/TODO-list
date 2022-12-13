//
//  DataSource.swift
//  ToDOS
//
//  Created by 郝义鹏 on 2022/10/17.
//


import UIKit

extension TodosTableVC{
    // MARK: - Table view data source
    
    //配置section的数量(不实现的话就相当于返回1)
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1// section规定了tabelview的段
    }
    
    //配置row的数量
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count// row 规定了每段多少行
    }
    
    //配置每个row里面显示什么内容
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kToDoCellID, for: indexPath )as!ToDoCell
        
        todos[indexPath.row].orderID = Int16(indexPath.row)
        
        appDelegate.saveContext()
        //移动cell之后,给每个todo的排序属性(orderID)赋当前所在row的值,之后就可以根据这个属性排序并取出来
        //增删改查：查数据
        let CheckButton = cell.CheckButton!
        let ToDoLabel = cell.ToDoLabel!
        let initSelectd = todos[indexPath.row].checked
        //配置初始数据
        CheckButton.isSelected = initSelectd
        ToDoLabel.text=todos[indexPath.row].name
        ToDoLabel.textColor = initSelectd ?.tertiaryLabel : .label
        // 三元运算符 ⬆️
        //        if todos[indexPath.row].checked{
        //            cell.ToDoLabel.textColor = .tertiaryLabel
        //        }else{
        //            cell.ToDoLabel.textColor = .label
        
        //        }
        
        
        
        //1.1 版本：增删改查：改数据 ！！！但是如果调用reload 会造成addAction两次调用，多次调用占用资源
        //        CheckButton.addAction(UIAction(handler:{ action in
        //            //修改数据
        //            self.todos[indexPath.row].checked.toggle()
        //            //根据最新的数据更新视图
        //            //移动完后要更新整个数据
        //            let checked = self.todos[indexPath.row].checked
        //            CheckButton.isSelected = checked
        //            ToDoLabel.textColor = checked ? .tertiaryLabel :.label
        //
        //        }), for: .touchUpInside)
        //        return cell  //当前那行显示的内容
        //    }
        
        
        
        //1.2版本：增删改查：改数据 优化版 （可能会数据越界，在测试中会闪退）
        //        if !isEditing{
        //            CheckButton.addAction(UIAction(handler:{ action in
        //                //修改数据
        //                self.todos[indexPath.row].checked.toggle()
        //                //根据最新的数据更新视图
        //                //移动完后要更新整个数据
        //                let checked = self.todos[indexPath.row].checked
        //                CheckButton.isSelected = checked
        //                ToDoLabel.textColor = checked ? .tertiaryLabel :.label
        //            }), for: .touchUpInside)
        //        }
        //            return cell  //当前那行显示的内容
        //        }
        
        
        //1.3版本：增删改查：改数据 超级无敌优化版
        //给用户添加一个点击事件，会出发action下的方法，self表示使用当前datasource
        //下面我定义一个方法，好不好使还不知道 10.18 179-1138 addTarget 与 addAction 真麻烦switf addiction还在开发就能上线离大谱
        CheckButton.tag = indexPath.row
        CheckButton.addTarget(self, action: #selector(toggleCheck), for: .touchUpInside)
        return cell
    }//事件监听 listener单独放了
    
    
    
    //增删改查 ： 删
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //左滑删除
        if editingStyle == .delete{
            //删除数据
            context.delete(todos[indexPath.row])
            todos.remove(at: indexPath.row)
           //先删除本地的todos 再删除内存todos
//如果先删除内存再删除本地的，导致delegate直接报错找不到对应的todos，indexPath加载的目前todos的数组下标
            appDelegate.saveContext()
            //根据最新数据更新视图
            tableView.reloadData()
        }else if editingStyle == .insert{
    }
        
}
    
    
    // 改-上下移动
    //
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let todoToRemove = todos[fromIndexPath.row]//移动的时候会改变数组顺序提前保存
        todos.remove(at: fromIndexPath.row)//被移动的cell
        todos.insert(todoToRemove, at: to.row)//重新移动到
        
//        saveData()
        
        //移动完后要更新整个数据！！！！一定
        tableView.reloadData()
        //        Swift里数组元素的移动(重新排序)
        //        var arr = [1,2,3,4]
        //        arr.remove(at: 0) //arr --> [2,3,4]
        //        arr.insert(1, at: 3) //arr --> [2,3,4,1]
        //        print(arr)

    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        90
//    }
    
}

