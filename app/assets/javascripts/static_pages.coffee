# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$.get('getlogin').done (data) ->
  $('div#userLogin').innerHTML = data

$ ->
  $("a#getLogin").click (e) ->
    e.preventDefault()
    $.get('getlogin').done (data) ->
      $('div#userLogin').html(data)


$ ->
  $("a#getSignup").click (e) ->
    e.preventDefault()
    $.get('getsignup').done (data) ->
      $('div#userLogin').html(data)