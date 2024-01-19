import 'package:event_bus/event_bus.dart';

import 'logger.dart';

///@author: cs_onah
///description: shared resources for vemdot app

/// A default instance of [EventBus] shared by the app,
/// this is initialised once and serve as a singleton
/// for broadcasting and listening to events.
EventBus eventBus = EventBus();

///Global logger variable
///usage log("Hello world)
Logger log = Logger.instance;
