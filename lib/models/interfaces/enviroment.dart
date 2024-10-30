
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment{


  static initEnvironment() async {
    await dotenv.load(fileName: '.env');

  }

  static String apiURL=dotenv.env['API_URL']?? 'no hay URL configurada';
}