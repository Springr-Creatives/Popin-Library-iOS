import LiveKit
import UIKit

class ParticipantCell: UICollectionViewCell {
    public static let reuseIdentifier: String = "ParticipantCell"
    
    public static var instanceCounter: Int = 0
    
    public let cellId: Int
    
    public let videoView: VideoView = {
        let r = VideoView()
        r.layoutMode = .fill
        r.backgroundColor = UIColor.clear.withAlphaComponent(0)
        r.clipsToBounds = true
        r.isDebugMode = false
        return r
    }()
    
    public let noVideoImage: UIImageView = {
        let n = UIImageView()
        n.image = UIImage(systemName: "video.slash.fill")  // Set the image directly for UIImageView
        n.contentMode = .scaleAspectFit               // Optional: Set content mode for better scaling
        return n
    }()
    
    
    // weak reference to the Participant
    public weak var participant: Participant? {
        didSet {
            guard oldValue != participant else { return }
            
            if let oldValue {
                // un-listen previous participant's events
                // in case this cell gets reused.
                oldValue.remove(delegate: self)
                videoView.track = nil
                
            }
            
            if let participant {
                // listen to events
                participant.add(delegate: self)
                setFirstVideoTrack()
                
                
                // make sure the cell will call layoutSubviews()
                setNeedsLayout()
            }
        }
    }
    
    override init(frame: CGRect) {
        Self.instanceCounter += 1
        cellId = Self.instanceCounter
        
        super.init(frame: frame)
        print("\(String(describing: self)) init, instances: \(Self.instanceCounter)")
        backgroundColor = .lightGray
        contentView.addSubview(videoView)
        contentView.addSubview(noVideoImage)
        
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        Self.instanceCounter -= 1
        
        print("\(String(describing: self)) deinit, instances: \(Self.instanceCounter)")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        print("prepareForReuse, cellId: \(cellId)")
        
        participant = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        videoView.frame = contentView.bounds
        videoView.setNeedsLayout()
        let imageSize = CGSize(width: 30, height: 30)
        
        // Set the frame for the image view to center it
        noVideoImage.frame = CGRect(
            x: (contentView.bounds.width - imageSize.width) / 2,  // Center horizontally
            y: (contentView.bounds.height - imageSize.height) / 2,  // Center vertically
            width: imageSize.width,
            height: imageSize.height
        )
    }
    
    private func setFirstVideoTrack() {
        let track = participant?.firstCameraVideoTrack
        videoView.track = track
    }
}

extension ParticipantCell: ParticipantDelegate {
    func participant(_: RemoteParticipant, didSubscribeTrack trackPublication: RemoteTrackPublication) {
        print("didSubscribe")
        DispatchQueue.main.async { [weak self] in
            if (trackPublication.track?.kind == .video) {
                self?.noVideoImage.isHidden = true
            }
            self?.setFirstVideoTrack()
        }
    }
    
    func participant(_: RemoteParticipant, didUnsubscribeTrack trackPublication: RemoteTrackPublication) {
        print("didUnsubscribe")
        DispatchQueue.main.async { [weak self] in
            if (trackPublication.track?.kind == .video) {
                self?.noVideoImage.isHidden = false
            }
            self?.setFirstVideoTrack()
        }
    }
    
    func participant(_ participant: Participant, trackPublication: TrackPublication, didUpdateIsMuted isMuted: Bool) {
        DispatchQueue.main.async { [weak self] in
            if (trackPublication.track?.kind == .video) {
                self?.noVideoImage.isHidden = !isMuted
                if (isMuted) {
                    self?.videoView.isHidden = true
                } else {
                    self?.videoView.isHidden = false
                }
            }
        }
    }
}
