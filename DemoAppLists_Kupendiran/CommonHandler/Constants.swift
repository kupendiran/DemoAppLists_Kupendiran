
import Foundation
import UIKit
import CoreData
//import AWSS3

struct Constants {
    
    enum APIError : Error {
        case responseError
        case networkError
        case noError
    }
    
    //MARK: - Screen Size
    struct ScreenSize {
        static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    //MARK: - Device Type
    struct DeviceType {
        static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
        static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPHONE_X        = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 812.0
        static let IS_IPHONE_11_PRO   = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 896.0
        static let IS_IPAD            = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    }
    
    //MARK: - Font Types
    struct FontTypes {
        
        struct Inter {
            static let Regular = "Inter-Regular"
            static let Bold = "Inter-Bold"
            static let Black = "Inter-Black"
            static let ExtraBold = "Inter-ExtraBold"
            static let ExtraLight = "Inter-ExtraLight"
            static let Light = "Inter-Light"
            static let Medium = "Inter-Medium"
            static let SemiBold = "Inter-SemiBold"
            static let Thin = "Inter-Thin"
        }
        
    }
    
    //MARK: - Color Set
    struct ColorSet {
        static let ColorAppThemeMain = UIColor(named: "ColorAppThemeMain")
        static let ColorAppThemeMain_Second = UIColor(named: "ColorAppThemeSecond")
        static let ColorWhite = UIColor(named: "ColorWhite")
        static let ColorWhiteONLY = UIColor(named: "ColorWhiteONLY")
        static let ColorBlack = UIColor(named: "ColorBlack")
        static let ColorBlackONLY = UIColor(named: "ColorBlackONLY")
        
    }
    
    //MARK: - Class Constants
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let sceneDelegate = UIApplication.shared.delegate as! SceneDelegate
    static let userdefaults = UserDefaults.standard
    static let getDeviceID = Constants.userdefaults.value(forKey: Constants.Keys.DeviceID) as? String ?? ""
    
    //MARK: - Core Data Constants
    static let coreDataContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    /*//MARK: - Core Data Initialise
    var items:[ChatRoomsEntity]?
    do {
        items = try Constants.coreDataContext.fetch(ChatRoomsEntity.fetchRequest())
    } catch {
    }
    print("items===>>\(items)")
    */
    struct EntityNames {
        static let ENTITY_CHAT_ROOMS = "ChatRoomsEntity"
        static let ENTITY_CHATCHATTINGLISTS = "ChatChattingEntity"
        static let ENTITY_CHAT_ONLINE_TYPING_STATUS = "ChatOnlineTypingStatusEntity"
        static let ENTITY_ZZZ_SAMPLE = "Zzz_SampleEntity"
    }
    
    
    //MARK: Identifier constants
    struct Storyboard {
        struct Name {
            static let MAIN = "Main"
        }
        struct Identifier {
            static let VC_TABBAR_CTRLR = "TabbarController"
            static let VC_HOME = "HomeVc"
            
        }
        struct ReuseID {
            //static let ServicesCell = "ServicesCellReuse_ID"//dummy
            static let TABLECELL_PROFILEBIO = "ProfileBioTableCell" //Slide Menu profile bio
            static let TABLECELL_COMMONNAME = "CommonNameTableCell"
            static let TABLECELL_COMMONIMAGE = "CommonImageTableCell"
            
        }
        struct XIBName {
            static let SLIDEVIEW_TABLECELL = "SlideVwTableCell"
            
        }
    }
    //MARK: Identifier constants End,,,,,
    
    
    
    //MARK: Network Constants
    struct GeneralConstants {
        static let ProgressName = "Please wait..."
        static let NetworkStatus = "No Connection"
        static let Okay = "Okay"
        static let AppVersionUpdate = "A new version of this app is available!"
        static let AppVersionUpdate_Optional = "A new version of this app is available. By click Update, you can update our new version."
    }
    
    //MARK: Validation messages constants
    struct ValidationConstants {
        static let titleMessage = "Message"
        static let noNetwork = "No Connection"
        static let responseError = "There has been a network error, Please try again!"
        static let connectionFailed = "Connection failed, Please try again later"
    }
    
