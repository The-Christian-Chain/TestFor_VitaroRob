import consumer from "./consumer"

consumer.subscriptions.create("PostChannel", {
  connected() {},
  disconnected() {},
  received(data) {
    $('#msg').prepend('<div class="message">' + data.content + '</div>')
  }
});

var submit_messages;

$(document).on('turbolinks:load', 
  function() {
    submit_messages()
  }
)

submit_messages = function () {
  var $this, textarea
  $this = $(this);
  textarea = $this.find('#message_content');
  $('#message_content').on('keydown', function (event) {
    if (event.keyCode === 13){
      $('input').click()
      event.preventDefault()
      $('#message_content').val('')
    }
  })
}