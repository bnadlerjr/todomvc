//= require zeptojs/src/zepto
//= require knockoutjs/dist/knockout
//= require_tree .

Zepto ($) ->
    ko.applyBindings(new App.ViewModels.TaskList())
