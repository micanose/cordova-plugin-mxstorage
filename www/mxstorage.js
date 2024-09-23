var mxstorage = {
  setItem: function(key, value, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'mxstorage', 'setItem', [key, value]);
  },
  getItem: function(key, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'mxstorage', 'getItem', [key]);
  },
  removeItem: function(key, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'mxstorage', 'removeItem', [key]);
  },
  clear: function(successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'mxstorage', 'clear', []);
  },
  getAll: function(successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'mxstorage', 'getAll', []);
  }
};

module.exports = mxstorage;