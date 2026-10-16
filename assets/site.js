(function () {
  var links = Array.prototype.slice.call(document.querySelectorAll(".toc a"));
  var heads = links.map(function (a) {
    var id = decodeURIComponent(a.getAttribute("href").slice(1));
    return { a: a, el: document.getElementById(id) };
  }).filter(function (h) { return h.el; });

  function mark() {
    if (!heads.length) return;
    var y = window.scrollY + 200;
    var cur = heads[0];
    for (var i = 0; i < heads.length; i++) {
      if (heads[i].el.getBoundingClientRect().top + window.scrollY <= y) cur = heads[i];
    }
    for (var j = 0; j < heads.length; j++) heads[j].a.classList.toggle("active", heads[j] === cur);
  }
  if (heads.length) {
    document.addEventListener("scroll", mark, { passive: true });
    mark();
  }

  var stars = document.querySelectorAll("a.star[data-repo]");
  for (var k = 0; k < stars.length; k++) {
    (function (a) {
      fetch("https://api.github.com/repos/" + a.getAttribute("data-repo"), {
        headers: { Accept: "application/vnd.github+json" }
      }).then(function (r) {
        return r.ok ? r.json() : null;
      }).then(function (d) {
        if (!d || typeof d.stargazers_count !== "number") return;
        var n = a.querySelector(".star-count");
        if (n) n.textContent = String(d.stargazers_count);
      }).catch(function () {});
    })(stars[k]);
  }
})();
