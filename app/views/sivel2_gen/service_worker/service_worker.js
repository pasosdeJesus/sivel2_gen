function onInstall(event) {
  console.log('[Serviceworker]', "Instalando!", event);
}
function onActivate(event) {
  console.log('[Serviceworker]', "Activando!", event);
}
function onFetch(event) {
  console.log('[Serviceworker]', "Conectado!", event);
}
self.addEventListener('install', onInstall);
self.addEventListener('activate', onActivate);
self.addEventListener('fetch', onFetch);


importScripts(
  "https://storage.googleapis.com/workbox-cdn/releases/6.4.1/workbox-sw.js"
);

// Definimos primero estrategias a usar y la funcion registerRoute
const {CacheFirst, NetworkFirst} = workbox.strategies;
const {registerRoute} = workbox.routing;

// Definimos URL con CecheFirst
registerRoute(
  ({url}) => url.pathname.startsWith('/casos'),
  new CacheFirst({
    cacheName: 'documents',
  })
)


// Definimos URL con NetworkFirst
registerRoute(
  ({request, url}) => request.destination === "document" ||
  request.destination === "",
  new NetworkFirst({
    cacheName: 'documents',
  })
)

// CacheFirst para los scripts e imagenes
registerRoute(
  ({request}) => request.destination === "script" ||
  request.destination === "style",
  new CacheFirst({
    cacheName: 'assets-styles-and-scripts',
  })
)

registerRoute(
  ({request}) => request.destination === "image",
  new CacheFirst({
    cacheName: 'assets-images',
  })
)

// Imagen para no conexión

const {warmStrategyCache} = workbox.recipes;
const {setCatchHandler} = workbox.routing;
const strategy = new CacheFirst();
const urls = ['noconexion'];
// Calienta el caché de tiempo de ejecución con una lista de URL de activos
warmStrategyCache({urls, strategy});
// Activa un controlador 'catch' cuando alguna de las otras rutas no genera una respuesta
setCatchHandler(async ({event}) => {
  switch (event.request.destination) {
    case 'document':
      return strategy.handle({event, request: urls[0]});
    default:
      console.log("no hay fallback para esta solicitud")
      return Response.error();
  }
});
