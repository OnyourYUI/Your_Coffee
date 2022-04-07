'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "e2cf19213a9d5b1a77697553615bac42",
"assets/assets/images/Americano%2520hot%2520wep.jpg": "1ae404422d930cb0105143393d7a36f2",
"assets/assets/images/Americano%2520ice%2520wep.jpg": "cb15f4742a1f96b8ec7bb3c3657930dc",
"assets/assets/images/Arabica%2520beans.jpg": "0eac1ac37f9595136728e65e277903c2",
"assets/assets/images/Cappuccino%2520Frappe%2520wep.jpg": "5221b99d4532e8d9ce1729eb7eaac513",
"assets/assets/images/cappuccino%2520hot%2520wep.jpg": "2b49794ddce94b5163b5e1b181495a88",
"assets/assets/images/cappuccino%2520ice%2520pinterest.jpg": "244ea2045295c52e3bb5e2d0d9bbebee",
"assets/assets/images/Coffe%2520Logo.jpg": "6e12e6667798333abffccaee2f2f95f1",
"assets/assets/images/doi%2520chang%2520wep.jpg": "d69e3e05122aecbec8805fc7102dd43c",
"assets/assets/images/Doppio%2520hot%2520wep.jpg": "44d67df23a543e39a4236da57e70229f",
"assets/assets/images/Espresso%2520freppe.jpg": "3534815365c15325085acaa04756dd9b",
"assets/assets/images/Espresso%2520hot%2520wep.jpg": "3eae752749efa5921ac9864ccf683852",
"assets/assets/images/Espresso%2520ice%2520pinterest.jpg": "cb12d08148d7d5f4d2b7c87391221157",
"assets/assets/images/Excelsa%2520wep.jpg": "59d2a05e302216d81f45df2be5c4bb2d",
"assets/assets/images/FlatWhite%2520hot%2520wep.jpg": "da9297e22a9e135642206b07e72bacf2",
"assets/assets/images/Latte%2520hot%2520wep.jpg": "13e10e347a2cd6abfb0ae1281f5af452",
"assets/assets/images/Latte%2520ice%2520pinterest.jpg": "9ecf44ed1f554f05c26bbd031adb4e6e",
"assets/assets/images/Latte%2520shake%2520pinterest.jpg": "37ed7886ceecd3c3241d8b69c4a2a3f5",
"assets/assets/images/Liberica%2520wep.jpg": "68121bc587d1a4dc93f0a6354aecd9c4",
"assets/assets/images/Macchito%2520freppe.jpg": "d7510b25a03b3e28e09b4bce8a731782",
"assets/assets/images/Mocca%2520hot%2520wep.jpg": "343f01e49f7800839fa8d16f09bc865c",
"assets/assets/images/Mocca%2520ice%2520wep.jpg": "de1ee1152395ee8f426b01a18b78d545",
"assets/assets/images/mocca%2520shake%2520pinterest.jpg": "2bdea9ae15675be78c934faab29645d2",
"assets/assets/images/profile.jpg": "cb94cd648a4451e15bbe079b3905524e",
"assets/assets/images/Robusta%2520beans.jpg": "3a434b15283692a79d664fca486e34f3",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "8b5f0b8e497484f7604f333baa4fbc5b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "b5a93ba589d76be8a54b23942642dda9",
"/": "b5a93ba589d76be8a54b23942642dda9",
"main.dart.js": "b17f0d9c5cfe2157b3a59510005b612f",
"manifest.json": "37ce33793216171b6311de5cada02673",
"version.json": "cd439fc5c7fe2f0870edf2822785aa01"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
