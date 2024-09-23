var localstoragex = {
  setItem: function(key, value, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'LocalStoragex', 'setItem', [key, value]);
  },
  getItem: function(key, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'LocalStoragex', 'getItem', [key]);
  },
  removeItem: function(key, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'LocalStoragex', 'removeItem', [key]);
  },
  clear: function(successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'LocalStoragex', 'clear', []);
  },
  getAll: function(successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'LocalStoragex', 'getAll', []);
  }
};

module.exports = localstoragex;