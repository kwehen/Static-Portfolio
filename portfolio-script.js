
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

const counter = document.querySelector(".counter-number");
async function updateCounter() {
  let response = await fetch("https://eklb6vlsqsazknc4c4pvzaxemi0tytpe.lambda-url.us-east-1.on.aws/");
  let data = await response.json();
  counter.innerHTML = `Visits: ${data}`;
}
updateCounter();
