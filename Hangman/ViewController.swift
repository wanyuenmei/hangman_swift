//
//  ViewController.swift
//  Hangman
//
//  Created by Yuen Mei Wan on 3/31/15.
//  Copyright (c) 2015 wanyuenmei. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet var hangmanImage : UIImageView!
    @IBOutlet var hangmanWordLabel : UILabel!
    @IBOutlet var current : UITextField!
    var correctWord = String()
    var wrongLetters = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var words = HangmanWords()
        correctWord = words.getWord()
        setupHangmanWord(correctWord)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkHangmanLetter() {
        var letter = String(current.text!)
        if ((correctWord as NSString).containsString(letter)) {
            for i in 0...countElements(correctWord) - 1 {
                var tempString = Array(correctWord)[i]
                if (letter == String(tempString)) {
                    var j = 0
                    var modifiedString = ""
                    for character in String(hangmanWordLabel.text!) {
                        if i == j {
                            modifiedString += letter
                        } else {
                            modifiedString += String(character)
                        }
                        j = j + 1
                    }
                }
            }
        } else {
            wrongLetters.stringByAppendingString(letter)
            switch countElements(wrongLetters) {
            case 1:
                hangmanImage.image = UIImage(contentsOfFile: "hang_1.png")
                break
            case 2:
                hangmanImage.image = UIImage(contentsOfFile: "hang_2.png")
                break
            case 3:
                hangmanImage.image = UIImage(contentsOfFile: "hang_3.png")
                break
            case 4:
                hangmanImage.image = UIImage(contentsOfFile: "hang_4.png")
                break
            case 5:
                hangmanImage.image = UIImage(contentsOfFile: "hang_5.png")
                break
            case 6:
                hangmanImage.image = UIImage(contentsOfFile: "hang_6.png")
                break
            default:
                setupHangmanWord(correctWord)
            }
        }
        current.text! = ""
    }
    
    func setupHangmanWord(hangmanWord: String) {
        wrongLetters = ""
        hangmanWordLabel.text = ""
        hangmanImage.image = UIImage(contentsOfFile: "hang_0.png")
        for i in 0...countElements(correctWord) - 1 {
            hangmanWordLabel.text = hangmanWordLabel.text?.stringByAppendingString("-")
        }
    }

}

