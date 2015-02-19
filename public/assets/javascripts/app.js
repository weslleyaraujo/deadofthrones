;(function (root) {

  function App () {
    this.prepare();
    this.bind();
  };

  App.prototype.prepare = function () {
    this.elements = {};
    this.elements.$all = $('html, body');
    this.elements.$scrollTo = $('.scroll-to');
  };

  App.prototype.bind = function () {
    this.elements.$scrollTo.on('click', this.scrollTo.bind(this));
  };

  App.prototype.scrollTo = function (event) {
    var $target = $(event.target).closest('a');
    try {
      this.elements.$all.animate({
        scrollTop: $($target.attr('href')).offset().top + 20
      }, 400);
    } catch (e) {}

    event.preventDefault();
  };

  root.App = App;

} (window))
