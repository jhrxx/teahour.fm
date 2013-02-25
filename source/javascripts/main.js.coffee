do ->
  noop = ->
  methods = ['assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
    'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
      'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
      'timeStamp', 'trace', 'warn']

  console = (window.console or= {})

  for i in [0..methods.length]
      method = methods[i]
      console[method] or= noop

  true

window.location_pathname = ->
  location.pathname.replace(/index.\w+$/, '')

audioPlayer = ->
  if (Modernizr.audio && Modernizr.audio.mp3 is "")
    audio = $("audio")
    audio.replaceWith("""<embed src="#{audio.find('source').attr('src')}" autostart=false width='100%' height=20 enablejavascript="true" >""")

shareToSocial = ->
  addthis_config = {"data_track_addressbar":true, services_compact:'sinaweibo,twitter,facebook,linkedin,email'}
  $(".icons-share").each (idx, elem) ->
    addthis.button(elem, addthis_config, { url: window.location.protocol + "//" + window.location.host + $(elem).data('url'), title: "[Teahour.fm] " + $(elem).data('title') } )

$ ->
  audioPlayer()
  shareToSocial()
  $(".toggle-notes").click (e) ->
    e.preventDefault()
    e.stopPropagation()
    notes = $(this).parent().siblings(".notes")
    if ( notes.css('display') is 'none')
      notes.show()
      $(this).siblings('p').remove()
    else
      notes.hide()
      $(this).parent().prepend("<p>...</p>")
  $(".toggle-notes").click()

# Modernizr.load [
  # {
    # load: '/javascripts/vendor/plugins/jquery.meca-2.1.0.js',
    # # callback: (url, result, key) -> console.log url, result, key
    # complete: ->
      # $ ->
        # $('a[href^="#"]:not([data-toggle])').meca('smoothScroll')
        # $('.over').meca('hover')
        # $('a[rel~="external"]').meca('external')
  # }
# ]
