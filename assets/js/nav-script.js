function navToggle() {
  let sidebar = document.getElementById('sidebar');
  sidebar.classList.toggle('show');
  let hamburger = document.querySelector('.hamburger')
  hamburger.classList.toggle('is-active');
}

const sidebarLinks = document.querySelectorAll('.sidebar-nav a');
const documentFileName = window.location.pathname.split('/').pop();

var matchingLinks = [];

sidebarLinks.forEach(function(link) {
  var linkHref = link.getAttribute('href').split('#')[0];
  var linkFileName = linkHref.split('/').pop();
  if (linkFileName === documentFileName)
    matchingLinks.push(link);

});


const headers = document.querySelectorAll(
  "h1:not(.sidebar-nav h1), " +
  "h2, " +
  "h3"
);


// // Jump to to current document's title in the sidebar

document.addEventListener('DOMContentLoaded', function() {
  var pageTitle = document.title;

  var targetLink = null;

  matchingLinks.forEach(function(link) {
    if (pageTitle.includes(link.textContent.trim())) 
    {
      targetLink = link;
      return;
    }
  });

  if (targetLink) {
    targetLink.classList.add('in-view');
    targetLink.scrollIntoView({
      behavior: 'instant',
      block: 'center'
    });
  }
});

// Highlight the header in the sidebar you're currently scrolling at in the main body

window.addEventListener("scroll", () => {
  headers.forEach((header) => {
    const headerTop = header.offsetTop;
    const headerHeight = header.clientHeight;

    if (scrollY >= (headerTop - 100) - headerHeight)
    {
      current = header;
    }

    matchingLinks.forEach((link) => {
      link.classList.remove("in-view");
      if (link.textContent == current.textContent)
      {
        link.classList.add('in-view');
      }
    });
  });
});
