//
//  ViewController.swift
//  NLP
//
//  Created by Jacob on 9/8/17.
//  Copyright © 2017 RingCentral. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var analyseData:[String:[String]] = [:]
    
    var testdata :[String] = ["Yes. Thx",
                              "We already added the timeline, but the scope is not finalized, if needed,we can only add team management there. Is it what you expect?",
                              "Sophia Lin Can you please add 4.7 project overview slide in weekly report",
                              "I will add it into U.S planning list first",
                              "Jackie Karira  already took quite a lot of tasks in 4.7",
                              "Jackie Karira may take https://jira.ringcentral.com/browse/MTR-5044 --  Send the name field from device contacts to the Glip backend when a mThor user sends a SMS/MMS message -- ",
                              "https://meetings.ringcentral.com/j/1489913367 ",
                              "Patrice Khawam Tom Markworth Fred Yang Ted Jaffe  Glip weekly sync up meeting now",
                              "We planned to do it in v4.8",
                              "Fred Yang  The ticket for this task: MTR-5068 Data traffic control",
                              "can you have the ticket created and planned into a release?",
                              "Steve Chen Jacob Jiang  now we have the module to detect and report the network performance. Can we start implementing the traffic control in 4.7 based on the network status (low, medium, high) and traffic priority (low, medium, high)?",
                              "Was tonight's meeting cancelled?",
                              "Patrice mentioned it was auto renew",
                              "The benefit of the 4.6.x release with file admin is that we have real, large customers and prospects asking for the feature. It was on our roadmap for Q3--and in the MBOs of a few of us on the product team 🙂. So we just want to look at the dates if we separated it from 4.7. I'll help better coordinate these mobile cross-platform features going forward and take ownership for the dates on this project not converging properly. At some point, we hope to have a cross-team release manager that can work with local program managers to coordinate cross-team features better.",
                              "Please add 4.6.1 and 4.7 slides in weekly deck asap. thanks",
                              "hi all, since next Monday, both U.S and XMN will be off, I rescheduled the meeting to the same time on Wed PST time. Any question to the meeting time, please let me know.",
                              "VoIP tasks should be already in the weekly report",
                              "also invite Albert Gu  to attend the mThor weekly meeting.",
                              "Endpoint data collection (login, no-audio, etc.)",
                              "Sophia Lin Patricia Li  can you also add all VoIP tasks into the weekly update doc? e.g. VBR, RTCP-XR, etc.",
                              "hi all, due to there is an important crittersism crash issue, we will have a Patch 4.5.2 to fix it:https://jira.ringcentral.com/browse/MTR-5016 The current plan is: we will complete the testing early tomorrow and schedule to release it on 09/04 PST time, FYI.",
                              "--- The 'Add Files' entry point only for Android, iOS didn't support Add Files via App yet. 'Add Photos' entry point is applicable for both iOS and Android. (Just a entry point)",
                              "I think we already have that ticket. Anyway need to confirm again to make sure it is correct ticket. iOS: https://jira.ringcentral.com/browse/MTR-4181 Glip iOS - Company administration control over file sharing Android: https://jira.ringcentral.com/browse/MTR-4276 Company administration control over file sharing (Android) "
                              ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for str in testdata {
            parse(text: str)
        }
        for key in analyseData {
            print(key)
        }
        print(analyseData)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func parse(text:String)  {
        let tagger = NSLinguisticTagger(tagSchemes: [.lexicalClass], options: 0)
        let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]
        tagger.string = text
        
        let range = NSRange(location: 0, length: text.utf16.count)
        
        tagger.enumerateTags(in: range, unit: .word, scheme: .lexicalClass, options: options) { tag, tokenRange, stop in
            let word = (text as NSString).substring(with: tokenRange)
//            print("\(tag!.rawValue):\(word)")
            var testWords = analyseData[tag!.rawValue]
            if testWords == nil {
                testWords = [word]
            }
            else
            {
                testWords?.append(word)
            }
            analyseData[tag!.rawValue] = testWords
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

