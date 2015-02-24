;(function (root) {

  function App () {
    this.prepare();
    this.bind();
  };

  App.prototype.prepare = function () {
    this.elements = {};
    this.elements.$all = $('html, body');
    this.elements.$scrollTo = $('.scroll-to');
    this.elements.$infinite = $('.infinite');
  };

  App.prototype.bind = function () {
    this.elements.$scrollTo.on('click', this.onScrollToClick.bind(this));
    this.elements.$infinite.on('click', this.onInfiniteClick.bind(this));
  };

  App.prototype.onScrollToClick = function (event) {
    var $target = $(event.target).closest('a');
    this.scrollTo($target.attr('href'));
  };

  App.prototype.scrollTo = function (selector) {
    try {
      this.elements.$all.animate({
        scrollTop: $(selector).offset().top
      }, 400);
    } catch (e) {}

    event.preventDefault();
  };

  App.prototype.onInfiniteClick = function (event) {
    var $target = $(event.target).closest('.animated'),
        stop = $target.data('stop-animation');

    try {
      if (stop) {
        $target.removeClass(stop);
      }
    } catch (e) {}
  };

  root.App = App;

} (window))
