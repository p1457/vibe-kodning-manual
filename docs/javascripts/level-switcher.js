// Scroll-hantering för Vibe-Kodning Manual
// Scrollar till toppen vid sidnavigering

(function() {
  'use strict';

  // Scrolla till toppen av sidan
  function scrollToTop() {
    window.scrollTo({ top: 0, behavior: 'instant' });
  }

  // Initiera när DOM är redo
  function init() {
    // Lyssna på MkDocs Material instant navigation
    if (typeof document$ !== 'undefined') {
      document$.subscribe(() => {
        // Scrolla till toppen vid sidnavigering
        scrollToTop();
      });
    }

    // Lyssna även på location changes för säkerhets skull
    if (typeof location$ !== 'undefined') {
      location$.subscribe(() => {
        // Liten fördröjning för att låta sidan renderas
        setTimeout(scrollToTop, 10);
      });
    }
  }

  // Kör när sidan laddats
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
