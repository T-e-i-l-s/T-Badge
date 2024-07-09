import UIKit

class DataCache {
    static let shared = DataCache()
    
    private let cache = NSCache<NSString, NSData>()
    
    func getData(forKey key: String) -> NSData? {
        return cache.object(forKey: key as NSString)
    }
    
    func setData(_ data: NSData, forKey key: String) {
        cache.setObject(data, forKey: key as NSString)
    }
}
