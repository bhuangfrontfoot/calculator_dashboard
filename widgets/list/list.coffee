class Dashing.List extends Dashing.Widget
  ready: ->
    if @get('unordered')
      $(@node).find('ol').remove()
      if @get('unlabelled')
        ulElement = $(@node).find('ul')
        ulElement.addClass('unlabelled-list')
        ulElement.removeClass('list-nostyle')
    else
      $(@node).find('ul').remove()
