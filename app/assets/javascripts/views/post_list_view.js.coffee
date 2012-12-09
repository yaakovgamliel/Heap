Heap.PostListView = Em.View.extend
  templateName: 'post_list'
  classNames: 'post_list'
  didInsertElement: ->
    el = @get('element')
    console.log "view element: ", el
    $(el).height($(window).height())
    @set('scroller', new iScroll(el))
    
