//= require jquery/dist/jquery.min
//= require underscore/underscore-min
//= require knockoutjs/dist/knockout
//= require_tree .

jQuery ($) ->
    ko.applyBindings(new App.ViewModels.TaskList())