    //MARK: Validation Messages
    struct ValidationMsgs {
        static let Required = "Required"
        static let ContentRequired = "Content required"
        static let warning = "Warning"
        static let noNetwork = "No Connection"
        static let noCamera = "You don't have camera"
        static let chooseImageSelection = "Choose Image Selection"
        static let byCamera  = "From Camera"
        static let byGallery = "From Gallery"
        static let PleaseSelectPhotoOrVideo = "Please select any Photo or Video"
        static let somethingWentWrong = "Something went wrong, Please try again!"
        static let allFieldsMandatory = "All fields are mandatory"
        static let ProfileUpdatedSuccessfully = "Details updated successfully!"
        static let ProfileUpdateFailed = "Failed to update details, Please try again"
        static let acceptTermsAndConditions = "Please accept the terms and conditions to proceed signup."
        static let acceptTermsAndPrivacy = "Please accept the 'terms of service' and 'privacy policy' to proceed signup."
        static let titleMessage = "Message"
        
        static let noMailAccounts = "No mail accounts configured. Please configure one and try again later"
        static let invalidEmail = "Email format is incorrect."
        static let emailAlreadyExists = "This email id already registered with us"
        static let invalidPswWithLogic = "Set a strong password that includes alphabets, numerics and special characters"
        static let pwdCharRequired = "Password must contain at least 6 characters, including numbers"
        static let invalidUsername = "Username already taken"
        static let invalidPhone = "Phone number format is incorrect."
        static let allowPhotoAccess = "Please allow photo access"
        static let allowCameraAccess = "Please allow camera access"
        static let permissionAccessAllowForPhoto = "1: Open Settings\n 2: Tap Privacy\n 3: Tap Photos\n 4: Select Read and Write"
        static let permissionAccessAllowForCamera = "1: Open Settings\n 2: Tap Privacy\n 3: Tap Camera\n 4: Set Smooch to On"
        
        //MARK: NEW
        static let dobEmpty = "Please choose your date of birth"
        static let invalidDobYear = "Please enter valid year."
        static let HiddenPostAlert = "Selected post has been removed successfully."
        static let HiddenCommentAlert = "Selected comment has been removed successfully."
        //User Update Basic details
        static let userInfoEmpty = "Please give info about you."
        static let userPlaceEmpty = "Please enter your place."
        static let currentPositionAllFieldMandatory = "All fields are mandatory in Current Position."
        //User account
        static let AccountDeactivateEmpty = "Please enter the reason to deactivate account."
        static let AccountDeleteEmpty = "Please enter the reason to delete account."
        static let AccountDeleteToReactivateMsg = "Your account deletion request is currently being processed. By click Continue, your account will be activated."
        static let AccountDeactivateToReactivateMsg = "Your account deactivate request is currently being processed. By click Continue, your account will be activated."
        static let AccountReactivateRequestAlreadySentMsg = "Account reactivate request already sent."
        
        static let MyCreateAllFieldMandatory = "All fields are mandatory which is created by you!"
        
        
        struct EmptyFields {
            static let firstNameEmpty = "First name is empty."
            static let lastNameEmpty = "Last name is empty."
            static let nameEmpty = "Name cannot be empty"
            static let emailEmpty = "Email cannot be empty"
            static let mobileEmpty = "mobile number cannot be empty"
            
            static let passwordEmpty = "Password cannot be empty"
            static let passwordMismatch = "Password mismatch"
            static let OldpasswordEmpty = "Old Password is empty."
            static let NewpasswordEmpty = "New Password is empty."
            static let ConfirmpasswordEmpty = "Confirm Password is empty."
            
            static let messageEmpty = "Please enter the message"
            static let zipcodeEmpty = " Zipcode is empty."
            
            static let searchKeywordEmpty = "Please enter your search keyword"
            
        }
    }
    
    
    //MARK: Common Global Values
    struct GlobalValues {
        static var TABBARINDEX = 0
        
