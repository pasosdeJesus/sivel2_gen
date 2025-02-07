export default class Asistente {
  static conectar(){
    console.log("* Corriendo Asistente.conectar()")
    Msip__Motor.arreglarPuntoMontaje()
    if (navigator.serviceWorker) {
      // Verifica que el sitio esté en HTTPS antes de registrar el Service Worker
      if (window.location.protocol !== 'https:') {
        console.warn("[Asistente] Service Worker requiere HTTPS. No se registrará en:", window.location.href);
      } else {
        navigator.serviceWorker.register(window.puntoMontaje + "service-worker.js", { scope: window.puntoMontaje })
          .then((registration) => {
            navigator.serviceWorker.ready
            console.log("[Asistente]", "Service Worker registrado con éxito en:", registration.scope);
            if ('sync' in registration) {
              if ("SyncManager" in window) {
                return registration.sync.register("sync-forms")
                  .then(() => console.log("[Asistente]", "Background Sync registrado"))
                  .catch(err => console.error("[Asistente] Error registrando Background Sync:", err));
              } else {
                windo.walert("Este navegador no soporta background sync.")
              }
            }
          }).then(() => console.log("[Asistente]", "Service worker registrado con éxito!"));
      }
    } else {
      console.warn("[Asistente] Este navegador no soporta Service Workers.");
    }
  }
}
