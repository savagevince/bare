"use strict";

(function(module) {
  var QUESTION_MARK_COUNT = 2
  function interrobangSmiley(text) {
    return text + "?".repeat(QUESTION_MARK_COUNT) + "!" + " :)"
  }
  module.interrobangSmiley = interrobangSmiley;
})(this);