        static var filterPrices: [Int] = [
            .min, 500, 1_000, 2_000, 3_000, 4_000, 5_000, 6_000, 7_000, 8_000, 9_000,
            10_000, 11_000, 12_000, 13_000, 14_000, 15_000, 16_000, 17_000, 18_000, 19_000,
            20_000, 21_000, 22_000, 23_000, 24_000, 25_000, 26_000, 27_000, 28_000, 29_000,
            30_000, 31_000, 32_000, 33_000, 34_000, 35_000, 36_000, 37_000, 38_000, 39_000,
            40_000, 41_000, 42_000, 43_000, 44_000, 45_000, 46_000, 47_000, 48_000, 49_000,
            50_000, 55_000, 60_000, 65_000, 70_000, 75_000, 80_000, 85_000, 90_000, 95_000,
            100_000, 110_000, 120_000, 130_000, 140_000, 150_000, .max,
            ]
        
        
        
        static let uuid = UUID().uuidString
        
        static var s_theCurrentPageIs = ""
        static var popupViewExtraHeight:CGFloat = 0.0
        //
        //static var currentISPageCollCell = ISPageCtrlCollectionCell()
        static var Ary_HyperLinkValues = ["http", "www.", ".com", ".in", ".org"]
        static var Ary_TextColorLinkValues = ["@", "http", "www.", ".com", ".in", ".org"]
        
        
        static var topSafeAreaHeight = 0.0 //UIApplication.shared.keyWindow?.safeAreaTop
        static var bottomSafeAreaHeight = 0.0 //UIApplication.shared.keyWindow?.safeAreaBottom
        static var f_TOTAL_SAFEAREA_HEIGHT = Constants.GlobalValues.topSafeAreaHeight + Constants.GlobalValues.bottomSafeAreaHeight
        //
        //static var PostDescAreaHeight = 0.0
        //static var PostTagAreaHeight = 0.0
        
        
        
    }
    
    struct UserDefaults_Keys {
        
    }
    
    //MARK: COMMON WEBSITE LINKS
    struct CommonWebsiteLinks {
        static let LINK_APPSTORE = ""
    }
    
    struct AppDatas {
        static var APP_LIST_API_WANT_TO_CALL = true
        static var PROGRESS_INDICATOR_VIEW_TAG:Int = 10
    }
    
    //MARK: Common App Names
    struct CommonAppNames {
        static let NAME_APP_NAME = "AppName"
        
    }
    
    
    //MARK: API handling place
    struct API {
        //Base URL
        //static let BaseURL = "https://example.com/"
        static let isCurrentApisIsProduction = false //true //
        static let s_APP_APIS_VERSION = "api/v1/"
        static let s_developmentBaseURL = "http://universities.hipolabs.com/" //+ s_APP_APIS_VERSION
        static let s_productionBaseURL = "http://universities.hipolabs.com/" //+ s_APP_APIS_VERSION
        static let BaseURL = (isCurrentApisIsProduction == true) ? s_productionBaseURL:s_developmentBaseURL
        
        //API Constants
        static let LIMIT = 20
        static let LIMIT_COMMON_PAGE_LENGTH = "10"
        
        //MARK: Lists module API's here Start,,,,,
        //POST
        static let URL_USERS_LOGIN = BaseURL + ""
        static let URL_USERS_SIGNUP = BaseURL + ""
        
        static let API_NOTICE_LIST = BaseURL + "search?country=United%20Arab%20Emirates"
        
        //No request URL found. It will show up here once added.
        
    }
    
    //MARK: - API Keys
    struct Keys {
        //Google Auth Client Id //ran@gmail.com //Bundle Identifier==>com.fsp.app.SampleAppMVVM
        static let GoogleAuthClientId = ""
        
        //User Defaults
        static let UserDetails = "userdetails"
        static let USER_ID = "_id"
        static let FullName = "full_name"
        static let Name = "name"
        static let DateOfBirth = "dob"
        static let Email = "email"
        static let Password = "password"
        static let MobileCode = "mobile_code"
        static let Mobile = "mobile"
        static let ProfilePic = "profile_picture"
        static let EmailVerification = "emailVerification"
        static let MobileVerification = "MobileVerification"
        static let USER_STATUS = "user_status"
        static let FORGOT_PASSWORD_IDENTITY = "forgot_password_identity"
        
