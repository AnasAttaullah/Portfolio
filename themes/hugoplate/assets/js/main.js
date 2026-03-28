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
  const testimonialSlider = document.querySelector(".testimonial-slider");

  if (testimonialSlider && typeof Swiper !== "undefined") {
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
  }
})();
