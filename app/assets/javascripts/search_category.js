$(function() {

  var search_list = $('.newsweeks__articles');

  function appendArticle(article) {
    var html = `<div class="article">
                  <img class="article__image" src="${ article.image_url }">
                  <ul class="article__items">
                    <li class="category">
                      ${ article.category }
                    </li>
                    <li class="title">
                      <a href="${ article.article_url }">${ article.title }</a>
                    </li>
                    <li class="date">
                      ${ article.date }
                    </li>
                  </ul>
                </div>`;
    search_list.append(html);
  }
  
  function appendErrorMessage(err_msg) {
    var html = `<li class="search-error">${ err_msg }</li>`
    search_list.append(html);
  }

  function abc() {
    $('#article-category-change').hide();
    $('#article-title-input').hide();
    $('#article-category-input').show();
    $('#article-title-change').show();
  }
  
    $('#article-category-input').on("keyup", function() {
      var input = $('#article-category-input').val();
  
      $.ajax({
        type: 'GET',
        url: '/newsweeks/search_category',
        data: { keyword: input },
        dataType: 'json'
      })
      .done(function(articles) {
        $('.newsweeks__articles').empty()
        $(".pagination").hide();
        if (articles.length !== 0 && input.length !== 0) {
          articles.forEach(function(article){
            appendArticle(article);
          });
        }
        else if (input.length == 0) {
          setTimeout("location.reload()",10);
          abc();
        }
        else {
          appendErrorMessage("一致する記事が見つかりません");
        }
      })
      .fail(function() {
        alert('記事検索に失敗しました');
      })
    })

    $('#article-title-change').on("click", function() {
      $(this).hide();
      $('#article-category-input').hide();
      $('#article-title-input').show();
      $('#article-category-change').show();
    })
  })