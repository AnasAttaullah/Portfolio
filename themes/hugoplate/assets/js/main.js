// main script
(function () {
  "use strict";

  // Dropdown Menu Toggler For Mobile
  // ----------------------------------------
  const dropdownMenuToggler = document.querySelectorAll(
    ".nav-dropdown > .nav-link",
  );

  dropdownMenuToggler.forEach((toggler) => {
    toggler?.addEventListener("click", (e) => {
      e.target.closest('.nav-item').classList.toggle("active");
    });
  });

  // Testimonial Slider
  // ----------------------------------------
  const initTestimonialSlider = () => {
    const testimonialSlider = document.querySelector(".testimonial-slider");

    if (!testimonialSlider) {
      return true;
    }

    if (testimonialSlider.classList.contains("swiper-initialized")) {
      return true;
    }

    if (typeof Swiper === "undefined") {
      return false;
    }

    const testimonialSlides = testimonialSlider.querySelectorAll(
      ".swiper-slide",
    ).length;

    new Swiper(".testimonial-slider", {
      spaceBetween: 24,
      slidesPerView: 1,
      loop: testimonialSlides > 1,
      pagination: {
        el: ".testimonial-slider-pagination",
        type: "bullets",
        clickable: true,
      },
      breakpoints: {
        768: {
          slidesPerView: 2,
        },
        992: {
          slidesPerView: 3,
        },
      },
    });

    return true;
  };

  const loadSwiperFallback = () => {
    if (document.querySelector('script[data-swiper-fallback="true"]')) {
      return;
    }

    const fallbackStyles = document.createElement("link");
    fallbackStyles.rel = "stylesheet";
    fallbackStyles.href =
      "https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css";
    fallbackStyles.setAttribute("data-swiper-fallback", "true");
    document.head.appendChild(fallbackStyles);

    const fallbackScript = document.createElement("script");
    fallbackScript.src =
      "https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js";
    fallbackScript.async = true;
    fallbackScript.setAttribute("data-swiper-fallback", "true");
    fallbackScript.onload = () => {
      initTestimonialSlider();
    };
    document.head.appendChild(fallbackScript);
  };

  if (!initTestimonialSlider()) {
    let attempts = 0;
    const maxAttempts = 15;

    const retryTimer = window.setInterval(() => {
      attempts += 1;

      if (initTestimonialSlider()) {
        window.clearInterval(retryTimer);
        return;
      }

      if (attempts >= maxAttempts) {
        window.clearInterval(retryTimer);
        if (typeof Swiper === "undefined") {
          loadSwiperFallback();
        }
      }
    }, 200);

    window.addEventListener(
      "load",
      () => {
        if (!initTestimonialSlider() && typeof Swiper === "undefined") {
          loadSwiperFallback();
        }
      },
      { once: true },
    );
  }
})();
