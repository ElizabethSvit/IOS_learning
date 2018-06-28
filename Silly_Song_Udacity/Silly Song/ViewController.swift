//
//  ViewController.swift
//  Silly Song
//
//  Created by Elizaveta Svitanko on 26/06/2018.
//  Copyright © 2018 Elizaveta Svitanko. All rights reserved.
//

import UIKit

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func shortNameForName(name: String) -> String {
    let lowercaseName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    
    if let index = name.lowercased().rangeOfCharacter(from: vowelSet)?.lowerBound {
        return String(name[index...])
    }
    
    return lowercaseName
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameForName(name: fullName)
    
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
    }
}

