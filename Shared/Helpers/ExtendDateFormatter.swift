import Foundation

class ExtendDateFormatter{
    private var _dateFormatter: DateFormatter
    
    init(){
        _dateFormatter = DateFormatter.init()
    }
    
    func shortDate() -> DateFormatter {
        _dateFormatter.dateStyle = .short
        return _dateFormatter
    }
    
    func shortTime() -> DateFormatter {
        _dateFormatter.dateFormat = "HH:mm"
        return _dateFormatter
    }
    
    func getTime(strDate: String) -> Date?{
        _dateFormatter.dateFormat = "HH:mm"
        let result = _dateFormatter.date(from: strDate)
        return result
    }
}
