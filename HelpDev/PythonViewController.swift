//
//  PythonViewController.swift
//  HelpDev
//
//  Created by Alexandra Brown on 11/21/22.
//
import youtube_ios_player_helper
import UIKit

class PythonViewController: UIViewController {
    
    @IBOutlet var playerView1: YTPlayerView!
    @IBOutlet var playerView2: YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerView1.load(withVideoId: "rfscVS0vtbw")
        playerView2.load(withVideoId: "kqtD5dpn9C8")
        
    }
    
}
