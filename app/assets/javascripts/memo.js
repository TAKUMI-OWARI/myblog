$(function(){
  function buildHTML() {
    var html = `<div class="memo">
                  <div class="memo__top">
                    <p class="memo__top__content"></p>
                  </div>
                  <div class="memo__bottom">
                    <div class="memo__bottom__left">
                      <ul class="memo__bottom__left__btns">
                        <li><a class="memo__bottom__left__btns__edit-btn btn-sticky" href="#">EDIT</a></li>
                        <li><a class="memo__bottom__left__btns__delete-btn btn-sticky" href="#">DELETE</a></li>
                      </ul>
                    </div>
                    <ul class="memo__bottom__right">
                      <li class="memo__bottom__right__date"></li>
                      <li class="memo__bottom__right__time"></li>
                    </ul>
                  </div>
                </div>`;
    $('.memos').append(html);
  }
  $('').on('click', function() {
    var content = {}
    $.ajax({
      type: 'POST',
      url: "/memos",
      data: content,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(memo) {
      buildHTML(memo);
    })
    .fail(function() {
      alert('error');
    });
  });
})