class MwpEventRegister
  sessionId = null
  self = this
  
  @registerEvent = (eventName, themeIds) ->
    return unless eventName
    $.post '/mwp-themes-proposal/1/register/'+eventName.toString()+'.json', { session_id: sessionId, theme_id: themeIds }

  @hook = (selector, eventName) ->
    $(selector).click ->
      self.registerEvent(eventName, $(this).attr('data-theme-id'))
  
  @setSessionId = (sid) ->
    sessionId = sid

window.MwpEventRegister = MwpEventRegister