        static let Key_LoggedInUserAvatarUrl = "LoggedInUserAvatarUrl"
        static let Key_LoggedInUserAvatarSmallUrl = "LoggedInUserAvatarSmallUrl"
        static let Key_LoggedInUserAvatarBackColor = "LoggedInUserAvatarBackColor"
        static let KEY_DICTFOR_GLB_READYPLAYERME_AVATAR_DETAILS = "DictFor_GLB_ReadyPlayerMeAvatarDetails"
        
        static let KEY_UNREAD_NOTIFICATIONS_COUNT = "UnReadNotificationsCount"
        
        //General
        static let FcmTokenIds = "FcmTokenIds"
        static let Success = "success"
        static let Id = "id"
        static let Membership = "membership"
        static let Access_token = "access_token"
        static let ChatMyToken = "chat_token"
        static let ChatMyUserId = "chat_user_id"
        static let ChatMyUserName = "chat_username"
        static let DeviceID = "device_id"
        static let Source = "ios"
        static let Pic_Extension = ".png"
        static let text = "text"
        
        //Pages Navigation Back/ Front Arrows Purposes
        static let isBackIconBtnVisible = "isBackIconBtnVisible"
        static let isSkillListsAvailable = "isSkillListsAvailable"
        
        //Message Module
        static let ConversationIds = "ConversationIds"
        
    }
    
    
    //MARK: - Array Constants
    struct ArrayConstants {
        static let timePickerArray = ["7 am", "8 am", "9 am", "10 am", "11 am", "12 pm", "1 pm", "2 pm", "3 pm", "4 pm", "5 pm", "6 pm", "7 pm"]
        static let customerProfileList = ["My Info", "My Cards", "Terms of Service", "Contact Us", "FAQ"]
        static let relativeDateStringArray = ["Today", "Tomorrow", "Yesterday"]
        static let savedLocationsName = ["Work", "Home", "Other"]
    }
    
    //MARK: - DateFormatter Constants
    struct DateFormatterConstants {
        static let UTC = "UTC"
        static let CST = "America/Chicago"
        static let DDMMM = "dd MMM" //Date month - 10 Oct format
        static let DDMMMYYYY = "dd MMM yyyy" //Date month - 10 Oct 2000 format
        static let MMMDYYYY = "MMM d, YYYY"
        static let MMMDDYYYY = "MMM dd, YYYY"
        static let YYYYMMDD = "yyyy-MM-dd" //Date format - 2018-11-10
        static let AMPM = "h:mma" //AM and PM
        static let GenericUTC_DateTimeFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        static let GenericDateTimeFormat = "yyyy-MM-dd HH:mm:ss"
        static let GenericDateTimeWithAMPMFormat = "yyyy-MM-dd hh:mm:ss a"
        static let GenericDateTimeFormatWithT = "yyyy-MM-dd'T'HH:mm:ss"
        static let HHMMSS = "HH:mm:ss"
        static let HHMMSSA = "hh:mm:ss a"
        static let HHMMA = "hh:mm a"
        static let MMMDD_AMPM = "MMM d 'at' \(AMPM)"
        static let EEEMMMMYYYY = "EEEE, MMM d, YYYY"
        static let DateWithConstantTimeStart = "yyyy-MM-dd 00:00:00"
        static let DateWithConstantTimeEnd = "yyyy-MM-dd '23:59:59'"
    }
    
    //MARK: - General Constants
    struct FontSizeConstants {
        struct WelcomeLoginAndSignUpScreen {
            static let welcomeTitle  = 22.0
            static let welcomeContent  = 15.0
            static let welcomeLoginBtnLarge  = 22.0
            static let fieldsPlaceHolder  = 17.0
            static let forgotPasswordBtnUnderline  = 14.0
            static let buttonLoginSignup  = 16.0
            static let newToThisExperienceAndAlreadySigned  = 15.0
            static let signupLoginBtnUnderline  = 15.0
            static let acceptTermsAndConditions  = 15.0
        }
    }
    
    //AWSS3 Keys
    struct AWSKeys {
        
    }
    
}

