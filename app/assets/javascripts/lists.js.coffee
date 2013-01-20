# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
  
  # When the modal is closed, clear footer
  modalWindow.on('hidden', -> 
    modalFooter.html(null)
    )
 
  # Creates the HTML for an individual amazon product
  createProductHTML = (product) ->
    title = product.ItemAttributes.Title
    if title.length > 19
      title = product.ItemAttributes.Title.substring(0,20) + '...'
        
    result = '<div class="amazon-product-result">'+
      '<img src="'+product.SmallImage.URL+'"/>' +
      '<div class="amazon-product-title">'+title+'</div>'+
      '</div>'
    
    return result
  
  # When the modal is loaded, select focus on the first text element
  $('#modal-window').on('shown', -> $('input:text:visible:first', this).focus())

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
            )
      )
  )

  # When the modal is closed, clear footer
  modalWindow.on('hidden', -> 
    modalFooter.html(null)
    )

  # Show Amazon product matches
  showProductMatches = (data) ->
    productsHTML = []
    data.forEach((result)->
        console.log(result)
        productsHTML.push('<div class="amazon-product">'+result.raw.ItemAttributes.Title+
          '<img src="'+result.raw.MediumImage.URL+'"/></div>')
      )
    modalFooter.html(productsHTML)