# LocalStoragex Cordova Plugin

**LocalStoragex** is a Cordova plugin that provides secure, persistent, key-value storage for both iOS and Android, working similarly to the browser's localStorage API. It supports common operations like storing, retrieving, removing, clearing, and getting all stored items as an object.

## Features
- **Cross-Platform:** Works on both iOS and Android.
- **Persistent Storage:** Uses `UserDefaults` on iOS and `SharedPreferences` on Android.
- **localStorage-like API:** Similar methods as the browser's `localStorage` (`setItem`, `getItem`, `removeItem`, `clear`, `getAll`).

## Installation

1. Clone the repository or install the plugin directly from GitHub:

   ```bash
   cordova plugin add https://github.com/yourusername/localstoragex.git
   ```

2. Alternatively, add the plugin by specifying the path:

   ```bash
   cordova plugin add /path/to/localstoragex
   ```

## Methods

### 1. `setItem(key, value, successCallback, errorCallback)`
Stores a key-value pair persistently.

```js
localstoragex.setItem('username', 'Kaan', function() {
    console.log('Item stored');
}, function(err) {
    console.log('Error storing item:', err);
});
```

### 2. `getItem(key, successCallback, errorCallback)`
Retrieves the value associated with the given key.

```js
localstoragex.getItem('username', function(value) {
    console.log('Retrieved value:', value);
}, function(err) {
    console.log('Error retrieving item:', err);
});
```

### 3. `removeItem(key, successCallback, errorCallback)`
Removes the item with the specified key.

```js
localstoragex.removeItem('username', function() {
    console.log('Item removed');
}, function(err) {
    console.log('Error removing item:', err);
});
```

### 4. `clear(successCallback, errorCallback)`
Removes all stored key-value pairs.

```js
localstoragex.clear(function() {
    console.log('All items cleared');
}, function(err) {
    console.log('Error clearing items:', err);
});
```

### 5. `getAll(successCallback, errorCallback)`
Returns all stored key-value pairs as an object.

```js
localstoragex.getAll(function(items) {
    console.log('All items:', items);
}, function(err) {
    console.log('Error retrieving items:', err);
});
```

## Example Usage

Here is an example demonstrating the basic usage of the plugin:

```js
// Store a value
localstoragex.setItem('token', '12345', function() {
    console.log('Token saved');
}, function(err) {
    console.log('Error:', err);
});

// Retrieve the stored value
localstoragex.getItem('token', function(value) {
    console.log('Token:', value);
}, function(err) {
    console.log('Error retrieving token:', err);
});

// Remove a stored value
localstoragex.removeItem('token', function() {
    console.log('Token removed');
}, function(err) {
    console.log('Error removing token:', err);
});

// Get all stored key-value pairs
localstoragex.getAll(function(items) {
    console.log('Stored items:', items);
}, function(err) {
    console.log('Error retrieving items:', err);
});

// Clear all stored items
localstoragex.clear(function() {
    console.log('All items cleared');
}, function(err) {
    console.log('Error clearing items:', err);
});
```

## Supported Platforms
- **iOS**
- **Android**

## Contributing

We welcome contributions! Please submit issues and pull requests to help improve this plugin.

### Steps to Contribute:
1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/new-feature`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature/new-feature`).
5. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Happy coding!
