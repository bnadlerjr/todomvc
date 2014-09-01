//= require jquery/dist/jquery.min
//= require knockoutjs/dist/knockout
//= require_tree .

jQuery ($) ->
    ko.applyBindings(new App.ViewModels.TaskList())
