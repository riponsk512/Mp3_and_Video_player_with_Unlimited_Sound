//
//  ViewController.swift
//  Mp3Playerdemo
//
//  Created by Ripon sk on 16/02/22.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    @IBOutlet weak var volumeis: UILabel!
    @IBOutlet weak var volumeslider: UISlider!
    @IBOutlet weak var musicbtn: UIButton!
    var avaudioplayer = AVAudioPlayer()
    var videoplayer = AVPlayer()
    
    @IBOutlet weak var videoslider: UISlider!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        avaudioplayer.pan = 32
        volumeslider.minimumValue = 0
        volumeslider.maximumValue = 1000
        let sound  = Bundle.main.path(forResource: "lung", ofType: "mp3")
        videoslider.minimumValue = 0
        videoslider.maximumValue = 1000
    
        let data = try! Data(contentsOf: URL(fileURLWithPath: sound!))
        do{
            avaudioplayer = try! AVAudioPlayer(data: data)
        }
        catch{
            print(error.localizedDescription)
        }
        let video = Bundle.main.path(forResource: "teranee", ofType: "mp4")
        videoplayer = try! AVPlayer(url: URL(fileURLWithPath: video!))
        let videolayer = AVPlayerLayer(player: videoplayer)
        videolayer.frame = self.view.bounds
        self.view.layer.addSublayer(videolayer)
       
    }

    @IBAction func playmusic(_ sender: UIButton) {
        
        if avaudioplayer.isPlaying{
            avaudioplayer.pause()
            sender.setTitle("Play", for: .normal)
        }
        else{
            avaudioplayer.play()
            sender.setTitle("Pause", for: .normal)
        }
    }
    
    @IBAction func volumeup(_ sender: UISlider) {
        let roundval = round(sender.value)
        avaudioplayer.volume = roundval
        volumeis.text = "Volume is:" + Int(sender.value).description
    }
    
    @IBAction func videoplay(_ sender: Any) {
        videoplayer.play()
        
    
    }
    
    @IBAction func videopause(_ sender: Any) {
        videoplayer.pause()
    }
    
    @IBAction func videovolumchange(_ sender: UISlider) {
        let rounds = round(sender.value)
        videoplayer.volume = rounds
        
    }
    
}
    


