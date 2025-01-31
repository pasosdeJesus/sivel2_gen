if ('serviceWorker' in navigator) {
  // ⚠️ Verifica que el sitio esté en HTTPS antes de registrar el Service Worker
  if (window.location.protocol !== 'https:') {
    console.warn("[Companion] Service Worker requiere HTTPS. No se registrará en:", window.location.href);
  } else {
    navigator.serviceWorker.register('/sivel22/service-worker.js', { scope: '/sivel22/' })
      .then((registration) => {
        console.log("[Companion]", "Service Worker registrado con éxito en:", registration.scope);
        
        // ✅ Verifica compatibilidad con Background Sync antes de registrarlo
        if ('sync' in registration) {
          return registration.sync.register('sync-forms')
            .then(() => console.log("[Companion]", "Background Sync registrado"))
            .catch(err => console.error("[Companion] Error registrando Background Sync:", err));
        } else {
          console.warn("[Companion] Este navegador no soporta Background Sync.");
        }
      })
      .catch(err => console.error("[Companion] Error registrando Service Worker:", err));
  }
} else {
  console.warn("[Companion] Este navegador no soporta Service Workers.");
}
