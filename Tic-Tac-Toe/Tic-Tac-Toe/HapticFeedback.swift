//
//  HapticFeedback.swift
//  Tic-Tac-Toe
//
//  Created by Gokul Nair on 17/10/20.
//  Copyright © 2020 Harsh Londhekar. All rights reserved.
//

import Foundation
import  AVKit

class haptickFeedback {

    func haptiFeedback1() {
  //print("haptick done")
  let generator = UINotificationFeedbackGenerator()
  generator.notificationOccurred(.success)
  }
  
 func haptiFeedback2() {
  //print("haptick done")
  let generator = UINotificationFeedbackGenerator()
      generator.notificationOccurred(.warning)
  }
}
