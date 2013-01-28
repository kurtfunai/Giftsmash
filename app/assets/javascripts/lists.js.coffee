# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

<<<<<<< HEAD
#jQuery ->
  #$('.modal-body').html "Hi there!"
  #$('#modal-window').modal 'show'
=======
  
  # When the modal is closed, clear footer
  modalWindow.on('hidden', -> 
    modalFooter.html(null)
    )

  
  # Show Amazon product matches
  showProductMatches = (data) ->
    productsHTML = []

    data.forEach((result)->
        console.log(result)
        productsHTML.push(createProductHTML(result.raw))
      )
    console.log(productsHTML)
    # Passing array to html calls .toString() and trims off commas
    modalFooter.html(productsHTML)

  
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
>>>>>>> 5174f7b... Updated to devise 2.2.3 security fix
