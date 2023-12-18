function navToggle() {
  let sidebar = document.getElementById('sidebar');
  sidebar.classList.toggle('show');
  let hamburger = document.querySelector('.hamburger')
  hamburger.classList.toggle('is-active');
}