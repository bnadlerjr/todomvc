//= require zeptojs/src/zepto
//= require knockoutjs/dist/knockout
//= require director/build/director.min
//= require_tree .

Zepto ($) ->
    viewModel = new App.ViewModels.TaskList()
    ko.applyBindings(viewModel)
    Router({"/:filter": viewModel.filterBy}).init()
