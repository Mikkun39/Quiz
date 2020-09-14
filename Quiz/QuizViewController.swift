//
//  QuizViewController.swift
//  Quiz
//
//  Created by 高山瑞基 on 2020/09/14.
//  Copyright © 2020 Takayama Mizuki. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    //問題文を格納する配列
    var quizArray = [Any]()
    
    //正解数を数えるための変数
    var correctAnswer: Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //quizArrayに問題文、3つの選択肢、答えの番号が入った配列を追加
        quizArray.append(["2007～2008シーズンの優勝チームは？","ロサンゼルスレイカーズ", "ボストンセルティックス", "サンアントニオスパーズ",2])
        quizArray.append(["バスケットの神様と呼ばれるNBA史上最高の選手は？", "レブロン・ジェームズ", "コービー・ブライアント", "マイケル・ジョーダン",3])
        quizArray.append(["次のフランチャイズのうち、創設当時から本拠地の場所が変わっていないのは？", "アトランタ・ホークス","デトロイト・ピストンズ","ニューヨーク・ニックス",3])
        
        //問題文をシャッフル
        quizArray.shuffle()
        
        choiceQuiz()

        // Do any additional setup after loading the view.
    }
    
    func choiceQuiz() {
        //一時的にクイズを取り出しておく配列
        let tmpArray = quizArray[0] as! [Any]
        
        //問題文を表示
        quizTextView.text = tmpArray[0] as? String
        
        //選択肢にそれぞれの選択肢をセット
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    //セグエを準備する時に呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
    }
    
    
    @IBAction func choiceAnswer(sender: UIButton) {
        //引数のsender.tagに格納されているTagの値を使って処理を区別する
        let tmpArray = quizArray[0] as! [Any]
        
        if tmpArray[4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer = correctAnswer + 1
        }
        
        //解いた問題をquizArrayから取り除く
        quizArray.remove(at: 0)
        
        //解いた問題数の合計があらかじめ設定されていた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
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
