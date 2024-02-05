import 'package:flutter/material.dart';

const APPBAR_SHADOW_COLOR = Color(0XFFC6C6D7);
const SCAFFOLD_BACKGROUND_COLOR = Color(0xFFF5F5F5);
const MAIN_TEXT_COLOR = Color(0xFF1D1D1D);
const SECONDARY_TEXT_COLOR = Colors.white;
const DIALOG_TEXT_COLOR = Color(0xFFa0acb8);
const HIGH_SCORE_BACKGROUND = Color(0xFF094074);
const MUSIC_NOTE_COLOR = Colors.black;
const GENERIC_BORDER_COLOR = Colors.black26;
const GAME_SCREEN_BACKGROUND = Color.fromRGBO(242, 243, 247, 1);
const STOP_WATCH_BORDER = Color(0xFF0395EB);
const CALCULATOR_KEYS_COLOR = Color(0xFF444444);
const CALCULATOR_ERROR_BACKGROUND = Colors.red;
const BUTTON_PRIMARY = Color(0xFF8E9AAF);
const CLOCK_HOUR_HAND = Color(0xFFFFB86F);
const CLOCK_MINUTE_HAND = Color(0XFF1b599e);
const CLOCK_SECOND_HAND = Colors.white;
const CLOCK_INNER_CIRCLE = Colors.white;
const CLOCK_OUTER_CIRCLE = Colors.white54;
const BUTTON_SECONDARY = Color(0xFFF6a43F);
const ICON_COLOR = Color(0xFF414A4C);

const SIMPLE_CALCULTOR_KEYS = [
  "AC",
  "⌫",
  "%",
  "/",
  "7",
  "8",
  "9",
  "*",
  "4",
  "5",
  "6",
  "-",
  "1",
  "2",
  "3",
  "+",
  ".",
  "0",
  "",
  "="
];

const SCIENTIFIC_CALCULATOR_KEYS = [
  "log",
  "ln",
  "asin",
  "acos",
  "atan",
  "(",
  ")",
  "sin",
  "cos",
  "tan",
  "ln2",
  "AC",
  "⌫",
  " mód ",
  "√",
  "^",
  "7",
  "8",
  "9",
  "/",
  "π",
  "4",
  "5",
  "6",
  "*",
  "e",
  "1",
  "2",
  "3",
  "+",
  "%",
  ".",
  "0",
  "=",
  "-"
];

const RULES = {
  'en_US': [
    "#1 The computer will generate a 4 digit number. Each digit will be unique. And 0 is not in the digits.",
    "#2 For each guess, the computer will tell you how many digits you guessed correctly (magnitude), and how many of them are in the correct order (order). You can find this data in the previous tabs below.",
    "#3 Try to make an educated guess to the number using previous data, and least amount number of trials."
  ],
  'hi_IN': [
    "#1 कंप्यूटर एक 4 अंकों का नंबर उत्पन्न करेगा। प्रत्येक अंक अद्वितीय होगा। और 0 अंक में नहीं होगा।",
    "#2 प्रत्येक अनुमान के लिए, कंप्यूटर आपको बताएगा कि आपने कितने अंक सही अंकित किए हैं (महत्त्व), और उनमें से कितने सही क्रम में हैं (क्रम)। आप पिछले टैब में इस डेटा को खोज सकते हैं।",
    "#3 पिछले डेटा का उपयोग करते हुए एक शिक्षित अनुमान बनाने की कोशिश करें, और कम से कम संख्या के प्रयासों का प्रयास करें।"
  ],
  'ru_RU': [
    "#1 Компьютер сгенерирует четырехзначное число. Каждая цифра будет уникальной. И 0 не будет в цифрах.",
    "#2 Для каждой догадки компьютер скажет вам, сколько цифр вы угадали правильно (величина) и сколько из них находятся в правильном порядке (порядок). Вы можете найти эту информацию в предыдущих вкладках ниже.",
    "#3 Попытайтесь сделать обоснованную догадку по числу, используя предыдущие данные и наименьшее количество попыток."
  ]
};

const INTRO_TITLES = {
  'en_US': ['', '', '', ''],
  'hi_IN': ['नमस्ते!', 'समर्पण!', 'धन्यवाद!', 'जल्द ही मिलते हैं!'],
  'ru_RU': ['Привет!', 'Посвящение!', 'Спасибо!', 'До скорого!']
};

