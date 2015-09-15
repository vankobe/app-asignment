//
//  ViewController.swift
//  AppAsignment
//
//  Created by 江上真人 on 2015/08/18.
//  Copyright (c) 2015年 eversense. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    var selectedUrl: String?
    var articleList : Results<Article>!

    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        articleList = Realm().objects(Article)
        let ud = NSUserDefaults.standardUserDefaults()
        var articleType : String? = ud.objectForKey("articleType") as? String
        println(articleType)
        if let type = articleType {
            if type != "0" {
                var cond = "type = " + type
                articleList = articleList.filter(cond)
            }
        }
        if(articleList.count < 2){
            self.insertData()
        }
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        var text = articleList[indexPath.row].title
        var label = cell.textLabel
        cell.textLabel?.text = text
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedUrl = articleList[indexPath.row].url
        println(selectedUrl)
        performSegueWithIdentifier("toSubViewController", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "toSubViewController"){
            let subVC: SubViewController = (segue.destinationViewController as? SubViewController)!
            subVC.viewUrl = selectedUrl!
        }
    }
    
    func insertData(){
        let realm = Realm()
        
        let a1 = Article(value: ["id": 1, "type": 1, "title": "妊娠2週目！妊婦の症状は？体の変化や兆候はあるの？", "url": "http://192abc.com/28010"])
        let a2 = Article(value: ["id": 2, "type": 1, "title": "【妊活】受精から着床までの流れや仕組み、時期を解説！", "url": "http://192abc.com/13374"])
        let a3 = Article(value: ["id": 3, "type": 2, "title": "【妊娠超初期症状】受精から着床までの症状まとめ。もしかして妊娠？","url": "http://192abc.com/13381"])
        let a4 = Article(value: ["id": 4, "type": 2, "title": "インプランテーションディップとは？着床時に基礎体温が下がる？", "url": "http://192abc.com/30783"])
        let a5 = Article(value: ["id": 5, "type": 1, "title": "【妊婦、妊活中の方必見】保険の基本！生命保険には３タイプしかない！（終身、定期、養老）", "url": "http://192abc.com/14449"])
        let a6 = Article(value: ["id": 6, "type": 1, "title": "【妊娠超初期症状】妊娠兆候の基礎体温とは？時期と体温を知ろう！", "url": "http://192abc.com/11711"])
        let a7 = Article(value: ["id": 7, "type": 2, "title": "妊娠初期症状まとめ。妊娠兆候はいつから？", "url": "http://192abc.com/archives/pregnancy-childbirth20140529"])
        realm.write{
            realm.add(a1)
            realm.add(a2)
            realm.add(a3)
            realm.add(a4)
            realm.add(a5)
            realm.add(a6)
            realm.add(a7)
        }
        
    }
    
    @IBAction func backWithSegue(let segue: UIStoryboardSegue) {
        let ud = NSUserDefaults.standardUserDefaults()
        if segue.identifier == "Unwind1" {
            ud.setObject("1", forKey: "articleType")
        } else if segue.identifier == "Unwind2" {
            ud.setObject("2", forKey: "articleType")
        } else if segue.identifier == "Unwindall" {
            ud.setObject("0", forKey: "articleType")
        }
        println(segue.identifier)
        println("back")
        self.viewDidLoad()
    }
}