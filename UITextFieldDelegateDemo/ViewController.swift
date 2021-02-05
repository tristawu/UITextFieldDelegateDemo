//
//  ViewController.swift
//  UITextFieldDelegateDemo
//
//  Created by Trista on 2021/2/5.
//

import UIKit

//為 UITextField 設置了一個委任的對象:self 也就是 ViewController 本身，所以要為 ViewController 加上協定UITextFieldDelegate
class ViewController: UIViewController, UITextFieldDelegate {

    //取得螢幕的尺寸
    let fullScreenSize = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //使用 UITextField(frame:) 建立一個 UITextField
        let myTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        
        //設置於畫面的中間偏上位置
        myTextField.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.3)
        
        //尚未輸入時的預設顯示提示文字
        myTextField.placeholder = "請輸入文字"

        //輸入框的樣式 這邊選擇圓角樣式
        myTextField.borderStyle = .roundedRect

        //輸入框右邊顯示清除按鈕時機:選擇當編輯時顯示
        myTextField.clearButtonMode = .whileEditing

        //輸入框適用的鍵盤:選擇適用輸入 Email 的鍵盤(會有 @ 跟 . 可供輸入)
        myTextField.keyboardType = .emailAddress

        //鍵盤上的 return 鍵樣式:選擇 Done
        myTextField.returnKeyType = .done

        //輸入文字的顏色
        myTextField.textColor = UIColor.white

        //輸入文字的排列方式
        myTextField.textAlignment = .left
        
        //UITextField 的背景顏色
        myTextField.backgroundColor = UIColor.lightGray
        
        //輸入內容的鍵盤上會有一個完成的按鈕(通常位於鍵盤的右下角Return鍵)。不會實際把按下完成按鈕會做什麼事寫死在元件裡，而是設計成委任模式
        //表示有一個事件(即按下完成後要做的事)待完成，交給委任的對象來實作:交由 self 也就是 ViewController 本身
        //交付委任對象的方式，就是要設置delegate屬性
        myTextField.delegate = self
        
        //加入畫面
        self.view.addSubview(myTextField)
        
    }

    
    //依據委任的協定來建立應該要實作的方法:按下return按鈕時
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //結束編輯,把鍵盤隱藏起來
        self.view.endEditing(true)

        return true
    }
    
}

