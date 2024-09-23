import Foundation
import Cordova

@objc(LocalStoragex) class LocalStoragex: CDVPlugin {

    @objc(setItem:)
    func setItem(command: CDVInvokedUrlCommand) {
        let key = command.arguments[0] as? String ?? ""
        let value = command.arguments[1] as? String ?? ""

        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()

        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "Item stored")
        self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
    }

    @objc(getItem:)
    func getItem(command: CDVInvokedUrlCommand) {
        let key = command.arguments[0] as? String ?? ""
        let value = UserDefaults.standard.string(forKey: key)

        let pluginResult: CDVPluginResult
        if let value = value {
            pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: value)
        } else {
            pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Item not found")
        }
        self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
    }

    @objc(removeItem:)
    func removeItem(command: CDVInvokedUrlCommand) {
        let key = command.arguments[0] as? String ?? ""

        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()

        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "Item removed")
        self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
    }

    @objc(clear:)
    func clear(command: CDVInvokedUrlCommand) {
        if let appDomain = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: appDomain)
        }
        UserDefaults.standard.synchronize()

        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "All items cleared")
        self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
    }

    @objc(getAll:)
    func getAll(command: CDVInvokedUrlCommand) {
        let defaults = UserDefaults.standard
        let dict = defaults.dictionaryRepresentation()

        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: dict)
        self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
    }
}