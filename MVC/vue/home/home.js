const slider = document.querySelector('.slider');
const slides = slider.querySelectorAll('.slide');
const totalSlides = slides.length;
let currentSlide = 0;

/**
 * Function to show the slide at the given index
 * @param index
 */
function showSlide(index) {
    for(const slide of slides) {
        if (slides[index] === slide) {
            slide.style.display = 'block';
        }
        else {
            slide.style.display = 'none';
        }
    }
}

function AutoSlide() {
    setInterval(() => {
        nextSlide();
    }, 5000);
}

/**
 * Function to show the next slide
 */
function nextSlide() {
    currentSlide = (currentSlide + 1) % totalSlides;
    showSlide(currentSlide);
}

/**
 * Function to show the previous slide
 */
function prevSlide() {
    currentSlide = (currentSlide - 1 + totalSlides) % totalSlides;
    showSlide(currentSlide);
}

// Show the first slide
showSlide(currentSlide);
AutoSlide();