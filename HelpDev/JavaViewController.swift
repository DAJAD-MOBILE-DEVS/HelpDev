//
//  JavaViewController.swift
//  HelpDev
//
//  Created by David Delgado on 11/15/22.
//
import youtube_ios_player_helper
import UIKit

class JavaViewController: UIViewController {

    
    @IBOutlet var playerView: YTPlayerView!
    @IBOutlet var playerView2: YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerView.load(withVideoId: "so1iUWaLmKA&t=6s&ab_channel=BroCode", playerVars: ["playsinline": 1])
        
        playerView2.load(withVideoId: "Rn16ugyorX0&ab_channel=BroCode", playerVars: ["playsinline": 1])
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
