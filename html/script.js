const thumbnails = document.querySelectorAll('.my-img');
const popup = document.querySelector('.popup');
const enlargedImage = document.querySelector('.enlarged');
const closeBtn = document.querySelector('.popup-close-btn');

thumbnails.forEach((thumbnail) => {
thumbnail.addEventListener('click', (event) => {
    event.preventDefault();
    const src = event.target.src;
    enlargedImage.src = src;
    popup.style.display = 'block';
});
});

closeBtn.addEventListener('click', () => {
popup.style.display = 'none';
});

    // Add touch event handling for mobile devices
const imageContainers = document.querySelectorAll('.image-container');
imageContainers.forEach(function(container) {
    container.addEventListener('touchstart', function() {
    container.classList.add('touch-hover');
    });
    container.addEventListener('touchend', function() {
    container.classList.remove('touch-hover');
    });
});

// Make the hamburger menu persistent when scrolling
window.addEventListener('scroll', function() {
    const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
    if (scrollTop > 0) {
    menuToggle.classList.add('fixed');
    } else {
    menuToggle.classList.remove('fixed');
    }
});

const menuToggle = document.querySelector('.menu-toggle');
const sidebar = document.querySelector('.sidebar');
const imageContainerWrap = document.querySelector('.image-container-wrap');

menuToggle.addEventListener('click', function() {
menuToggle.classList.toggle('open');
sidebar.classList.toggle('open');
imageContainerWrap.classList.toggle('open');
});

imageContainerWrap.addEventListener('click', function() {
menuToggle.classList.remove('open');
sidebar.classList.remove('open');
imageContainerWrap.classList.remove('open');
});