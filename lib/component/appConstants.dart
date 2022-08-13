import '../Models/SideMenuModel.dart';
import 'img.dart';

const String email = 'Email';
const String password = 'Password';


const String forgotYourPassword_q = 'Forgot your Password?';
const String log_in = "Log In";
const String dontHaveAnAccount_q = "Don't Have an Account?";
const String sign_up = 'Sign Up';
const String createYourAccount = 'Create Your Account';
const String firstName = 'First Name';
const String lastName = 'Last Name';
const String next = 'Next';
const String phoneNumber = 'Phone number';
const String contactDetails = 'Contact details';
const String addPassword = 'Add Password';
const String confirmPassword = 'Confirm Password';
const String address = 'Address';
const String city = 'City';
const String state = 'State';
const String zipCode = 'Zip Code';
const String country = 'Country';
const String skip = 'Skip';
const String addCardDetails = 'Add Card Details';
const String optional = 'Optional';
const String nameOnCard = 'Name on Card';
const String cardNo = 'Card Number';
const String cardExpiry = 'Card Expiry';
const String cvv = 'CVV';
const String yourChildName = "Your child's Name";
const String yourChildAge = "Your child's age";
const String yourChildLikes = "Your child's likes";
const String selectTop10Lang = "Select Top 10 languages";
const String selectLangDesc = 'Free user can choose 4 languages, for subscription you can choose 10 languages';
const String details = 'Details';
const String uploadPhotoIcon = 'Upload photo/icon';
const String here = 'Here';
const String upload = 'Upload';
const String authorBlurb = 'Author blurb';
const String writeAboutYou = 'Write About you...';
const String translatorBlurb = 'Translator blurb';
const String textHere = 'Text here';
const String paymentInfo = 'Payment info';
const String selectYourBank = 'Select your bank';
const String enterSwiftCode = 'Enter swift code';
const String enterAccountNumber = 'Enter account number';
const String yourMotherTongue = 'Your mother tongue';
const String yourOtherLangs = 'Your other languages';
const String yourQualificationDoc = 'Your qualification documents';
const String qualificationDocDesc = 'Upload any documents related to their language levels.';
const String uploadDocHere = 'Upload documents here';
const String translatingFrom = 'Translating from';
const String selectLangs = 'Select languages';
const String setupInterview = 'Set up interview';
const String setupIntervDesc = 'Lorem ipsum dolor sit amet, consetetue sadipscing elitr, sed diam nonumy eirmed tempor invidunt ut';
const String otpVerification = 'One time password\n Verification';
const String otpDesc = 'An OTP has been sent to your email';
const String enterOTPHere = 'Enter OTP Here';
const String otpHere = 'OTP Here';
const String didntReceiveCode = "Didn't receive the code?";
const String resendCode = 'Resend Code';
const String verify = 'Verify';
const String underReview = 'Under review';
const String underReviewDesc = 'Your account is under verification Please waiting for admin approval';
const String bookShelf = 'Book shelf';
const String myTranslations = 'My translations';
const String payments = 'Payments';
const String emailNewsLetter = 'Email Newsletter';
const String myProfile = 'My Profile';
const String notifications = 'Notifications';
const String settings = 'Settings';
const String aboutUs = 'About Us';
const String contactUs = 'Contact Us';
const String logout = 'Logout';
const String search = 'Search';
const String account = 'Account';
const String changePassword = 'Change Password';
const String languages = 'Languages';
const String accountDetails = 'Account Details';
const String privacyPolicy = 'Privacy Policy';
const String termsCond = 'Terms & Conditions';
const String dummy = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
const String translation = 'Translation';
const String myBooks = 'My Books';
const String pendingBooks = 'Pending Books';
const String createBook = 'Create Book';
const String startWork = 'Start Work';
const String requestForExtendTime = 'Request for extend time';
const String submit = 'Submit';





final List<SideMenuModel> sideMenuList = [
  SideMenuModel(image: Img.homeIcon,title: bookShelf),
  SideMenuModel(image: Img.paymentIcon,title: payments),
  SideMenuModel(image: Img.newsLetterIcon,title: emailNewsLetter),
  SideMenuModel(image: Img.profileIcon,title: myProfile),
  SideMenuModel(image: Img.notificationIcon,title: notifications),
  SideMenuModel(image: Img.settingIcon,title: settings),
  SideMenuModel(image: Img.aboutUsIcon,title: aboutUs),
  SideMenuModel(image: Img.contactUsIcon,title: contactUs),
];

final List<SideMenuModel> settingsList = [
  SideMenuModel(image: Img.accountIcon,title: account),
  SideMenuModel(image: Img.notificationBlueOutIcon,title: notifications, postImage: 'notification'),
  SideMenuModel(image: Img.passwordLockBlueIcon,title: changePassword),
  SideMenuModel(image: Img.worldBlueIcon,title: languages),
  SideMenuModel(image: Img.bankBlueIcon,title: accountDetails),
  SideMenuModel(image: Img.shieldBlueIcon,title: privacyPolicy),
  SideMenuModel(image: Img.fileBlueIcon,title: termsCond),
];


const String french = 'French';
const String spanish = 'Spanish';
const String chinese = 'Chinese';
const String hindi = 'Hindi';
const String japanese = 'Japanese';
const String english = 'English';

final List<SideMenuModel> langList = [
  SideMenuModel(image: Img.ani1,title: french),
  SideMenuModel(image: Img.ani2,title: spanish),
  SideMenuModel(image: Img.ani3,title: chinese),
  SideMenuModel(image: Img.ani4,title: hindi),
  SideMenuModel(image: Img.ani4,title: japanese),
  SideMenuModel(image: Img.ani5,title: english),
];


final List<String> socialIconList = [
  Img.facebook,
  Img.twitter,
  Img.instagram,
  Img.google
];