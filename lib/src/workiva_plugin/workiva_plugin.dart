import 'package:extensions_playground/src/workiva_plugin/constants.dart';
import 'package:extensions_playground/src/workiva_plugin/platform_container.dart';
import 'package:extensions_playground/src/workiva_plugin/platform_module.dart';
import 'package:plugin/plugin.dart';

class WorkivaPlugin extends Plugin {
  Platform _container;
  PlatformModule _platformModule;

  @override
  final String uniqueIdentifier = workivaPluginId;

  PlatformModule get platformModule => _platformModule;

  Future<Null> init() async {
    _platformModule = new PlatformModule(this);
    _container = await Platform.create(_platformModule);
  }

  @override
  void registerExtensionPoints(RegisterExtensionPoint register) {
    register(_container.getCommandExtensionPoint().extensionPoint);
    register(_container.getContentEditorFactoryExtensionPoint().extensionPoint);
    register(_container.getContextExtensionPoint().extensionPoint);
    register(_container.getHandlerExtensionPoint().extensionPoint);
    register(_container.getMenuExtensionPoint().extensionPoint);
    register(_container.getViewExtensionPoint().extensionPoint);
  }

  @override
  void registerExtensions(RegisterExtension register) {}
}
