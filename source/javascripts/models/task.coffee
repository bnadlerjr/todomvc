window.App ?= {}
window.App.Models ?= {}

class App.Models.Task
    constructor: (params={}) ->
        @title = ko.observable(params.title)
        @completed = ko.observable(params.completed || false)
