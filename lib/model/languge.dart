import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_products/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Languge extends ChangeNotifier {
  String _lan = languge;

  getLanguge() {
    return _lan;
  }

  setLanguge(String lan) {
    _lan = lan;
    notifyListeners();
  }
//Start Screen

  String tStartWelcome() {
    if (getLanguge() == 'AR') {
      return 'مرحبا بكم في هذا التطبيق ';
    } else {
      return 'Welcome in our Application';
    }
  }

  String tLogin() {
    if (getLanguge() == 'AR') {
      return 'تسجيل دخول ';
    } else
      return 'Login';
  }

  String tSignUp() {
    if (getLanguge() == 'AR') {
      return 'إنشاء حساب  ';
    } else
      return 'Sign-Up';
  }

// Login Sign up

  String tEmail() {
    if (getLanguge() == 'AR') {
      return 'البريد الإكتروني ';
    } else
      return 'Email';
  }

  String tPassword() {
    if (getLanguge() == 'AR') {
      return 'كلمة المرور ';
    } else {
      return 'Password';
    }
  }

  String tUserName() {
    if (getLanguge() == 'AR') {
      return ' اسم المستخدم ';
    } else {
      return 'UserName';
    }
  }

// Drawer

  String tHome() {
    if (getLanguge() == 'AR') {
      return ' القائمة الرئيسية  ';
    } else {
      return 'Home';
    }
  }

  String tSetting() {
    if (getLanguge() == 'AR') {
      return ' الإعدادات ';
    } else {
      return 'Settings';
    }
  }

  String tLogOut() {
    if (getLanguge() == 'AR') {
      return ' تسجيل خروج ';
    } else {
      return 'Log-Out';
    }
  }

// Add ProductS

  String tAddProduct() {
    if (getLanguge() == 'AR') {
      return 'إضافة سيارة  ';
    } else {
      return 'Add Car';
    }
  }

  String tNameCar() {
    if (getLanguge() == 'AR') {
      return 'الأسم  ';
    } else {
      return 'Name ';
    }
  }

  String tPriceCar() {
    if (getLanguge() == 'AR') {
      return 'السعر  ';
    } else {
      return 'Price';
    }
  }

  String tDescription() {
    if (getLanguge() == 'AR') {
      return 'الوصف  ';
    } else {
      return 'Description';
    }
  }

  String tCategory() {
    if (getLanguge() == 'AR') {
      return 'النوعية  ';
    } else {
      return 'Category';
    }
  }

  String tPhone() {
    if (getLanguge() == 'AR') {
      return 'رقم الهاتف  ';
    } else {
      return 'Phone Number';
    }
  }

  String tAddDate() {
    if (getLanguge() == 'AR') {
      return 'تاريخ إنتاج  ';
    } else {
      return 'Select Date';
    }
  }

  String tAddImage() {
    if (getLanguge() == 'AR') {
      return ' تحديد صورة  ';
    } else {
      return 'Select Image';
    }
  }

  //Settin

  String tLan() {
    if (getLanguge() == 'AR') {
      return 'الغة  ';
    } else {
      return 'Languge';
    }
  }

  String tDark() {
    if (getLanguge() == 'AR') {
      return 'الوضع المظلم ';
    } else {
      return 'Dark Mode';
    }
  }

  String tnotification() {
    if (getLanguge() == 'AR') {
      return 'الإشعارات ';
    } else {
      return 'Notification';
    }
  }

  //home Screen

  String tSearch() {
    if (getLanguge() == 'AR') {
      return 'البحث  ';
    } else {
      return 'Search';
    }
  }

  String tHeader() {
    if (getLanguge() == 'AR') {
      return 'بيع و شراء  ';
    } else {
      return 'Bay & Sale';
    }
  }

  String tWarning() {
    if (getLanguge() == 'AR') {
      return ' تحذير   ';
    } else {
      return 'Warning';
    }
  }

  String tWarningDetails() {
    if (getLanguge() == 'AR') {
      return ' هل انت تريد تسجيل الخروج ؟  ';
    } else {
      return 'Are you sure want to logout ?';
    }
  }
    String tWarningDelete() {
    if (getLanguge() == 'AR') {
      return ' هل تريد حذف هذا المنتج ؟   ';
    } else {
      return 'Are you sure want to Delete Products ?';
    }
  }

  String tYes() {
    if (getLanguge() == 'AR') {
      return 'نعم   ';
    } else {
      return 'Yes';
    }
  }

  String tNo() {
    if (getLanguge() == 'AR') {
      return ' لا   ';
    } else {
      return 'No';
    }
  }
}
