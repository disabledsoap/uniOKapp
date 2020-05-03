
import UIKit

struct CalendarStruct : Codable {
    var cDate = ""
    var cColor = ""
}

class CalendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
  
    @IBOutlet weak var FeelingsView: UIView!
    @IBOutlet var CalendarView: UIView!
    @IBOutlet weak var Calendar: UICollectionView!
    @IBOutlet weak var MonthLabel: UILabel!
    
    let loadDefaults = UserDefaults.standard
    
    let Months = ["January","February","March","April","May","June","July","August","September","October","November","December"]
    
    let DaysOfMonth = ["Monday","Thuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    
    var DaysInMonths = [31,28,31,30,31,30,31,31,30,31,30,31]
    
    var currentMonth = String()
    
    var NumberOfEmptyBox = Int()
    
    var NextNumberOfEmptyBox = Int()
    
    var PreviousNumberOfEmptyBox = 0
    
    var Direction = 0
    
    var PositionIndex = 0
    
    var LeapYearCounter = 2
    
    var dayCounter = 0
    
    var calendarData = [CalendarStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        calendarData = [
            CalendarStruct(cDate: "01.05.2020", cColor: "happy"), //index 0
            CalendarStruct(cDate: "02.05.2020", cColor: ""), //index 1
            CalendarStruct(cDate: "03.05.2020", cColor: ""), //index 2
            CalendarStruct(cDate: "04.05.2020", cColor: ""), //index 3
            CalendarStruct(cDate: "05.05.2020", cColor: ""), //index 4
            CalendarStruct(cDate: "06.05.2020", cColor: ""), //index 5
            CalendarStruct(cDate: "07.05.2020", cColor: ""), //index 6
            CalendarStruct(cDate: "08.05.2020", cColor: ""), //index 7
            CalendarStruct(cDate: "09.05.2020", cColor: ""), //index 8
            CalendarStruct(cDate: "10.05.2020", cColor: ""), //index 9
            CalendarStruct(cDate: "11.05.2020", cColor: ""), //index 10
            CalendarStruct(cDate: "12.05.2020", cColor: ""), //index 11
            CalendarStruct(cDate: "13.05.2020", cColor: ""), //index 12
            CalendarStruct(cDate: "14.05.2020", cColor: ""), //index 13
            CalendarStruct(cDate: "15.05.2020", cColor: ""), //index 14
            CalendarStruct(cDate: "16.05.2020", cColor: ""), //index 15
            CalendarStruct(cDate: "17.05.2020", cColor: ""), //index 16
            CalendarStruct(cDate: "18.05.2020", cColor: ""), //index 17
            CalendarStruct(cDate: "19.05.2020", cColor: ""), //index 18
            CalendarStruct(cDate: "20.05.2020", cColor: ""), //index 19
            CalendarStruct(cDate: "21.05.2020", cColor: ""), //index 20
            CalendarStruct(cDate: "22.05.2020", cColor: ""), //index 21
            CalendarStruct(cDate: "23.05.2020", cColor: ""), //index 22
            CalendarStruct(cDate: "24.05.2020", cColor: ""), //index 23
            CalendarStruct(cDate: "25.05.2020", cColor: ""), //index 24
            CalendarStruct(cDate: "26.05.2020", cColor: ""), //index 25
            CalendarStruct(cDate: "27.05.2020", cColor: ""), //index 26
            CalendarStruct(cDate: "28.05.2020", cColor: ""), //index 27
            CalendarStruct(cDate: "29.05.2020", cColor: ""), //index 28
            CalendarStruct(cDate: "30.05.2020", cColor: ""), //index 29
            CalendarStruct(cDate: "31.05.2020", cColor: ""), //index 30
            CalendarStruct(cDate: "01.06.2020", cColor: ""), //index 31
            CalendarStruct(cDate: "02.06.2020", cColor: ""), //index 32
            CalendarStruct(cDate: "03.06.2020", cColor: ""), //index 33
            CalendarStruct(cDate: "04.06.2020", cColor: ""), //index 34
            CalendarStruct(cDate: "05.06.2020", cColor: ""), //index 35
            CalendarStruct(cDate: "06.06.2020", cColor: ""), //index 36
            CalendarStruct(cDate: "07.06.2020", cColor: ""), //index 37
            CalendarStruct(cDate: "08.06.2020", cColor: ""), //index 38
            CalendarStruct(cDate: "09.06.2020", cColor: ""), //index 39
            CalendarStruct(cDate: "10.06.2020", cColor: ""), //index 40
        ]
        
        CalendarView.layer.cornerRadius = 18
        FeelingsView.layer.cornerRadius = 18
        MonthLabel.layer.cornerRadius = 8
        
        saveData()
        loadData()
        
        currentMonth = Months[month]
        MonthLabel.text = "\(currentMonth) \(year)"
        if weekday == 0 {
            weekday = 7
        }
        GetStartDateDayPosition()
        
        if let name = loadDefaults.string(forKey: "savename") {
            self.title = name
        } else {
            self.title = "About me"
        }
    }
    
    //-----------(Calculates the number of "empty" boxes at the start of every month")------------------------------------------------------
    
    func GetStartDateDayPosition() {
        switch Direction{
        case 0:
            NumberOfEmptyBox = weekday
            dayCounter = day
            while dayCounter>0 {
                NumberOfEmptyBox = NumberOfEmptyBox - 1
                dayCounter = dayCounter - 1
                if NumberOfEmptyBox == 0 {
                    NumberOfEmptyBox = 7
                }
            }
            if NumberOfEmptyBox == 7 {
                NumberOfEmptyBox = 0
            }
            PositionIndex = NumberOfEmptyBox
        case 1...:
            NextNumberOfEmptyBox = (PositionIndex + DaysInMonths[month])%7
            PositionIndex = NextNumberOfEmptyBox
            
        case -1:
            PreviousNumberOfEmptyBox = (7 - (DaysInMonths[month] - PositionIndex)%7)
            if PreviousNumberOfEmptyBox == 7 {
                PreviousNumberOfEmptyBox = 0
            }
            PositionIndex = PreviousNumberOfEmptyBox
        default:
            fatalError()
        }
    }
    
    

    //--------------------------------------------------(Next and back buttons)-------------------------------------------------------------
    @IBAction func Next(_ sender: Any) {
        switch currentMonth {
        case "December":
            Direction = 1
            
            month = 0
            year += 1
            
            if LeapYearCounter  < 5 {
                LeapYearCounter += 1
            }
            
            if LeapYearCounter == 4 {
                DaysInMonths[1] = 29
            }
            
            if LeapYearCounter == 5{
                LeapYearCounter = 1
                DaysInMonths[1] = 28
            }
            GetStartDateDayPosition()
            
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            
            Calendar.reloadData()
        default:
            Direction = 1
            
            GetStartDateDayPosition()
            
            month += 1
            
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            
            Calendar.reloadData()
        }
    }
    
    
    
    @IBAction func Back(_ sender: Any) {
        switch currentMonth {
        case "January":
            Direction = -1
            
            month = 11
            year -= 1
            
            if LeapYearCounter > 0{
                LeapYearCounter -= 1
            }
            if LeapYearCounter == 0{
                DaysInMonths[1] = 29
                LeapYearCounter = 4
            }else{
                DaysInMonths[1] = 28
            }
            
            GetStartDateDayPosition()
            
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
            
        default:
            Direction = -1
            
            month -= 1
            
            GetStartDateDayPosition()
            
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
        }
    }
    
    func saveData() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(calendarData), forKey:"saveData")
    }
    
    func loadData() {
        if let data = UserDefaults.standard.value(forKey:"saveData") as? Data {
            
            let data = try? PropertyListDecoder().decode(Array<CalendarStruct>.self, from: data)
            
            calendarData = data ?? [CalendarStruct(cDate: "", cColor: "")]
            
        }
    }

    //----------------------------------(CollectionView)------------------------------------------------------------------------------------
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch Direction{
        case 0:
            return DaysInMonths[month] + NumberOfEmptyBox
        case 1...:
            return DaysInMonths[month] + NextNumberOfEmptyBox
        case -1:
            return DaysInMonths[month] + PreviousNumberOfEmptyBox
        default:
            fatalError()
        }
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DateCollectionViewCell
        
        let day   = indexPath.row + 1 - NumberOfEmptyBox
        let month = Months[calendar.component(.month, from: date) - 1]
        let year  = calendar.component(.year, from: date)
        
        let CDate = "\(indexPath.row + 1 - NumberOfEmptyBox).\(Months[calendar.component(.month, from: date)]).\(calendar.component(.year, from: date))"
        
        
        
        var index = Int()
        
        func setColor(color: String = "") -> UIColor {
            switch color {
            case "none":
                return UIColor.clear
                
            case "angry":
                return UIColor(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
                
            case "anxious":
                return UIColor(red: 0.7148833619, green: 0.5779798397, blue: 1, alpha: 1)
                
            case "nervous":
                return UIColor(red: 0.8792963126, green: 0.7901931984, blue: 0.9764705896, alpha: 1)
                
            case "sad":
                return UIColor(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)
                
            case "happy":
                return UIColor(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
                
            case "calm":
                return UIColor(red: 1, green: 0.9141723998, blue: 0.9191490494, alpha: 1)
                
            case "depressed":
                return UIColor(red: 0.8263478293, green: 0.9742921929, blue: 0.9764705896, alpha: 1)
                
            default:
                return UIColor.clear
            }
        }
    
        let formatter1 = DateFormatter()
        let formatter2 = DateFormatter()
        let formatter3 = DateFormatter()
        formatter1.dateFormat = "MM yyyy"
        formatter2.dateFormat = "dd"
        formatter3.dateFormat = "dd.MM.yyyy"
        let result1 = formatter1.string(from: date)
        let result2 = formatter2.string(from: date)
        let result3 = formatter3.string(from: date)
        let dateresult1 = "\(MonthLabel)"
        let dateresult2 = "\(cell.DateLabel)"
        
        print(result3)
        
        switch ColorValueVC.shared.ColorValue {
        case 0:
            switch result3 {
            case "01.05.2020":
                calendarData[0].cColor = "none"
            case "02.05.2020":
                calendarData[1].cColor = "none"
            case "03.05.2020":
                calendarData[2].cColor = "none"
            case "04.05.2020":
                calendarData[3].cColor = "none"
            case "05.05.2020":
                calendarData[4].cColor = "none"
            case "06.05.2020":
                calendarData[5].cColor = "none"
            case "07.05.2020":
                calendarData[6].cColor = "none"
            case "08.05.2020":
                calendarData[7].cColor = "none"
            case "09.05.2020":
                calendarData[8].cColor = "none"
            case "10.05.2020":
                calendarData[9].cColor = "none"
            case "11.05.2020":
                calendarData[10].cColor = "none"
            case "12.05.2020":
                calendarData[11].cColor = "none"
            case "13.05.2020":
                calendarData[12].cColor = "none"
            case "14.05.2020":
                calendarData[13].cColor = "none"
            case "15.05.2020":
                calendarData[14].cColor = "none"
            case "16.05.2020":
                calendarData[15].cColor = "none"
            case "17.05.2020":
                calendarData[16].cColor = "none"
            case "18.05.2020":
                calendarData[17].cColor = "none"
            case "19.05.2020":
                calendarData[18].cColor = "none"
            case "20.05.2020":
                calendarData[19].cColor = "none"
            case "21.05.2020":
                calendarData[20].cColor = "none"
            case "22.05.2020":
                calendarData[21].cColor = "none"
            case "23.05.2020":
                calendarData[22].cColor = "none"
            case "24.05.2020":
                calendarData[23].cColor = "none"
            case "25.05.2020":
                calendarData[24].cColor = "none"
            case "26.05.2020":
                calendarData[25].cColor = "none"
            case "27.05.2020":
                calendarData[26].cColor = "none"
            case "28.05.2020":
                calendarData[27].cColor = "none"
            case "29.05.2020":
                calendarData[28].cColor = "none"
            case "30.05.2020":
                calendarData[29].cColor = "none"
            case "31.05.2020":
                calendarData[30].cColor = "none"
            case "01.06.2020":
                calendarData[31].cColor = "none"
            case "02.06.2020":
                calendarData[32].cColor = "none"
            case "03.06.2020":
                calendarData[33].cColor = "none"
            case "04.06.2020":
                calendarData[34].cColor = "none"
            case "05.06.2020":
                calendarData[35].cColor = "none"
            case "06.06.2020":
                calendarData[36].cColor = "none"
            case "07.06.2020":
                calendarData[37].cColor = "none"
            case "08.06.2020":
                calendarData[38].cColor = "none"
            case "09.06.2020":
                calendarData[39].cColor = "none"
            case "10.06.2020":
                calendarData[40].cColor = "none"
            default:
                print ("ERROR")
            }
        case 1:
            switch result3 {
            case "01.05.2020":
                calendarData[0].cColor = "anxious"
            case "02.05.2020":
                calendarData[1].cColor = "anxious"
            case "03.05.2020":
                calendarData[2].cColor = "anxious"
            case "04.05.2020":
                calendarData[3].cColor = "anxious"
            case "05.05.2020":
                calendarData[4].cColor = "anxious"
            case "06.05.2020":
                calendarData[5].cColor = "anxious"
            case "07.05.2020":
                calendarData[6].cColor = "anxious"
            case "08.05.2020":
                calendarData[7].cColor = "anxious"
            case "09.05.2020":
                calendarData[8].cColor = "anxious"
            case "10.05.2020":
                calendarData[9].cColor = "anxious"
            case "11.05.2020":
                calendarData[10].cColor = "anxious"
            case "12.05.2020":
                calendarData[11].cColor = "anxious"
            case "13.05.2020":
                calendarData[12].cColor = "anxious"
            case "14.05.2020":
                calendarData[13].cColor = "anxious"
            case "15.05.2020":
                calendarData[14].cColor = "anxious"
            case "16.05.2020":
                calendarData[15].cColor = "anxious"
            case "17.05.2020":
                calendarData[16].cColor = "anxious"
            case "18.05.2020":
                calendarData[17].cColor = "anxious"
            case "19.05.2020":
                calendarData[18].cColor = "anxious"
            case "20.05.2020":
                calendarData[19].cColor = "anxious"
            case "21.05.2020":
                calendarData[20].cColor = "anxious"
            case "22.05.2020":
                calendarData[21].cColor = "anxious"
            case "23.05.2020":
                calendarData[22].cColor = "anxious"
            case "24.05.2020":
                calendarData[23].cColor = "anxious"
            case "25.05.2020":
                calendarData[24].cColor = "anxious"
            case "26.05.2020":
                calendarData[25].cColor = "anxious"
            case "27.05.2020":
                calendarData[26].cColor = "anxious"
            case "28.05.2020":
                calendarData[27].cColor = "anxious"
            case "29.05.2020":
                calendarData[28].cColor = "anxious"
            case "30.05.2020":
                calendarData[29].cColor = "anxious"
            case "31.05.2020":
                calendarData[30].cColor = "anxious"
            case "01.06.2020":
                calendarData[31].cColor = "anxious"
            case "02.06.2020":
                calendarData[32].cColor = "anxious"
            case "03.06.2020":
                calendarData[33].cColor = "anxious"
            case "04.06.2020":
                calendarData[34].cColor = "anxious"
            case "05.06.2020":
                calendarData[35].cColor = "anxious"
            case "06.06.2020":
                calendarData[36].cColor = "anxious"
            case "07.06.2020":
                calendarData[37].cColor = "anxious"
            case "08.06.2020":
                calendarData[38].cColor = "anxious"
            case "09.06.2020":
                calendarData[39].cColor = "anxious"
            case "10.06.2020":
                calendarData[40].cColor = "anxious"
            default:
                print ("ERROR")
            }

        case 2:
            switch result3 {
            case "01.05.2020":
                calendarData[0].cColor = "nervous"
            case "02.05.2020":
                calendarData[1].cColor = "nervous"
            case "03.05.2020":
                calendarData[2].cColor = "nervous"
            case "04.05.2020":
                calendarData[3].cColor = "nervous"
            case "05.05.2020":
                calendarData[4].cColor = "nervous"
            case "06.05.2020":
                calendarData[5].cColor = "nervous"
            case "07.05.2020":
                calendarData[6].cColor = "nervous"
            case "08.05.2020":
                calendarData[7].cColor = "nervous"
            case "09.05.2020":
                calendarData[8].cColor = "nervous"
            case "10.05.2020":
                calendarData[9].cColor = "nervous"
            case "11.05.2020":
                calendarData[10].cColor = "nervous"
            case "12.05.2020":
                calendarData[11].cColor = "nervous"
            case "13.05.2020":
                calendarData[12].cColor = "nervous"
            case "14.05.2020":
                calendarData[13].cColor = "nervous"
            case "15.05.2020":
                calendarData[14].cColor = "nervous"
            case "16.05.2020":
                calendarData[15].cColor = "nervous"
            case "17.05.2020":
                calendarData[16].cColor = "nervous"
            case "18.05.2020":
                calendarData[17].cColor = "nervous"
            case "19.05.2020":
                calendarData[18].cColor = "nervous"
            case "20.05.2020":
                calendarData[19].cColor = "nervous"
            case "21.05.2020":
                calendarData[20].cColor = "nervous"
            case "22.05.2020":
                calendarData[21].cColor = "nervous"
            case "23.05.2020":
                calendarData[22].cColor = "nervous"
            case "24.05.2020":
                calendarData[23].cColor = "nervous"
            case "25.05.2020":
                calendarData[24].cColor = "nervous"
            case "26.05.2020":
                calendarData[25].cColor = "nervous"
            case "27.05.2020":
                calendarData[26].cColor = "nervous"
            case "28.05.2020":
                calendarData[27].cColor = "nervous"
            case "29.05.2020":
                calendarData[28].cColor = "nervous"
            case "30.05.2020":
                calendarData[29].cColor = "nervous"
            case "31.05.2020":
                calendarData[30].cColor = "nervous"
            case "01.06.2020":
                calendarData[31].cColor = "nervous"
            case "02.06.2020":
                calendarData[32].cColor = "nervous"
            case "03.06.2020":
                calendarData[33].cColor = "nervous"
            case "04.06.2020":
                calendarData[34].cColor = "nervous"
            case "05.06.2020":
                calendarData[35].cColor = "nervous"
            case "06.06.2020":
                calendarData[36].cColor = "nervous"
            case "07.06.2020":
                calendarData[37].cColor = "nervous"
            case "08.06.2020":
                calendarData[38].cColor = "nervous"
            case "09.06.2020":
                calendarData[39].cColor = "nervous"
            case "10.06.2020":
                calendarData[40].cColor = "nervous"
            default:
                print ("ERROR")
            }
        case 3:
            switch result3 {
            case "01.05.2020":
                calendarData[0].cColor = "sad"
            case "02.05.2020":
                calendarData[1].cColor = "sad"
            case "03.05.2020":
                calendarData[2].cColor = "sad"
            case "04.05.2020":
                calendarData[3].cColor = "sad"
            case "05.05.2020":
                calendarData[4].cColor = "sad"
            case "06.05.2020":
                calendarData[5].cColor = "sad"
            case "07.05.2020":
                calendarData[6].cColor = "sad"
            case "08.05.2020":
                calendarData[7].cColor = "sad"
            case "09.05.2020":
                calendarData[8].cColor = "sad"
            case "10.05.2020":
                calendarData[9].cColor = "sad"
            case "11.05.2020":
                calendarData[10].cColor = "sad"
            case "12.05.2020":
                calendarData[11].cColor = "sad"
            case "13.05.2020":
                calendarData[12].cColor = "sad"
            case "14.05.2020":
                calendarData[13].cColor = "sad"
            case "15.05.2020":
                calendarData[14].cColor = "sad"
            case "16.05.2020":
                calendarData[15].cColor = "sad"
            case "17.05.2020":
                calendarData[16].cColor = "sad"
            case "18.05.2020":
                calendarData[17].cColor = "sad"
            case "19.05.2020":
                calendarData[18].cColor = "sad"
            case "20.05.2020":
                calendarData[19].cColor = "sad"
            case "21.05.2020":
                calendarData[20].cColor = "sad"
            case "22.05.2020":
                calendarData[21].cColor = "sad"
            case "23.05.2020":
                calendarData[22].cColor = "sad"
            case "24.05.2020":
                calendarData[23].cColor = "sad"
            case "25.05.2020":
                calendarData[24].cColor = "sad"
            case "26.05.2020":
                calendarData[25].cColor = "sad"
            case "27.05.2020":
                calendarData[26].cColor = "sad"
            case "28.05.2020":
                calendarData[27].cColor = "sad"
            case "29.05.2020":
                calendarData[28].cColor = "sad"
            case "30.05.2020":
                calendarData[29].cColor = "sad"
            case "31.05.2020":
                calendarData[30].cColor = "sad"
            case "01.06.2020":
                calendarData[31].cColor = "sad"
            case "02.06.2020":
                calendarData[32].cColor = "sad"
            case "03.06.2020":
                calendarData[33].cColor = "sad"
            case "04.06.2020":
                calendarData[34].cColor = "sad"
            case "05.06.2020":
                calendarData[35].cColor = "sad"
            case "06.06.2020":
                calendarData[36].cColor = "sad"
            case "07.06.2020":
                calendarData[37].cColor = "sad"
            case "08.06.2020":
                calendarData[38].cColor = "sad"
            case "09.06.2020":
                calendarData[39].cColor = "sad"
            case "10.06.2020":
                calendarData[40].cColor = "sad"
            default:
                print ("ERROR")
            }
        case 4:
            switch result3 {
            case "01.05.2020":
                calendarData[0].cColor = "happy"
            case "02.05.2020":
                calendarData[1].cColor = "happy"
            case "03.05.2020":
                calendarData[2].cColor = "happy"
            case "04.05.2020":
                calendarData[3].cColor = "happy"
            case "05.05.2020":
                calendarData[4].cColor = "happy"
            case "06.05.2020":
                calendarData[5].cColor = "happy"
            case "07.05.2020":
                calendarData[6].cColor = "happy"
            case "08.05.2020":
                calendarData[7].cColor = "happy"
            case "09.05.2020":
                calendarData[8].cColor = "happy"
            case "10.05.2020":
                calendarData[9].cColor = "happy"
            case "11.05.2020":
                calendarData[10].cColor = "happy"
            case "12.05.2020":
                calendarData[11].cColor = "happy"
            case "13.05.2020":
                calendarData[12].cColor = "happy"
            case "14.05.2020":
                calendarData[13].cColor = "happy"
            case "15.05.2020":
                calendarData[14].cColor = "happy"
            case "16.05.2020":
                calendarData[15].cColor = "happy"
            case "17.05.2020":
                calendarData[16].cColor = "happy"
            case "18.05.2020":
                calendarData[17].cColor = "happy"
            case "19.05.2020":
                calendarData[18].cColor = "happy"
            case "20.05.2020":
                calendarData[19].cColor = "happy"
            case "21.05.2020":
                calendarData[20].cColor = "happy"
            case "22.05.2020":
                calendarData[21].cColor = "happy"
            case "23.05.2020":
                calendarData[22].cColor = "happy"
            case "24.05.2020":
                calendarData[23].cColor = "happy"
            case "25.05.2020":
                calendarData[24].cColor = "happy"
            case "26.05.2020":
                calendarData[25].cColor = "happy"
            case "27.05.2020":
                calendarData[26].cColor = "happy"
            case "28.05.2020":
                calendarData[27].cColor = "happy"
            case "29.05.2020":
                calendarData[28].cColor = "happy"
            case "30.05.2020":
                calendarData[29].cColor = "happy"
            case "31.05.2020":
                calendarData[30].cColor = "happy"
            case "01.06.2020":
                calendarData[31].cColor = "happy"
            case "02.06.2020":
                calendarData[32].cColor = "happy"
            case "03.06.2020":
                calendarData[33].cColor = "happy"
            case "04.06.2020":
                calendarData[34].cColor = "happy"
            case "05.06.2020":
                calendarData[35].cColor = "happy"
            case "06.06.2020":
                calendarData[36].cColor = "happy"
            case "07.06.2020":
                calendarData[37].cColor = "happy"
            case "08.06.2020":
                calendarData[38].cColor = "happy"
            case "09.06.2020":
                calendarData[39].cColor = "happy"
            case "10.06.2020":
                calendarData[40].cColor = "happy"
            default:
                print ("ERROR")
            }
        case 5:
            switch result3 {
            case "01.05.2020":
                calendarData[0].cColor = "calm"
            case "02.05.2020":
                calendarData[1].cColor = "calm"
            case "03.05.2020":
                calendarData[2].cColor = "calm"
            case "04.05.2020":
                calendarData[3].cColor = "calm"
            case "05.05.2020":
                calendarData[4].cColor = "calm"
            case "06.05.2020":
                calendarData[5].cColor = "calm"
            case "07.05.2020":
                calendarData[6].cColor = "calm"
            case "08.05.2020":
                calendarData[7].cColor = "calm"
            case "09.05.2020":
                calendarData[8].cColor = "calm"
            case "10.05.2020":
                calendarData[9].cColor = "calm"
            case "11.05.2020":
                calendarData[10].cColor = "calm"
            case "12.05.2020":
                calendarData[11].cColor = "calm"
            case "13.05.2020":
                calendarData[12].cColor = "calm"
            case "14.05.2020":
                calendarData[13].cColor = "calm"
            case "15.05.2020":
                calendarData[14].cColor = "calm"
            case "16.05.2020":
                calendarData[15].cColor = "calm"
            case "17.05.2020":
                calendarData[16].cColor = "calm"
            case "18.05.2020":
                calendarData[17].cColor = "calm"
            case "19.05.2020":
                calendarData[18].cColor = "calm"
            case "20.05.2020":
                calendarData[19].cColor = "calm"
            case "21.05.2020":
                calendarData[20].cColor = "calm"
            case "22.05.2020":
                calendarData[21].cColor = "calm"
            case "23.05.2020":
                calendarData[22].cColor = "calm"
            case "24.05.2020":
                calendarData[23].cColor = "calm"
            case "25.05.2020":
                calendarData[24].cColor = "calm"
            case "26.05.2020":
                calendarData[25].cColor = "calm"
            case "27.05.2020":
                calendarData[26].cColor = "calm"
            case "28.05.2020":
                calendarData[27].cColor = "calm"
            case "29.05.2020":
                calendarData[28].cColor = "calm"
            case "30.05.2020":
                calendarData[29].cColor = "calm"
            case "31.05.2020":
                calendarData[30].cColor = "calm"
            case "01.06.2020":
                calendarData[31].cColor = "calm"
            case "02.06.2020":
                calendarData[32].cColor = "calm"
            case "03.06.2020":
                calendarData[33].cColor = "calm"
            case "04.06.2020":
                calendarData[34].cColor = "calm"
            case "05.06.2020":
                calendarData[35].cColor = "calm"
            case "06.06.2020":
                calendarData[36].cColor = "calm"
            case "07.06.2020":
                calendarData[37].cColor = "calm"
            case "08.06.2020":
                calendarData[38].cColor = "calm"
            case "09.06.2020":
                calendarData[39].cColor = "calm"
            case "10.06.2020":
                calendarData[40].cColor = "calm"
            default:
                print ("ERROR")
            }
        case 6:
            switch result3 {
            case "01.05.2020":
                calendarData[0].cColor = "bad"
            case "02.05.2020":
                calendarData[1].cColor = "bad"
            case "03.05.2020":
                calendarData[2].cColor = "bad"
            case "04.05.2020":
                calendarData[3].cColor = "bad"
            case "05.05.2020":
                calendarData[4].cColor = "bad"
            case "06.05.2020":
                calendarData[5].cColor = "bad"
            case "07.05.2020":
                calendarData[6].cColor = "bad"
            case "08.05.2020":
                calendarData[7].cColor = "bad"
            case "09.05.2020":
                calendarData[8].cColor = "bad"
            case "10.05.2020":
                calendarData[9].cColor = "bad"
            case "11.05.2020":
                calendarData[10].cColor = "bad"
            case "12.05.2020":
                calendarData[11].cColor = "bad"
            case "13.05.2020":
                calendarData[12].cColor = "bad"
            case "14.05.2020":
                calendarData[13].cColor = "bad"
            case "15.05.2020":
                calendarData[14].cColor = "bad"
            case "16.05.2020":
                calendarData[15].cColor = "bad"
            case "17.05.2020":
                calendarData[16].cColor = "bad"
            case "18.05.2020":
                calendarData[17].cColor = "bad"
            case "19.05.2020":
                calendarData[18].cColor = "bad"
            case "20.05.2020":
                calendarData[19].cColor = "bad"
            case "21.05.2020":
                calendarData[20].cColor = "bad"
            case "22.05.2020":
                calendarData[21].cColor = "bad"
            case "23.05.2020":
                calendarData[22].cColor = "bad"
            case "24.05.2020":
                calendarData[23].cColor = "bad"
            case "25.05.2020":
                calendarData[24].cColor = "bad"
            case "26.05.2020":
                calendarData[25].cColor = "bad"
            case "27.05.2020":
                calendarData[26].cColor = "bad"
            case "28.05.2020":
                calendarData[27].cColor = "bad"
            case "29.05.2020":
                calendarData[28].cColor = "bad"
            case "30.05.2020":
                calendarData[29].cColor = "bad"
            case "31.05.2020":
                calendarData[30].cColor = "bad"
            case "01.06.2020":
                calendarData[31].cColor = "bad"
            case "02.06.2020":
                calendarData[32].cColor = "bad"
            case "03.06.2020":
                calendarData[33].cColor = "bad"
            case "04.06.2020":
                calendarData[34].cColor = "bad"
            case "05.06.2020":
                calendarData[35].cColor = "bad"
            case "06.06.2020":
                calendarData[36].cColor = "bad"
            case "07.06.2020":
                calendarData[37].cColor = "bad"
            case "08.06.2020":
                calendarData[38].cColor = "bad"
            case "09.06.2020":
                calendarData[39].cColor = "bad"
            case "10.06.2020":
                calendarData[40].cColor = "bad"
            default:
                print ("ERROR")
            }
        case 7:
           switch result3 {
            case "01.05.2020":
                calendarData[0].cColor = "depressed"
            case "02.05.2020":
                calendarData[1].cColor = "depressed"
            case "03.05.2020":
                calendarData[2].cColor = "depressed"
            case "04.05.2020":
                calendarData[3].cColor = "depressed"
            case "05.05.2020":
                calendarData[4].cColor = "depressed"
            case "06.05.2020":
                calendarData[5].cColor = "depressed"
            case "07.05.2020":
                calendarData[6].cColor = "depressed"
            case "08.05.2020":
                calendarData[7].cColor = "depressed"
            case "09.05.2020":
                calendarData[8].cColor = "depressed"
            case "10.05.2020":
                calendarData[9].cColor = "depressed"
            case "11.05.2020":
                calendarData[10].cColor = "depressed"
            case "12.05.2020":
                calendarData[11].cColor = "depressed"
            case "13.05.2020":
                calendarData[12].cColor = "depressed"
            case "14.05.2020":
                calendarData[13].cColor = "depressed"
            case "15.05.2020":
                calendarData[14].cColor = "depressed"
            case "16.05.2020":
                calendarData[15].cColor = "depressed"
            case "17.05.2020":
                calendarData[16].cColor = "depressed"
            case "18.05.2020":
                calendarData[17].cColor = "depressed"
            case "19.05.2020":
                calendarData[18].cColor = "depressed"
            case "20.05.2020":
                calendarData[19].cColor = "depressed"
            case "21.05.2020":
                calendarData[20].cColor = "depressed"
            case "22.05.2020":
                calendarData[21].cColor = "depressed"
            case "23.05.2020":
                calendarData[22].cColor = "depressed"
            case "24.05.2020":
                calendarData[23].cColor = "depressed"
            case "25.05.2020":
                calendarData[24].cColor = "depressed"
            case "26.05.2020":
                calendarData[25].cColor = "depressed"
            case "27.05.2020":
                calendarData[26].cColor = "depressed"
            case "28.05.2020":
                calendarData[27].cColor = "depressed"
            case "29.05.2020":
                calendarData[28].cColor = "depressed"
            case "30.05.2020":
                calendarData[29].cColor = "depressed"
            case "31.05.2020":
                calendarData[30].cColor = "depressed"
            case "01.06.2020":
                calendarData[31].cColor = "depressed"
            case "02.06.2020":
                calendarData[32].cColor = "depressed"
            case "03.06.2020":
                calendarData[33].cColor = "depressed"
            case "04.06.2020":
                calendarData[34].cColor = "depressed"
            case "05.06.2020":
                calendarData[35].cColor = "depressed"
            case "06.06.2020":
                calendarData[36].cColor = "depressed"
            case "07.06.2020":
                calendarData[37].cColor = "depressed"
            case "08.06.2020":
                calendarData[38].cColor = "depressed"
            case "09.06.2020":
                calendarData[39].cColor = "depressed"
            case "10.06.2020":
                calendarData[40].cColor = "depressed"
            default:
                print ("ERROR")
            }
        default:
            switch result3 {
            case "01.05.2020":
                calendarData[0].cColor = "none"
            case "02.05.2020":
                calendarData[1].cColor = "none"
            case "03.05.2020":
                calendarData[2].cColor = "none"
            case "04.05.2020":
                calendarData[3].cColor = "none"
            case "05.05.2020":
                calendarData[4].cColor = "none"
            case "06.05.2020":
                calendarData[5].cColor = "none"
            case "07.05.2020":
                calendarData[6].cColor = "none"
            case "08.05.2020":
                calendarData[7].cColor = "none"
            case "09.05.2020":
                calendarData[8].cColor = "none"
            case "10.05.2020":
                calendarData[9].cColor = "none"
            case "11.05.2020":
                calendarData[10].cColor = "none"
            case "12.05.2020":
                calendarData[11].cColor = "none"
            case "13.05.2020":
                calendarData[12].cColor = "none"
            case "14.05.2020":
                calendarData[13].cColor = "none"
            case "15.05.2020":
                calendarData[14].cColor = "none"
            case "16.05.2020":
                calendarData[15].cColor = "none"
            case "17.05.2020":
                calendarData[16].cColor = "none"
            case "18.05.2020":
                calendarData[17].cColor = "none"
            case "19.05.2020":
                calendarData[18].cColor = "none"
            case "20.05.2020":
                calendarData[19].cColor = "none"
            case "21.05.2020":
                calendarData[20].cColor = "none"
            case "22.05.2020":
                calendarData[21].cColor = "none"
            case "23.05.2020":
                calendarData[22].cColor = "none"
            case "24.05.2020":
                calendarData[23].cColor = "none"
            case "25.05.2020":
                calendarData[24].cColor = "none"
            case "26.05.2020":
                calendarData[25].cColor = "none"
            case "27.05.2020":
                calendarData[26].cColor = "none"
            case "28.05.2020":
                calendarData[27].cColor = "none"
            case "29.05.2020":
                calendarData[28].cColor = "none"
            case "30.05.2020":
                calendarData[29].cColor = "none"
            case "31.05.2020":
                calendarData[30].cColor = "none"
            case "01.06.2020":
                calendarData[31].cColor = "none"
            case "02.06.2020":
                calendarData[32].cColor = "none"
            case "03.06.2020":
                calendarData[33].cColor = "none"
            case "04.06.2020":
                calendarData[34].cColor = "none"
            case "05.06.2020":
                calendarData[35].cColor = "none"
            case "06.06.2020":
                calendarData[36].cColor = "none"
            case "07.06.2020":
                calendarData[37].cColor = "none"
            case "08.06.2020":
                calendarData[38].cColor = "none"
            case "09.06.2020":
                calendarData[39].cColor = "none"
            case "10.06.2020":
                calendarData[40].cColor = "none"
            default:
                print ("ERROR")
            }
        }
 
       // cell.backgroundColor = setColor(color: calendarData[indexPath.row].cColor)
        
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "1"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[0].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "2"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[1].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "3" {
            cell.CellView.backgroundColor = setColor(color: calendarData[2].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "4"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[3].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "5"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[4].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "6"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[5].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "7"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[6].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "8"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[7].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "9" {
            cell.CellView.backgroundColor = setColor(color: calendarData[8].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "10" {
            cell.CellView.backgroundColor = setColor(color: calendarData[9].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "11"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[10].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "12"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[11].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "13"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[12].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "14"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[13].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "15"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[14].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "16"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[15].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "17"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[16].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "18"{
            cell.CellView.backgroundColor = setColor(color: calendarData[17].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "19"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[18].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "20"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[19].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "21"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[20].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "22"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[21].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "23"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[22].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "24"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[23].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "25"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[24].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "26"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[25].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "27"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[26].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "28"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[27].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "29"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[28].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "30"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[29].cColor)
        }
        if MonthLabel.text == "May 2020" && cell.DateLabel.text == "31"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[30].cColor)
        }
        if MonthLabel.text == "June 2020" && cell.DateLabel.text == "1"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[31].cColor)
        }
        if MonthLabel.text == "June 2020" && cell.DateLabel.text == "2" {
            cell.CellView.backgroundColor = setColor(color: calendarData[32].cColor)
        }
        if MonthLabel.text == "June 2020" && cell.DateLabel.text == "3" {
            cell.CellView.backgroundColor = setColor(color: calendarData[33].cColor)
        }
        if MonthLabel.text == "June 2020" && cell.DateLabel.text == "4"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[34].cColor)
        }
        if MonthLabel.text == "June 2020" && cell.DateLabel.text == "5"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[35].cColor)
        }
        if MonthLabel.text == "June 2020" && cell.DateLabel.text == "6" {
            cell.CellView.backgroundColor = setColor(color: calendarData[36].cColor)
        }
        if MonthLabel.text == "June 2020" && cell.DateLabel.text == "7" {
            cell.CellView.backgroundColor = setColor(color: calendarData[37].cColor)
        }
        if MonthLabel.text == "June 2020" && cell.DateLabel.text == "8"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[38].cColor)
        }
        if MonthLabel.text == "June 2020" && cell.DateLabel.text == "9"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[39].cColor)
        }
        if MonthLabel.text == "June 2020" && cell.DateLabel.text == "10"  {
            cell.CellView.backgroundColor = setColor(color: calendarData[40].cColor)
        }

        cell.DateLabel.textColor = UIColor.black
        
        cell.CellView.isHidden = true
        
        if cell.isHidden{
            cell.isHidden = false
        }
        
        switch Direction {      //the first cells that needs to be hidden (if needed) will be negative or zero so we can hide them
        case 0:
            cell.DateLabel.text = "\(indexPath.row + 1 - NumberOfEmptyBox)"
        case 1:
            cell.DateLabel.text = "\(indexPath.row + 1 - NextNumberOfEmptyBox)"
        case -1:
            cell.DateLabel.text = "\(indexPath.row + 1 - PreviousNumberOfEmptyBox)"
        default:
            fatalError()
        }
        
        if Int(cell.DateLabel.text!)! < 1{ //here we hide the negative numbers or zero
            cell.isHidden = true
        }
        switch indexPath.row { //weekend days color
        case 5,6,12,13,19,20,26,27,33,34:
            if Int(cell.DateLabel.text!)! > 0 {
                cell.DateLabel.textColor = UIColor.lightGray
            }
        default:
            break
        }
        if currentMonth == Months[calendar.component(.month, from: date) - 1] && year == calendar.component(.year, from: date) && indexPath.row + 1 - NumberOfEmptyBox == day{
            cell.CellView.isHidden = false

            /*
           Happy         cell.CellView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
           Calm          cell.CellView.backgroundColor = #colorLiteral(red: 1, green: 0.9141723998, blue: 0.9191490494, alpha: 1)
           Sad           cell.CellView.backgroundColor = #colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)
           Angry         cell.CellView.backgroundColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
           Feeling bad   cell.CellView.backgroundColor = #colorLiteral(red: 0.7098039216, green: 0.9176470588, blue: 0.8431372549, alpha: 1)
           Feeling good  cell.CellView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
           Depressed     cell.CellView.backgroundColor = #colorLiteral(red: 0.8263478293, green: 0.9742921929, blue: 0.9764705896, alpha: 1)
           Worried       cell.CellView.backgroundColor = #colorLiteral(red: 0.8792963126, green: 0.7901931984, blue: 0.9764705896, alpha: 1)
           Anxious       cell.CellView.backgroundColor = #colorLiteral(red: 0.7148833619, green: 0.5779798397, blue: 1, alpha: 1)
            */
       
    }
  return cell
}
    

}
