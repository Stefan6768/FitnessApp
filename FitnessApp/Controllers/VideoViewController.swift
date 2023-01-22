//
//  VideoViewController.swift
//  FitnessApp
//
//  Created by Stefan Schreiber on 09.01.23.
//

import UIKit
import YoutubePlayer_in_WKWebView

class VideoViewController: UIViewController {
    
let videosArray = [Videos(name: "Arm Training 5 min", video: "oMRpFK5QjBY"),
                   Videos(name: "Arm Training 10 min", video: ""),
                   Videos(name: "Arm Training 15 min", video: "")]
    
    
    @IBOutlet weak var videoPlayer: WKYTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        videoPlayer.load(withVideoId: "e_Z2tX5tkeI")
       
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
