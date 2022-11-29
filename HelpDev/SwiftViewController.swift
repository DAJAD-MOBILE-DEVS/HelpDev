//
//  SwiftViewController.swift
//  HelpDev
//
//  Created by Joseph Bargallo on 11/21/22.
//

import youtube_ios_player_helper
import UIKit

class SwiftViewController: UIViewController, YTPlayerViewDelegate{
    
    @IBOutlet var playervView1: YTPlayerView!
    @IBOutlet var playervView2: YTPlayerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        playervView1.delegate = self
        playervView1.load(withVideoId: "F2ojC6TNwws", playerVars: ["playsinline":1])
        playervView2.load(withVideoId: "F2ojC6TNwws", playerVars: ["playsinline":1])

        // Do any additional setup after loading the view.
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
