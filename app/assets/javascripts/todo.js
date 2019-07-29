$(function() {
  var todo_list = $('.todos');
  function buildHTML(todo) {
    var html = `<li class="todo">
                  <form action="#">
                    <input class="todo__check-btn" id=${ todo.id } type="checkbox">
                    <label class="todo__text-content" for=${ todo.id } id="text">${ todo.content }</label>
                    <button class="todo__delete-btn btn-text-3d">
                      <a rel="nofollow" data-method="delete" href="/todos/${ todo.id }">削除</a>
                    </button>
                  </form>
                </li>`;
    return html;
  }

  $('.post-form').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
      type: 'POST',
      url: "/todos",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(todo) {
      var html = buildHTML(todo);
      $('.todos').append(html);
      $('.post-form')[0].reset();
      $('.post-form__submit').prop('disabled', false);
      $('.todos').animate({scrollTop: $('.todos')[0].scrollHeight});
    })
    .fail(function() {
      alert('error');
    });
  });

  $('.todo__check-btn#box').on('click', function() {
    $(this).toggleClass('active');
    $('.todo__text-content#text').toggleClass('active');
  });
});