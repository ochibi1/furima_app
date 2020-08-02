$(function() {
  function appendOption(category) {
    let html = `<option value=${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  };

  function appendChidrenBox(insertHTML){
    let childSelectHtml = `<select class="sell__item-category" id="category_child" name="product[category_products_attributes][0][category_id]">
                             <option value="---" data-category="---">---</option>
                             ${insertHTML}
                           <select>`;
    $('#category_parent').parent().append(childSelectHtml);
  }

  function appendGrandChidrenBox(insertHTML){
    let grandChildSelectHtml = `<select class="sell__item-category" id="category_grandchild" name="product[category_products_attributes][0][category_id]">
                             <option value="---" data-category="---">---</option>
                             ${insertHTML}
                           <select>`;
    $('#category_child').parent().append(grandChildSelectHtml);
  }

  $('#category_parent').on('change', function() {
    let parentValue = $(this).val();
    $.ajax( {
      url: '/products/search_category_children',
      type: 'GET',
      data: { parent_id: parentValue },
      dataType: 'json'
    })
    .done(function(children) {
      $('#category_child').remove();
      $('#category_grandchild').remove();
      let insertHTML = '';
        $.each(children,function(i, child) {
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
    })
    .fail(function() {
      alert('カテゴリー取得に失敗しました');
    })
  });

  $(document).on('change', '#category_child', function() {
    let childValue = $(this).val();
    $.ajax( {
      url: '/products/search_category_grandchildren',
      type: 'GET',
      data: { child_id: childValue },
      dataType: 'json'
    })
    .done(function(grandChildren) {
      $('#category_grandchild').remove();
      let insertHTML = '';
        $.each(grandChildren,function(i, grandChild) {
          insertHTML += appendOption(grandChild);
        });
        appendGrandChidrenBox(insertHTML);
    })
    .fail(function() {
      alert('カテゴリー取得に失敗しました');
    })
  });
});