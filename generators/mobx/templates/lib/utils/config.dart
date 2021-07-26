// General
import 'package:flutter/material.dart';

const APP_NAME = 'Kutilang App';

// Caution! use your host IP instead of LOCALHOST
// because it not recognize on emulator
//const BASE_URL = 'http://192.168.100.41:8080/';
const BASE_URL = 'http://localhost:8080/';
const API = BASE_URL + 'api/';

// Role
const ADMIN = "ROLE_ADMIN";
const USER = "ROLE_USER";

// Authentication
const TOKEN = "token";
const IS_LOGGED_IN = "isLoggedIn";
const AUTH_TOKEN = TOKEN;

// Timeout
const int TIMEOUT_RECEIVE = 5000;
const int TIMEOUT_CONNECTION = 5000;

// Locale
const LOCALE_ENGLISH = 'en';
const LOCALE_BAHASA = 'id';

// Icon Images
const String ICON_APP = 'assets/icons/ic_appicon.png';
const String IMAGE_LOGIN = 'assets/images/img_login.jpg';
const String IMAGE_SPLASH = 'assets/icons/logo_jh.svg';

//fonts
const String quickFont = "Quicksand";
const String ralewayFont = "Raleway";
const String quickBoldFont = "Quicksand_Bold.otf";
const String quickNormalFont = "Quicksand_Book.otf";
const String quickLightFont = "Quicksand_Light.otf";

const locales = [
  const Locale('en', ''),
  const Locale('id', ''),
  const Locale('ar', ''),
];
