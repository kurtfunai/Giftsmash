jQuery ->
  
  # When the modal is loaded, select focus on the first text element
  modalWindow = $('#modal-window')
  modalFooter = $('#modal-footer')
  modalWindow.on('shown', -> 
    $('input:text:visible:first', this).focus()
    
    # When the focus is blurred from the first text element, perform search
    if $('#item_name')
      txtItemName = $('#item_name')
      txtItemName.blur( ->
        query = txtItemName.val()
        if query 
          $.getJSON('/amazon/search/'+query+'.json',(data)->
            showProductMatches(data)
            $('.amazon-product').click(->
                chooseProduct($(this))
              )
            )
        )
    )

  # When the modal is closed, clear footer
  modalWindow.on('show', -> 
    modalFooter.html(null)
    )

  chooseProduct = (object) ->
    $('.amazon-product').each(->
        $(this).removeClass('selected')
      )
    object.addClass('selected')
    $('#item_asin').val(object.attr('data-asin'))
    
  
  # Creates the HTML for an individual amazon product
  createProductHTML = (product) ->
    if (typeof(product.MediumImage) == 'undefined')
      return

    title = product.ItemAttributes.Title
    if title.length > 19
      title = product.ItemAttributes.Title.substring(0,20) + '...'

    compiled = _.template('<div class="amazon-product" data-asin="<%= asin %>"> 
        <div class="amazon-product-image"><img src="<%= image %>"/></div>
        <div class="amazon-product-title"><%= title %></div>
        </div>
      ');
    result = compiled({asin : product.ASIN, title : title, image : product.MediumImage.URL});
    
    return result

  # Show Amazon product matches
  showProductMatches = (data) ->
    console.log(data)
    productsHTML = []
    data.forEach((result)->
        # console.log(result.raw)
        productsHTML.push(createProductHTML(result.raw))
      )
    modalFooter.html(productsHTML)
