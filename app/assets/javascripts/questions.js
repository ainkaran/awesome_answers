// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(function () {
  $('#question_tag_list').selectize({
    delimeter: ',',
    persist: false,
    create: function (input) {
      return {
        value: input,
        text: input
      }
    }
  });
})
