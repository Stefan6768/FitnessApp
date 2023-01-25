//
//  VideoViewController.swift
//  FitnessApp
//
//  Created by Stefan Schreiber on 09.01.23.
//

import UIKit
import YoutubePlayer_in_WKWebView

class VideoViewController: UIViewController {
    
let videosArray = [Videos(name: "Arm Training 5 min", video: "Z2DrCQOalBs"),
                   Videos(name: "Arm Training 10 min", video: "Eua2Erknyng"),
                   Videos(name: "Arm Training 15 min", video: "tecEZkOVRbw"),
                   Videos(name: "Bauch Training 5 min", video: "e_Z2tX5tkeI"),
                   Videos(name: "Bauch Training 10 min", video: "7P4-W0D21fg"),
                   Videos(name: "Bauch Training 15 min", video: "jUa00O7whXg"),
                   Videos(name: "Bein Training 5 min", video: "T3epz_U0eCc"),
                   Videos(name: "Bein Training 10 min", video: "MTl4QRkxZyk"),
                   Videos(name: "Bein Training 15 min", video: "scDW9DU67h0"),
                   Videos(name: "Cardio Training 5 min", video: "XGtjACeyHtc"),
                   Videos(name: "Cardio Training 10 min", video: "Spc5yl47h1Y"),
                   Videos(name: "Cardio Training 15 min", video: "MDz69fDWxYM"),
                   Videos(name: "Ganz Körper Training 5 min", video: "Q6DOnqC_K4U"),
                   Videos(name: "Ganz Körper Training 10 min", video: "oX_5p0cEU4g"),
                   Videos(name: "Ganz Körper Training 15 min", video: "2r2pSjrfx5Y"),
                   Videos(name: "Po Training 5 min", video: "zXc9ea3gyyY"),
                   Videos(name: "Po Training 10 min", video: "wfuEfdpvZKw"),
                   Videos(name: "Po Training 15 min", video: "s9aAE9mn8hE"),
                   Videos(name: "Yoga Training 5 min", video: "w4FCGciGIms"),
                   Videos(name: "Yoga Training 10 min", video: "s6Jazu4oXls"),
                   Videos(name: "Yoga Training 15 min", video: "p7X-GpjtU1M"),
                   Videos(name: "BOP Training 5 min", video: "y87nT-l4fyY"),
                   Videos(name: "BOP Training 10 min", video: "oZ7LL5HGhAU"),
                   Videos(name: "BOP Training 15 min", video: "NG6BEaF3wqA")]
    
    
    @IBOutlet weak var videoPlayer: WKYTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        videoPlayer.load(withVideoId: "y87nT-l4fyY")
       
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
