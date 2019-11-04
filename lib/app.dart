import 'dart:io';

//import 'package:common_utils/common_utils.dart';
import 'package:espo_crm_client/globalbasestate/action.dart';
import 'package:espo_crm_client/model/firebase_user.dart';
import 'package:espo_crm_client/views/concact_sync_page/page.dart';
import 'package:flutter/material.dart' hide Action;

import 'package:fish_redux/fish_redux.dart';

//import 'package:movie/actions/apihelper.dart';
import 'package:espo_crm_client/views/account_page/page.dart';

//import 'package:movie/views/coming_page/page.dart';
//import 'package:movie/views/createlist_page/page.dart';
//import 'package:movie/views/discover_page/page.dart';
//import 'package:movie/views/episodedetail_page/page.dart';
//import 'package:movie/views/favorites_page/page.dart';
//import 'package:movie/views/firebaselogin_page/page.dart';
//import 'package:movie/views/gallery_page/page.dart';
//import 'package:movie/views/home_page/page.dart';
//import 'package:movie/views/listdetail_page/page.dart';
import 'package:espo_crm_client/views/login_page/page.dart';
import 'package:espo_crm_client/views/main_page/page.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:movie/views/moviedetail_page/page.dart';
//import 'package:movie/views/mylists_page/page.dart';
//import 'package:movie/views/peopledetail_page/page.dart';
//import 'package:movie/views/register_page/page.dart';
//import 'package:movie/views/seasondetail_page/page.dart';
//import 'package:movie/views/seasons_page/page.dart';
//import 'package:movie/views/test_page/page.dart';
//import 'package:movie/views/tvdetail_page/page.dart';
//import 'package:movie/views/watchlist_page/page.dart';
//import 'package:movie/views/watchlistdetail_page/page.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'globalbasestate/state.dart';
import 'globalbasestate/store.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:espo_crm_client/actions/shared_preferences.dart' as prefs;

Future<Credentials> _init() async {
  if (Platform.isAndroid) {
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler()
            .requestPermissions([PermissionGroup.contacts]);
  }

  var loadUser = prefs.loadUser();
  return loadUser;
}

AbstractRoutes pages() {
  return PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'mainpage': MainPage(),
      'contactSyncPage' : ConctactSyncPage(),
//      'homePage': HomePage(),
//      'discoverPage': DiscoverPage(),
//      'comingPage': ComingPage(),
      'accountPage': AccountPage(),
      'loginpage': LoginPage(),
//      'moviedetailpage': MovieDetailPage(),
//      'tvdetailpage': TVDetailPage(),
//      'peopledetailpage': PeopleDetailPage(),
//      'seasondetailpage': SeasonDetailPage(),
//      'episodedetailpage': EpisodeDetailPage(),
//      'MoreMediaPage': MoreMediaPage(),
//      'SeasonsPage': SeasonsPage(),
//      'MyListsPage': MyListsPage(),
//      'ListDetailPage': ListDetailPage(),
//      'FavoritesPage': FavoritesPage(),
//      'WatchlistPage': WatchlistPage(),
//      'WatchlistDetailPage': WatchlistDetailPage(),
//      'detailpage': detail.MovieDetailPage(),
//      'GalleryPage': GalleryPage(),
//      'firebaseLoginPage': FirebaseLoginPage(),
//      'registerPage': RegisterPage(),
//      'createListPage': CreateListPage(),
//      'testPage': TestPage(),
    },
    visitor: (String path, Page<Object, dynamic> page) {
      if (page.isTypeof<GlobalBaseState>()) {
        page.connectExtraStore<GlobalState>(
            GlobalStore.store, connectGlobalStore);
      }
      page.enhancer.append(
        /// View AOP
        viewMiddleware: <ViewMiddleware<dynamic>>[
          safetyView<dynamic>(),
        ],

        /// Adapter AOP
        adapterMiddleware: <AdapterMiddleware<dynamic>>[
          safetyAdapter<dynamic>()
        ],

        /// Effect AOP
        effectMiddleware: [
          _pageAnalyticsMiddleware<dynamic>(),
        ],

        /// Store AOP
        middleware: <Middleware<dynamic>>[
          logMiddleware<dynamic>(tag: page.runtimeType.toString()),
        ],
      );
    },
  );
}

Future<Widget> createApp() async {
  Credentials credentials = await _init();

  credentials = new Credentials.simple(
      baseUrl: "https://crm.devorel.com", username: "gelo", password: "52urgwydwgjer");

  GlobalStore.store.dispatch(GlobalActionCreator.setUser(credentials));

  final AbstractRoutes routes = pages();
  final ThemeData _lightTheme = ThemeData.light();
  final ThemeData _darkTheme = ThemeData.dark();

  return MaterialApp(
    title: 'EspoCrm',
    debugShowCheckedModeBanner: false,
    theme: _lightTheme,
    darkTheme: _darkTheme,
    home: routes.buildPage('mainpage', {
      'pages': [
//        routes.buildPage('homePage', null),
//        routes.buildPage('discoverPage', null),
//        routes.buildPage('comingPage', null),
        routes.buildPage('accountPage', null)
      ]
    }),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}

EffectMiddleware<T> _pageAnalyticsMiddleware<T>({String tag = 'redux'}) {
  return (AbstractLogic<dynamic> logic, Store<T> store) {
    return (Effect<dynamic> effect) {
      return (Action action, Context<dynamic> ctx) {
        if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
          print('${logic.runtimeType} ${action.type.toString()} ');
        }
        return effect?.call(action, ctx);
      };
    };
  };
}