const INTRO_SUBTITLES = {
  'en_US': [
    'We have worked on this wireless computing assignment and produced this application.',
    "We are so excited to present this app of 5 tasks to you! We have spent time carefully developing and refining it to present you an app that is both beautiful and exceptionally functional.",
    'Our Group consist of \n\n Abigail Arega (UGR/7574/13) \n Alexander Kiros(UGR/5158/13) \n Birehanu Asmamaw (UGR/2160/13) \n Eyob Tefferi (UGR/1218/13) \n Franol Fekadu (UGR/6108/13)',
    'Finally We hope you enjoy the app and Simplifies your day to day tasks.',
  ],
  'hi_IN': [
    'मैं एलेक्स हूं, एक फेलो डेवलपर ईथियोपिया, अफ्रीका से। मैं लगभग एक साल से मोबाइल ऐप्स विकसित कर रहा हूं।',
    'मैं आपको अपने 5 कार्यों के ऐप का प्रस्ताव करने में बहुत उत्साहित हूं! मैंने अपनी इंटर्नशिप के समय को मन से ध्यान देकर इसे विकसित और संशोधित किया है ताकि आपको एक ऐसा ऐप प्रस्तुत किया जा सके जो सुंदर और अत्यधिक फंक्शनल हो।',
    'इसके बिना कहना होगा कि मुझे यह अवसर दिया गया है कि मैं अपनी प्रतिष्ठा साझा करूँ और अपने कौशलों को प्रदर्शित करूँ।',
    'अंत में मुझे आशा है कि आप ऐप का आनंद लेंगे और यह आपको खुशी देगा। मैं आपसे फिर से मिलने की उम्मीद करता हूं।',
  ],
  'ru_RU': [
    'Я Алекс, коллега-разработчик из Эфиопии, Африка. Я занимаюсь разработкой мобильных приложений уже около года.',
    'Я настолько взволнован представить вам мое приложение из 5 задач! Я потратил время на свой стажировке, тщательно разрабатывая и совершенствуя его, чтобы представить вам приложение, которое одновременно является красивым и исключительно функциональным.',
    'Я не могу не выразить, насколько я рад был получить эту возможность поделиться своей страстью и продемонстрировать свои навыки.',
    'Наконец, я надеюсь, что вам понравится приложение и оно принесет вам радость. Я также с нетерпением жду ваших отзывов.'
  ],
};

const IMAGE_LIST = [
  'assets/images/waving-hand.png',
  'assets/images/strong-arm.png',
  'assets/images/thank-you.png',
  'assets/images/see-you.png',
];

List<Map<String, dynamic>> TOPICS = [
  {
    "description": ""
        "· Made a calculator app - both a simple and scientific calculator. Used bloc pattern for state management.\n\n"
        "· Took inspiration from open source implementations of calculator using flutter. Uniquely made it to my vision.\n\n"
        "· Used math_expression package to parse expression in a string for the scientific calculator",
    "title": "Calculator App",
    "icon": Icons.calculate_rounded,
    "path": "/calculator",
  },
  {
    "description":
    "· Made a simple puzzle app - decided to implement a game/puzzle we used to play as kids in my local area.\n\n"
        "· Used bloc pattern for state management.\n\n"
        "· It keeps track of high scores, by saving the data to a local database using sqflite.\n\n",
    "title": "Puzzle App",
    "icon": Icons.question_mark_sharp,
    "path": "/puzzle",
  },
  {
    "description":
        "· Made Stop watch - with resume(pause), reset buttons and stores saved laps as well."
            " \n\n· Used Change notifiers and change notifier Provider for state management.\n\n"
            "· Used consumer to only rebuild specific part of the widget.\n\n"
            "· Also added interesting logic to refactor saved laps after deletion. ",
    "title": "Stop Watch App",
    "icon": Icons.timer,
    "path": "/stop-watch",
  },
  {
    "description":
        "· Made Date and time app - with both a digital and Analog watch. \n\n"
            "· Drew analog clock using custom painter and fed it a change notifier that triggers a rebuild every second.\n\n"
            "· The rebuild calculates the point on the circumference of the circle on which it puts the hour, minute and second hands, does this using the current date-time.",
    "title": "Date and Time App",
    "icon": Icons.access_time_filled_rounded,
    "path": "/date-time",
  },
  {
    "description":
        "· Made a MusicPlayer App - with play, pause, next, previous buttons and a seek bar.\n\n"
            "· Used InheritedNotifier as well as external packages - permission handler (to read the audio files from device ), just_audio ,and on_audio_query. \n\n",
    "title": "Music App",
    "icon": Icons.music_note_outlined,
    "path": "/music",
  },
];
